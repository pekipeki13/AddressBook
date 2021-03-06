USE [master]
GO
/****** Object:  Database [DB_AddressBook]    Script Date: 12/30/2019 12:46:26 AM ******/
CREATE DATABASE [DB_AddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_AddressBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_AddressBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_AddressBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_AddressBook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_AddressBook] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_AddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_AddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_AddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_AddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_AddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_AddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_AddressBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_AddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_AddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_AddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_AddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_AddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_AddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_AddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_AddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_AddressBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_AddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_AddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_AddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_AddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_AddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_AddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_AddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_AddressBook] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_AddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [DB_AddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_AddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_AddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_AddressBook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_AddressBook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_AddressBook', N'ON'
GO
ALTER DATABASE [DB_AddressBook] SET QUERY_STORE = OFF
GO
USE [DB_AddressBook]
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
USE [DB_AddressBook]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 12/30/2019 12:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Telephone] [nvarchar](max) NULL,
 CONSTRAINT [PK_Peoples] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (2, N'Andjela 1 ', N'Nikolic', N'Pivopijska 15', N'+381 2434214')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (47, N'Novica', N'Tosic', N'Donja Malča bb', N'432142342')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (51, N'Peki', N'Nikolic', N'prvomajska 2/1', N'+38163685699')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (65, N'Dusan', N'Krkobabic', N'Adresarksa', N'94321412')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (70, N'Peki', N'Nikolic', N'prvomajska 2/1', N'+38163685699')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (72, N'Petros', N'Nikolic', N'prvomajska 2/13', N'+38163685699')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (76, N'Dusan', N'Krkobabic 13', N'Adresarksa', N'94321412')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (77, N'Dusan', N'Krkobabic14', N'Adresarksa', N'1394321412')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (81, N'55', N'5555', N'555555', N'555555555')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (82, N'Peki', N'Nikolic', N'prvomajska 2/1', N'+38163685699')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (83, N'Peki333444', N'Nikolic', N'prvomajska 2/1', N'+38163685699')
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [Address], [Telephone]) VALUES (84, N'Peki2222', N'Nikolic', N'prvomajska 2/1', N'+38163685699')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
USE [master]
GO
ALTER DATABASE [DB_AddressBook] SET  READ_WRITE 
GO
