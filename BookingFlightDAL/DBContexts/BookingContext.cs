using BookingFlightService.BookingFlightDAL.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace BookingFlightService.BookingFlightDAL.DBContexts
{
    public class BookingContext : DbContext
    {
        public DbSet<Booking> Bookings { get; set; }

        private readonly IConfiguration _configuration;

        public BookingContext(DbContextOptions<BookingContext> options, IConfiguration configuration) : base(options)
        {
            _configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DatabaseConnection"));
            }
        }
    }
}
