using BookingFlightService.BookingFlightBL.Requests;
using BookingFlightService.BookingFlightDAL.DBContexts;
using BookingFlightService.BookingFlightDAL.Models;
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
        IDictionary<DateTime, IDictionary<string, bool>> ExistingBookings;

        List<string> SeatsList;

        private readonly BookingContext _context;

        public BookingValidator(BookingContext context)
        {
            _context = context;
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

            if (IsSeatAlreadyTaken(bookingRequest))
                throw new ArgumentException("The seat is already taken");

            UpdateExistingBookings(bookingRequest);
        }

        private List<string> GetAllSeats()
        {
            return _context.Seats.Select(seat => seat.Place).ToList();
        }

        private IEnumerable<Booking> GetAllBookings()
        {
            return _context.Bookings.ToList();
        }

        private IDictionary<DateTime, IDictionary<string, bool>> GetExistingBookings()
        {
            IDictionary<DateTime, IDictionary<string, bool>> existingBookings = new Dictionary<DateTime, IDictionary<string, bool>>();
            var listOfBookings = GetAllBookings();
            foreach (var booking in listOfBookings)
            {
                if (existingBookings.ContainsKey(booking.Date))
                {
                    existingBookings[booking.Date][booking.Seat] = true;
                }
                else
                {
                    existingBookings.Add(booking.Date, new Dictionary<string, bool>());
                    foreach (var seat in SeatsList)
                        existingBookings[booking.Date].Add(seat, false);
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
            if (!ExistingBookings.ContainsKey(bookingRequest.Date))
                return false;
            return ExistingBookings[bookingRequest.Date][bookingRequest.Seat];
        }

        private void UpdateExistingBookings(BookingRequest bookingRequest)
        {
            if (!ExistingBookings.ContainsKey(bookingRequest.Date))
            {
                ExistingBookings.Add(bookingRequest.Date, new Dictionary<string, bool>());
                foreach (var seat in SeatsList)
                    ExistingBookings[bookingRequest.Date].Add(seat, false);

            }
            ExistingBookings[bookingRequest.Date][bookingRequest.Seat] = true;
        }
    }
}
