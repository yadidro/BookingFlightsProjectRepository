using static System.Runtime.InteropServices.JavaScript.JSType;

namespace BookingFlightService.BookingFlightDAL.Models
{
    public class Booking
    {
        public int ID { get; set; }

        public string PassengerName { get; set; }

        public string Seat { get; set; }

        public DateTime Date { get; set; }
    }
}
