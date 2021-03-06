USE [master]
GO
/****** Object:  Database [TimeTracker]    Script Date: 4/1/2018 3:30:56 PM ******/
CREATE DATABASE [TimeTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TimeTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TimeTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TimeTracker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimeTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimeTracker] SET  MULTI_USER 
GO
ALTER DATABASE [TimeTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeTracker] SET QUERY_STORE = OFF
GO
USE [TimeTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TimeTracker]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/1/2018 3:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Title] [nvarchar](75) NOT NULL,
	[MangerId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 4/1/2018 3:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Title] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftLength]    Script Date: 4/1/2018 3:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftLength](
	[ShiftLengthId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftLengthName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ShiftLength] PRIMARY KEY CLUSTERED 
(
	[ShiftLengthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 4/1/2018 3:30:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[MangerId] [int] NOT NULL,
	[Callout] [bit] NOT NULL,
	[Planned] [bit] NULL,
	[ShiftLengthId] [int] NULL,
	[Email] [bit] NULL,
	[Phone] [bit] NULL,
	[Integrations] [bit] NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (1, N'Ben Harrington', N'Dev Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (2, N'Heather Sturm', N'Integrations Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (3, N'Ross Cochran', N'Integrations Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (4, N'Andrew Heuback', N'Integreations Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (5, N'Zach Sharpe', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (9, N'Laura Delcambre', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (10, N'Anna Dolan', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (11, N'John Newman', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (12, N'Joshua Jackson', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (13, N'Brad Roth', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (14, N'Sammy Al-Hagal', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (15, N'Phillip May', N'Customer Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (16, N'Anthony Miranda', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (18, N'Nate Gallagher', N'Customer Support Specialist', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([ManagerId], [Name], [Title]) VALUES (1, N'Katie Watts', N'Senior Support Team Manager')
INSERT [dbo].[Managers] ([ManagerId], [Name], [Title]) VALUES (2, N'Grey Stepp', N'Support Team Manager')
SET IDENTITY_INSERT [dbo].[Managers] OFF
SET IDENTITY_INSERT [dbo].[ShiftLength] ON 

INSERT [dbo].[ShiftLength] ([ShiftLengthId], [ShiftLengthName]) VALUES (1, N'Full Day')
INSERT [dbo].[ShiftLength] ([ShiftLengthId], [ShiftLengthName]) VALUES (2, N'Half Day')
SET IDENTITY_INSERT [dbo].[ShiftLength] OFF
SET IDENTITY_INSERT [dbo].[Shifts] ON 

INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (2, CAST(N'2018-01-03' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (3, CAST(N'2018-01-04' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (4, CAST(N'2018-01-05' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (5, CAST(N'2018-01-08' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (6, CAST(N'2018-01-09' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (7, CAST(N'2018-01-10' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (8, CAST(N'2018-01-11' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (9, CAST(N'2018-01-12' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (10, CAST(N'2018-01-15' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (11, CAST(N'2018-01-16' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (12, CAST(N'2018-01-17' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (13, CAST(N'2018-01-18' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (14, CAST(N'2018-01-19' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (15, CAST(N'2018-01-22' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (16, CAST(N'2018-01-23' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (17, CAST(N'2018-01-24' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (18, CAST(N'2018-01-25' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (19, CAST(N'2018-01-26' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (20, CAST(N'2018-01-29' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (21, CAST(N'2018-01-30' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (22, CAST(N'2018-01-31' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (23, CAST(N'2018-02-01' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (24, CAST(N'2018-02-02' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (25, CAST(N'2018-02-05' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (26, CAST(N'2018-02-06' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (27, CAST(N'2018-02-07' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (28, CAST(N'2018-02-08' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (29, CAST(N'2018-02-09' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (30, CAST(N'2018-02-12' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (31, CAST(N'2018-02-13' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (32, CAST(N'2018-02-14' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (33, CAST(N'2018-02-15' AS Date), 2, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (34, CAST(N'2018-02-16' AS Date), 2, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (35, CAST(N'2018-02-19' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (36, CAST(N'2018-02-20' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (37, CAST(N'2018-02-21' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (39, CAST(N'2018-02-22' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (40, CAST(N'2018-02-23' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (41, CAST(N'2018-02-26' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (42, CAST(N'2018-02-27' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (43, CAST(N'2018-02-28' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (44, CAST(N'2018-03-01' AS Date), 2, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (45, CAST(N'2018-03-02' AS Date), 2, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (46, CAST(N'2018-03-05' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (47, CAST(N'2018-03-06' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (48, CAST(N'2018-03-07' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (49, CAST(N'2018-03-08' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (50, CAST(N'2018-03-09' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (51, CAST(N'2018-03-12' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (52, CAST(N'2018-03-13' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (53, CAST(N'2018-03-14' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (54, CAST(N'2018-03-15' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (55, CAST(N'2018-03-16' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (56, CAST(N'2018-03-19' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (57, CAST(N'2018-03-20' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (58, CAST(N'2018-03-21' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (59, CAST(N'2018-03-22' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (60, CAST(N'2018-03-23' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (61, CAST(N'2018-03-26' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (62, CAST(N'2018-03-27' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (63, CAST(N'2018-03-28' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (64, CAST(N'2018-03-29' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (65, CAST(N'2018-03-30' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (66, CAST(N'2018-04-02' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (67, CAST(N'2018-04-03' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (68, CAST(N'2018-04-04' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (69, CAST(N'2018-04-05' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (70, CAST(N'2018-04-06' AS Date), 2, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (71, CAST(N'2018-01-03' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (72, CAST(N'2018-01-04' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (73, CAST(N'2018-01-05' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (74, CAST(N'2018-01-08' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (75, CAST(N'2018-01-09' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (76, CAST(N'2018-01-10' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (77, CAST(N'2018-01-11' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (78, CAST(N'2018-01-12' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (79, CAST(N'2018-01-15' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (80, CAST(N'2018-01-16' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (81, CAST(N'2018-01-17' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (82, CAST(N'2018-01-18' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (83, CAST(N'2018-01-19' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (84, CAST(N'2018-01-22' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (85, CAST(N'2018-01-23' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (86, CAST(N'2018-01-24' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (87, CAST(N'2018-01-25' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (88, CAST(N'2018-01-26' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (89, CAST(N'2018-01-29' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (90, CAST(N'2018-01-30' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (91, CAST(N'2018-01-31' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (92, CAST(N'2018-02-01' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (93, CAST(N'2018-02-02' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (94, CAST(N'2018-02-05' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (95, CAST(N'2018-02-06' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (96, CAST(N'2018-02-07' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (97, CAST(N'2018-02-08' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (98, CAST(N'2018-02-09' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (99, CAST(N'2018-02-12' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (100, CAST(N'2018-02-13' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (101, CAST(N'2018-02-14' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (102, CAST(N'2018-02-15' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (103, CAST(N'2018-02-16' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (104, CAST(N'2018-02-19' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (105, CAST(N'2018-02-20' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (106, CAST(N'2018-02-21' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (107, CAST(N'2018-02-22' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (108, CAST(N'2018-02-23' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (109, CAST(N'2018-02-26' AS Date), 3, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (110, CAST(N'2018-02-27' AS Date), 3, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (111, CAST(N'2018-02-28' AS Date), 3, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (112, CAST(N'2018-03-01' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (113, CAST(N'2018-03-02' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (114, CAST(N'2018-03-05' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (115, CAST(N'2018-03-06' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (116, CAST(N'2018-03-07' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (117, CAST(N'2018-03-08' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (118, CAST(N'2018-03-09' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (119, CAST(N'2018-03-12' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (120, CAST(N'2018-03-13' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (121, CAST(N'2018-03-14' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (122, CAST(N'2018-03-15' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (123, CAST(N'2018-03-16' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (124, CAST(N'2018-03-19' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (125, CAST(N'2018-03-20' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (126, CAST(N'2018-03-21' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (127, CAST(N'2018-03-22' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (128, CAST(N'2018-03-23' AS Date), 3, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (129, CAST(N'2018-03-26' AS Date), 3, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (130, CAST(N'2018-03-27' AS Date), 3, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (131, CAST(N'2018-03-28' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (132, CAST(N'2018-03-29' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (133, CAST(N'2018-03-30' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (134, CAST(N'2018-04-02' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (135, CAST(N'2018-04-03' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (136, CAST(N'2018-04-04' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (137, CAST(N'2018-04-05' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations]) VALUES (138, CAST(N'2018-04-06' AS Date), 3, 1, 0, NULL, 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Shifts] OFF
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([MangerId])
REFERENCES [dbo].[Managers] ([ManagerId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_Employees]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Managers] FOREIGN KEY([MangerId])
REFERENCES [dbo].[Managers] ([ManagerId])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_Managers]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_ShiftLengths] FOREIGN KEY([ShiftLengthId])
REFERENCES [dbo].[ShiftLength] ([ShiftLengthId])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_ShiftLengths]
GO
USE [master]
GO
ALTER DATABASE [TimeTracker] SET  READ_WRITE 
GO
