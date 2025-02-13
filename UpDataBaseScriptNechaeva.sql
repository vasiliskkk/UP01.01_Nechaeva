USE [master]
GO
/****** Object:  Database [Up]    Script Date: 31.01.2025 19:28:55 ******/
CREATE DATABASE [Up]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Up', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Up.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Up_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Up_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Up] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Up].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Up] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Up] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Up] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Up] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Up] SET ARITHABORT OFF 
GO
ALTER DATABASE [Up] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Up] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Up] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Up] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Up] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Up] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Up] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Up] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Up] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Up] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Up] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Up] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Up] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Up] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Up] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Up] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Up] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Up] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Up] SET  MULTI_USER 
GO
ALTER DATABASE [Up] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Up] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Up] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Up] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Up] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Up] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Up', N'ON'
GO
ALTER DATABASE [Up] SET QUERY_STORE = ON
GO
ALTER DATABASE [Up] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Up]
GO
/****** Object:  Table [dbo].[Advertisment]    Script Date: 31.01.2025 19:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisment](
	[Id] [int] NOT NULL,
	[AdDescription] [varchar](4000) NOT NULL,
	[City] [int] NOT NULL,
	[AdDate] [date] NOT NULL,
	[Photo] [varchar](max) NULL,
	[Category] [int] NOT NULL,
	[AdOwner] [int] NOT NULL,
	[AdName] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Advertisment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31.01.2025 19:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[CategoryName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 31.01.2025 19:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[CityName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31.01.2025 19:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[RoleName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.01.2025 19:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[UserName] [varchar](150) NOT NULL,
	[UserSurname] [varchar](150) NOT NULL,
	[UserSecondName] [varchar](150) NULL,
	[UserLogin] [varchar](150) NOT NULL,
	[UserPassword] [varchar](150) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Advertisment] ([Id], [AdDescription], [City], [AdDate], [Photo], [Category], [AdOwner], [AdName]) VALUES (1, N'Милая сова', 0, CAST(N'2025-01-31' AS Date), N'C:\Users\Admin\Downloads\совенка.jpg', 4, 0, N'Мой друг')
INSERT [dbo].[Advertisment] ([Id], [AdDescription], [City], [AdDate], [Photo], [Category], [AdOwner], [AdName]) VALUES (2, N'Варенье из шишек', 1, CAST(N'2025-01-31' AS Date), N'C:\Users\Admin\Downloads\варенье шиш.jpg', 0, 2, N'Очень вкусное! Всем советую')
INSERT [dbo].[Advertisment] ([Id], [AdDescription], [City], [AdDate], [Photo], [Category], [AdOwner], [AdName]) VALUES (3, N'Пропала собака...', 2, CAST(N'2025-01-31' AS Date), N'C:\Users\Admin\Downloads\шарик.png', 2, 1, N'Помогите найти. Нашедшему полагается вознаграждение')
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (0, N'Готовка')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Идеи')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Новости')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Актуальные темы')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (4, N'Животные')
GO
INSERT [dbo].[City] ([Id], [CityName]) VALUES (0, N'Москва')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (1, N'Санкт-Перербург')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (2, N'Екатеринбург')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3, N'Казань')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (4, N'Тула')
GO
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'Пользователь')
GO
INSERT [dbo].[Users] ([Id], [UserName], [UserSurname], [UserSecondName], [UserLogin], [UserPassword], [UserRole]) VALUES (0, N'Таисия', N'Блинова', N'Артёмовна', N'bliin01', N'123blin', 2)
INSERT [dbo].[Users] ([Id], [UserName], [UserSurname], [UserSecondName], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Михаил', N'Морозов', N'Макарович', N'moroz', N'12345a', 1)
INSERT [dbo].[Users] ([Id], [UserName], [UserSurname], [UserSecondName], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Виктория', N'Кукушкина', N'Марковна', N'kyky', N'kyk3', 2)
GO
ALTER TABLE [dbo].[Advertisment]  WITH CHECK ADD  CONSTRAINT [FK_Advertisment_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Advertisment] CHECK CONSTRAINT [FK_Advertisment_Category]
GO
ALTER TABLE [dbo].[Advertisment]  WITH CHECK ADD  CONSTRAINT [FK_Advertisment_City] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Advertisment] CHECK CONSTRAINT [FK_Advertisment_City]
GO
ALTER TABLE [dbo].[Advertisment]  WITH CHECK ADD  CONSTRAINT [FK_Advertisment_Users] FOREIGN KEY([AdOwner])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Advertisment] CHECK CONSTRAINT [FK_Advertisment_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Up] SET  READ_WRITE 
GO
