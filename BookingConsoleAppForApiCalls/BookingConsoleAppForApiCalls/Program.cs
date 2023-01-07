namespace ConsoleEventManager
{
    class Program
    {
        static async Task Main(string[] args)
        {
            ConsumeBookingEvent consumeBookingEvent = new ConsumeBookingEvent();
            var list = Enumerable.Range(1, 50).ToArray();
            var postTasks = list.Select(p => consumeBookingEvent.PostEvent_data(p));
            await Task.WhenAll(postTasks);
            consumeBookingEvent.GetAllEventData();
        }
    }
}
