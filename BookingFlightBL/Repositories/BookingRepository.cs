using BookingFlightBL;
using BookingFlightDAL.Models;
using BookingFlightService.BookingFlightBL.Requests;
using BookingFlightService.BookingFlightDAL.DBContexts;
using BookingFlightService.BookingFlightDAL.Models;

namespace BookingFlightService.BookingFlightBL.Repositories
{
    public interface IBookingRepository
    {
        public IEnumerable<Booking> GetAllBookings();

        public void SaveBooking(BookingRequest bookingRequest);
    }

    public class BookingRepository : IBookingRepository
    {
        private readonly BookingContext _context;
        private readonly IBookingValidator _bookingValidator;

        public BookingRepository(BookingContext context, IBookingValidator bookingValidator)
        {
            _context = context;
            _bookingValidator = bookingValidator;
        }

        public IEnumerable<Booking> GetAllBookings()
        {
            return _context.Bookings.ToList();
        }

        public void SaveBooking(BookingRequest bookingRequest)
        {
            _bookingValidator.ValidateBooking(bookingRequest);

            var booking = new Booking()
            {
                PassengerName = bookingRequest.PassengerName,
                Seat = bookingRequest.Seat,
                Date = bookingRequest.Date,
            };

            _context.Bookings.Add(booking);

            _context.SaveChanges();
        }
    }
}
