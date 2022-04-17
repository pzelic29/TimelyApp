USE [master]
GO
/****** Object:  Database [TimelyProjects]    Script Date: 18.4.2022. 0:30:50 ******/
CREATE DATABASE [TimelyProjects]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimelyProjects', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TimelyProjects.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimelyProjects_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TimelyProjects_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimelyProjects] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimelyProjects].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimelyProjects] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimelyProjects] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimelyProjects] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimelyProjects] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimelyProjects] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimelyProjects] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TimelyProjects] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimelyProjects] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimelyProjects] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimelyProjects] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimelyProjects] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimelyProjects] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimelyProjects] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimelyProjects] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimelyProjects] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TimelyProjects] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimelyProjects] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimelyProjects] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimelyProjects] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimelyProjects] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimelyProjects] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TimelyProjects] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimelyProjects] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimelyProjects] SET  MULTI_USER 
GO
ALTER DATABASE [TimelyProjects] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimelyProjects] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimelyProjects] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimelyProjects] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimelyProjects] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimelyProjects] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TimelyProjects] SET QUERY_STORE = OFF
GO
USE [TimelyProjects]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18.4.2022. 0:30:51 ******/
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
/****** Object:  Table [dbo].[Projects]    Script Date: 18.4.2022. 0:30:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NULL,
	[ProjectStart] [datetime2](7) NOT NULL,
	[ProjectStop] [datetime2](7) NOT NULL,
	[ProjectDuration] [nvarchar](max) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TimelyProjects] SET  READ_WRITE 
GO
