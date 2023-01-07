using BookingFlightService.BookingFlightBL.Repositories;
using BookingFlightService.BookingFlightBL.Requests;
using Microsoft.AspNetCore.Mvc;

namespace MyMicroservice.Controllers;

[ApiController]
[Route("")]
public class BookingController : ControllerBase
{
    private readonly ILogger<BookingController> _logger;

    private readonly IBookingRepository _bookingRepository;

    public BookingController(ILogger<BookingController> logger, IBookingRepository bookingRepository)
    {
        _logger = logger;
        _bookingRepository = bookingRepository;
    }

    [Route("bookings")]
    [HttpGet]
    public IActionResult Get()
    {
        try
        {
            _logger.LogInformation("Got Get request at {DT}",
           DateTime.UtcNow.ToLongTimeString());

            var res = _bookingRepository.GetAllBookings();

            _logger.LogInformation("Get request sucseesfully handeld {DT}",
         DateTime.UtcNow.ToLongTimeString());

            return Ok(res);
        }
        catch (Exception e)
        {
            _logger.LogError(e.Message);

            return BadRequest(e.Message);
        }
    }

    [Route("bookings")]
    [HttpPost]
    public IActionResult Postbookings([FromBody] BookingRequest bookingRequest)
    {
        try
        {
            _logger.LogInformation("Got booking request at {DT}",
           DateTime.UtcNow.ToLongTimeString());

            _bookingRepository.SaveBooking(bookingRequest);

            _logger.LogInformation("booking request sucseesfully handeld {DT}",
          DateTime.UtcNow.ToLongTimeString());

            return Ok();
        }
        catch (Exception e)
        {
            _logger.LogError(e.Message);

            return BadRequest(e.Message);
        }
    }
}
