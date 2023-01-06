using BookingFlightService.BookingFlightDAL.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace BookingFlightService.BookingFlightDAL.DBContexts
{
    public class BookingContext : DbContext
    {
        public DbSet<Booking> Bookings { get; set; }

        private readonly IConfiguration _configuration;
        private IDbConnection DbConnection { get; }

        public BookingContext(DbContextOptions<BookingContext> options, IConfiguration configuration) : base(options)
        {
            _configuration = configuration;
            DbConnection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
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
