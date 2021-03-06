USE [master]
GO
/****** Object:  Database [TimeTracker]    Script Date: 3/30/2018 2:09:32 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 3/30/2018 2:09:32 PM ******/
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
/****** Object:  Table [dbo].[Managers]    Script Date: 3/30/2018 2:09:32 PM ******/
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
/****** Object:  Table [dbo].[ShiftLength]    Script Date: 3/30/2018 2:09:32 PM ******/
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
/****** Object:  Table [dbo].[Shifts]    Script Date: 3/30/2018 2:09:33 PM ******/
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
	[ShiftLengthId] [int] NULL,
	[Email] [bit] NULL,
	[Phone] [bit] NULL,
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
