namespace BookingFlightService.Requests
{
    public class BookingRequest
    {
        public string PassengerName { get; set; }

        public string Seat { get; set; }

        public DateTime Date { get; set; }
    }
}
