using BookingFlightService.BookingFlightBL.Requests;
using BookingFlightService.BookingFlightDAL.DBContexts;
using BookingFlightService.BookingFlightDAL.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.Text.RegularExpressions;

namespace BookingFlightBL
{

    public interface IBookingValidator
    {
        void ValidateBooking(BookingRequest bookingRequest);
    }

    public class BookingValidator : IBookingValidator
    {
        private object privateLock = new object();

        IDictionary<string, IDictionary<string, bool>> ExistingBookings;

        List<string> SeatsList;

        private readonly IConfiguration _configuration;
        public BookingValidator(IConfiguration configuration)
        {
            _configuration = configuration;
            SeatsList = GetAllSeats();
            ExistingBookings = GetExistingBookings();
        }

        public void ValidateBooking(BookingRequest bookingRequest)
        {
            if (bookingRequest.PassengerName.IsNullOrEmpty())
                throw new ArgumentException("The passenger name is not valid");

            if (!Regex.IsMatch(bookingRequest.PassengerName, @"^$|^[a-zA-ZÀ-ÖØ-öø-ÿ0-9 ]+$"))
                throw new ArgumentException("passenger name contains special characters");

            if (bookingRequest.Seat.IsNullOrEmpty())
                throw new ArgumentException("The seat is not valid");

            if (!Regex.IsMatch(bookingRequest.Seat, @"^$|^[a-zA-ZÀ-ÖØ-öø-ÿ0-9 ]+$"))
                throw new ArgumentException("Seat contains special characters");

            if (bookingRequest.Date < DateTime.Now)
                throw new ArgumentException("The date is not valid");

            if (!IsSeatExist(bookingRequest.Seat))
                throw new ArgumentException("The seat does not exist");

            lock (privateLock)
            {
                if (IsSeatAlreadyTaken(bookingRequest))
                    throw new ArgumentException("The seat is already taken");

                UpdateExistingBookings(bookingRequest);
            }
        }

        private List<string> GetAllSeats()
        {
            using (BookingContext context = new BookingContext(_configuration))
            {
                return context.Seats.Select(seat => seat.Place).ToList();
            };  
        }

        private IEnumerable<Booking> GetAllBookings()
        {
            using (BookingContext context = new BookingContext(_configuration))
            {
                return context.Bookings.ToList();
            };
        }

        private IDictionary<string, IDictionary<string, bool>> GetExistingBookings()
        {
            IDictionary<string, IDictionary<string, bool>> existingBookings = new Dictionary<string, IDictionary<string, bool>>();
            var listOfBookings = GetAllBookings();
            foreach (var booking in listOfBookings)
            {
                var dateInString = booking.Date.ToString("MM/dd/yyyy hh:mm");
                if (existingBookings.ContainsKey(dateInString))
                {
                    existingBookings[dateInString][booking.Seat] = true;
                }
                else
                {
                    existingBookings.Add(dateInString, new Dictionary<string, bool>());
                    foreach (var seat in SeatsList)
                        existingBookings[dateInString].Add(seat, false);
                }
            }
            return existingBookings;
        }

        private bool IsSeatExist(string seat)
        {
            return SeatsList.Contains(seat);
        }

        private bool IsSeatAlreadyTaken(BookingRequest bookingRequest)
        {
            var dateInString = bookingRequest.Date.ToString("MM/dd/yyyy hh:mm");
            if (!ExistingBookings.ContainsKey(dateInString))
                return false;
            return ExistingBookings[dateInString][bookingRequest.Seat];
        }

        private void UpdateExistingBookings(BookingRequest bookingRequest)
        {
            var dateInString = bookingRequest.Date.ToString("MM/dd/yyyy hh:mm");
            if (!ExistingBookings.ContainsKey(dateInString))
            {
                ExistingBookings.Add(dateInString, new Dictionary<string, bool>());
                foreach (var seat in SeatsList)
                    ExistingBookings[dateInString].Add(seat, false);

            }
            ExistingBookings[dateInString][bookingRequest.Seat] = true;
        }
    }
}
