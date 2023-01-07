using System.Net;
using System.Net.Http.Json;

namespace ConsoleEventManager
{
    public class ConsumeBookingEvent
    {
        public void GetAllEventData()
        {
            using (var client = new WebClient()) 
            {
                client.Headers.Add("Content-Type:application/json");
                client.Headers.Add("Accept:application/json");
                var result = client.DownloadString("http://localhost:5294/bookings"); 
                Console.WriteLine(Environment.NewLine + result);
            }
        }

        public async Task PostEvent_data(int seatValue) 
        {
            using (var client = new HttpClient())
            {
                var bookingRequest = new BookingRequest(); 
                bookingRequest.PassengerName = "Roy";
                bookingRequest.Seat = seatValue.ToString();
                bookingRequest.Date = DateTime.Now;
                JsonContent content = JsonContent.Create(bookingRequest);
                await client.PostAsync("http://localhost:5294/bookings", content);

            }
        }
    }
}
