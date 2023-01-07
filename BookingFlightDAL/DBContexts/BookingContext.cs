using BookingFlightDAL.Models;
using BookingFlightService.BookingFlightDAL.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Text;

namespace BookingFlightService.BookingFlightDAL.DBContexts
{
    public class BookingContext : DbContext
    {
        public DbSet<Booking> Bookings { get; set; }

        public readonly List<string> LettersForSeats = new List<string>() { "A", "B", "C", "D", "E", "F" };

        public const int NUMBER_OF_LINES = 10;

        public DbSet<Seat> Seats { get; set; }

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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var seatList = GetSeats();
            modelBuilder.Entity<Seat>().HasData(
                seatList
                );
        }
        private List<Seat> GetSeats()
        {
            var SeatList = new List<Seat>();
            int id = 1;
            StringBuilder placeBuilder = new StringBuilder();
            for (int number = 1; number <= NUMBER_OF_LINES; number++)
            {
                foreach (string letter in LettersForSeats)
                {
                    placeBuilder.Append(number);
                    placeBuilder.Append(letter);
                    SeatList.Add(new Seat() { ID= id, Place = placeBuilder.ToString() });
                    placeBuilder.Clear();
                    id++;
                }
            }
            return SeatList;
        }

    }
}
