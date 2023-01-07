using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace BookingFlightDAL.Migrations
{
    /// <inheritdoc />
    public partial class CreateSeatDB : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Bookings",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PassengerName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Seat = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bookings", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Seats",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Place = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Seats", x => x.ID);
                });

            migrationBuilder.InsertData(
                table: "Seats",
                columns: new[] { "ID", "Place" },
                values: new object[,]
                {
                    { 1, "1A" },
                    { 2, "1B" },
                    { 3, "1C" },
                    { 4, "1D" },
                    { 5, "1E" },
                    { 6, "1F" },
                    { 7, "2A" },
                    { 8, "2B" },
                    { 9, "2C" },
                    { 10, "2D" },
                    { 11, "2E" },
                    { 12, "2F" },
                    { 13, "3A" },
                    { 14, "3B" },
                    { 15, "3C" },
                    { 16, "3D" },
                    { 17, "3E" },
                    { 18, "3F" },
                    { 19, "4A" },
                    { 20, "4B" },
                    { 21, "4C" },
                    { 22, "4D" },
                    { 23, "4E" },
                    { 24, "4F" },
                    { 25, "5A" },
                    { 26, "5B" },
                    { 27, "5C" },
                    { 28, "5D" },
                    { 29, "5E" },
                    { 30, "5F" },
                    { 31, "6A" },
                    { 32, "6B" },
                    { 33, "6C" },
                    { 34, "6D" },
                    { 35, "6E" },
                    { 36, "6F" },
                    { 37, "7A" },
                    { 38, "7B" },
                    { 39, "7C" },
                    { 40, "7D" },
                    { 41, "7E" },
                    { 42, "7F" },
                    { 43, "8A" },
                    { 44, "8B" },
                    { 45, "8C" },
                    { 46, "8D" },
                    { 47, "8E" },
                    { 48, "8F" },
                    { 49, "9A" },
                    { 50, "9B" },
                    { 51, "9C" },
                    { 52, "9D" },
                    { 53, "9E" },
                    { 54, "9F" },
                    { 55, "10A" },
                    { 56, "10B" },
                    { 57, "10C" },
                    { 58, "10D" },
                    { 59, "10E" },
                    { 60, "10F" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Bookings");

            migrationBuilder.DropTable(
                name: "Seats");
        }
    }
}
