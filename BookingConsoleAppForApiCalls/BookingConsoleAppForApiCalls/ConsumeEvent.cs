using System.Diagnostics.Metrics;
using System.Net;
using System.Net.Http.Json;
using System.Text;
using static System.Runtime.InteropServices.JavaScript.JSType;

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

        public async Task PostEvent_data(int dayToAddValue) 
        {      
            using (var client = new HttpClient())
            {
                var bookingRequest = new BookingRequest(); 
                bookingRequest.PassengerName = "Roy";
                bookingRequest.Seat = "3F";
                bookingRequest.Date = DateTime.Now.AddDays(dayToAddValue);
                JsonContent content = JsonContent.Create(bookingRequest);
                await client.PostAsync("http://localhost:5294/bookings", content);

            }
        }
    }
}
