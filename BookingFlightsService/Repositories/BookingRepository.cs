﻿using BookingFlightService.DBContexts;
using BookingFlightService.Models;
using BookingFlightService.Requests;

namespace BookingFlightService.Repositories
{
    public interface IBookingRepository
    {
        public IEnumerable<Booking> GetAllBookings();

        public void SaveBooking(BookingRequest bookingRequest);
    }

    public class BookingRepository : IBookingRepository
    {
        private readonly BookingContext _context;

        public BookingRepository(BookingContext context)
        {
            _context = context;
        }

        public IEnumerable<Booking> GetAllBookings()
        {
            return _context.Bookings.ToList();
        }

        public void SaveBooking(BookingRequest bookingRequest)
        {
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