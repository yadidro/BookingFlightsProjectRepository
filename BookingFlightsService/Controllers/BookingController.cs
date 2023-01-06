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
            return Ok(_bookingRepository.GetAllBookings());
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [Route("bookings")]
    [HttpPost]
    public IActionResult Postbookings([FromBody] BookingRequest bookingRequest)
    {
        try
        {
            _bookingRepository.SaveBooking(bookingRequest);
            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
}
