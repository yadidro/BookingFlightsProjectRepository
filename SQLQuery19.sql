USE [master]
GO
/****** Object:  Database [BookingDB]    Script Date: 07/01/2023 21:12:03 ******/
CREATE DATABASE [BookingDB]
 CONTAINMENT = NONE
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookingDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookingDB] SET QUERY_STORE = OFF
GO
USE [BookingDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/01/2023 21:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 07/01/2023 21:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PassengerName] [nvarchar](max) NOT NULL,
	[Seat] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 07/01/2023 21:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Place] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230106154403_CreateBookingDB', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230106155348_initial', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230107142040_CreateSeatDB', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230107145441_CreateSeatDB', N'7.0.1')
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (67, N'Roy', N'3F', CAST(N'2023-01-18T18:50:34.4299069' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (68, N'Roy', N'3F', CAST(N'2023-01-13T18:50:34.4051958' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (69, N'Roy', N'3F', CAST(N'2023-01-12T18:50:34.4045307' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (70, N'Roy', N'3F', CAST(N'2023-01-21T18:50:34.4435195' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (71, N'Roy', N'3F', CAST(N'2023-01-11T18:50:34.4036043' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (72, N'Roy', N'3F', CAST(N'2023-01-09T18:50:34.4005947' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (73, N'Roy', N'3F', CAST(N'2023-01-08T18:50:34.0341785' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (74, N'Roy', N'3F', CAST(N'2023-01-10T18:50:34.4022147' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (75, N'Roy', N'3F', CAST(N'2023-01-19T18:50:34.4339243' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (76, N'Roy', N'3F', CAST(N'2023-01-16T18:50:34.4230758' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (77, N'Roy', N'3F', CAST(N'2023-01-17T18:50:34.4239357' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (78, N'Roy', N'3F', CAST(N'2023-01-23T18:50:34.4528292' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (79, N'Roy', N'3F', CAST(N'2023-01-27T18:50:34.4564056' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (80, N'Roy', N'3F', CAST(N'2023-01-15T18:50:34.4222953' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (81, N'Roy', N'3F', CAST(N'2023-01-14T18:50:34.4057019' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (82, N'Roy', N'3F', CAST(N'2023-02-02T18:50:34.4626565' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (83, N'Roy', N'3F', CAST(N'2023-02-04T18:50:34.4642268' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (84, N'Roy', N'3F', CAST(N'2023-01-29T18:50:34.4595920' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (85, N'Roy', N'3F', CAST(N'2023-01-20T18:50:34.4347500' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (86, N'Roy', N'3F', CAST(N'2023-02-03T18:50:34.4634300' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (87, N'Roy', N'3F', CAST(N'2023-01-31T18:50:34.4613836' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (88, N'Roy', N'3F', CAST(N'2023-01-26T18:50:34.4555539' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (89, N'Roy', N'3F', CAST(N'2023-02-05T18:50:34.4652090' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (90, N'Roy', N'3F', CAST(N'2023-02-10T18:50:34.4692927' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (91, N'Roy', N'3F', CAST(N'2023-01-24T18:50:34.4537019' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (92, N'Roy', N'3F', CAST(N'2023-02-07T18:50:34.4671125' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (93, N'Roy', N'3F', CAST(N'2023-02-18T18:50:34.4812461' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (94, N'Roy', N'3F', CAST(N'2023-02-16T18:50:34.4754160' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (95, N'Roy', N'3F', CAST(N'2023-02-12T18:50:34.4711416' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (96, N'Roy', N'3F', CAST(N'2023-02-08T18:50:34.4676855' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (97, N'Roy', N'3F', CAST(N'2023-02-17T18:50:34.4806971' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (98, N'Roy', N'3F', CAST(N'2023-01-22T18:50:34.4442068' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (99, N'Roy', N'3F', CAST(N'2023-02-14T18:50:34.4725202' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (100, N'Roy', N'3F', CAST(N'2023-01-25T18:50:34.4546461' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (101, N'Roy', N'3F', CAST(N'2023-02-15T18:50:34.4734009' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (102, N'Roy', N'3F', CAST(N'2023-02-11T18:50:34.4700557' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (103, N'Roy', N'3F', CAST(N'2023-02-01T18:50:34.4620558' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (104, N'Roy', N'3F', CAST(N'2023-01-28T18:50:34.4584752' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (105, N'Roy', N'3F', CAST(N'2023-02-06T18:50:34.4664162' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (106, N'Roy', N'3F', CAST(N'2023-02-13T18:50:34.4718166' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (107, N'Roy', N'3F', CAST(N'2023-02-19T18:50:34.4818456' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (108, N'Roy', N'3F', CAST(N'2023-02-26T18:50:34.4857922' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (109, N'Roy', N'3F', CAST(N'2023-02-09T18:50:34.4684784' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (110, N'Roy', N'3F', CAST(N'2023-02-20T18:50:34.4824385' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (111, N'Roy', N'3F', CAST(N'2023-01-30T18:50:34.4605711' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (112, N'Roy', N'3F', CAST(N'2023-02-21T18:50:34.4830773' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (113, N'Roy', N'3F', CAST(N'2023-02-23T18:50:34.4840825' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (114, N'Roy', N'3F', CAST(N'2023-02-22T18:50:34.4835990' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (115, N'Roy', N'3F', CAST(N'2023-02-25T18:50:34.4851778' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (116, N'Roy', N'3F', CAST(N'2023-02-24T18:50:34.4846328' AS DateTime2))
GO
INSERT [dbo].[Bookings] ([ID], [PassengerName], [Seat], [Date]) VALUES (117, N'string', N'3A', CAST(N'2024-01-07T16:52:09.6510000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (1, N'1A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (2, N'1B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (3, N'1C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (4, N'1D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (5, N'1E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (6, N'1F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (7, N'2A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (8, N'2B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (9, N'2C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (10, N'2D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (11, N'2E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (12, N'2F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (13, N'3A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (14, N'3B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (15, N'3C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (16, N'3D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (17, N'3E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (18, N'3F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (19, N'4A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (20, N'4B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (21, N'4C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (22, N'4D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (23, N'4E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (24, N'4F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (25, N'5A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (26, N'5B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (27, N'5C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (28, N'5D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (29, N'5E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (30, N'5F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (31, N'6A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (32, N'6B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (33, N'6C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (34, N'6D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (35, N'6E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (36, N'6F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (37, N'7A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (38, N'7B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (39, N'7C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (40, N'7D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (41, N'7E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (42, N'7F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (43, N'8A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (44, N'8B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (45, N'8C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (46, N'8D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (47, N'8E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (48, N'8F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (49, N'9A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (50, N'9B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (51, N'9C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (52, N'9D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (53, N'9E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (54, N'9F')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (55, N'10A')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (56, N'10B')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (57, N'10C')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (58, N'10D')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (59, N'10E')
GO
INSERT [dbo].[Seats] ([ID], [Place]) VALUES (60, N'10F')
GO
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
USE [master]
GO
ALTER DATABASE [BookingDB] SET  READ_WRITE 
GO
