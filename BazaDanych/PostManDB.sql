USE [master]
GO
/****** Object:  Database [postman_pack_db]    Script Date: 20.11.2018 17:34:33 ******/
CREATE DATABASE [postman_pack_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'postman_pack_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\postman_pack_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'postman_pack_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\postman_pack_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [postman_pack_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [postman_pack_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [postman_pack_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [postman_pack_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [postman_pack_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [postman_pack_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [postman_pack_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [postman_pack_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [postman_pack_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [postman_pack_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [postman_pack_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [postman_pack_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [postman_pack_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [postman_pack_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [postman_pack_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [postman_pack_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [postman_pack_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [postman_pack_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [postman_pack_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [postman_pack_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [postman_pack_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [postman_pack_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [postman_pack_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [postman_pack_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [postman_pack_db] SET RECOVERY FULL 
GO
ALTER DATABASE [postman_pack_db] SET  MULTI_USER 
GO
ALTER DATABASE [postman_pack_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [postman_pack_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [postman_pack_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [postman_pack_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [postman_pack_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'postman_pack_db', N'ON'
GO
ALTER DATABASE [postman_pack_db] SET QUERY_STORE = OFF
GO
USE [postman_pack_db]
GO
/****** Object:  Table [dbo].[boxes]    Script Date: 20.11.2018 17:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boxes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_key] [nvarchar](25) NOT NULL,
	[pack_number] [nvarchar](30) NOT NULL,
	[dimensions] [smallint] NOT NULL,
	[weight] [decimal](18, 2) NOT NULL,
	[to_pay] [decimal](19, 4) NOT NULL,
	[destination_id] [bigint] NOT NULL,
	[current_check_point] [int] NOT NULL,
	[delivery_status] [tinyint] NOT NULL,
 CONSTRAINT [PK_boxes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[check_points]    Script Date: 20.11.2018 17:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[check_points](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[latitude] [decimal](18, 9) NOT NULL,
	[longitude] [decimal](18, 9) NOT NULL,
 CONSTRAINT [PK_check_points] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[couriers]    Script Date: 20.11.2018 17:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[couriers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[courier_id] [int] NOT NULL,
	[pack_id] [bigint] NOT NULL,
	[is_available] [bit] NULL,
 CONSTRAINT [PK_couriers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[destinations]    Script Date: 20.11.2018 17:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[destinations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[post_code] [nvarchar](20) NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[house_number] [nvarchar](10) NULL,
	[apartment_number] [nvarchar](10) NULL,
	[recipient_name] [nvarchar](50) NULL,
	[recipient_surname] [nvarchar](50) NULL,
 CONSTRAINT [PK_destinations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_boxes_check_points]    Script Date: 20.11.2018 17:34:34 ******/
CREATE NONCLUSTERED INDEX [IX_FK_boxes_check_points] ON [dbo].[boxes]
(
	[current_check_point] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_boxes_destinations]    Script Date: 20.11.2018 17:34:34 ******/
CREATE NONCLUSTERED INDEX [IX_FK_boxes_destinations] ON [dbo].[boxes]
(
	[destination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_couriers_boxes]    Script Date: 20.11.2018 17:34:34 ******/
CREATE NONCLUSTERED INDEX [IX_FK_couriers_boxes] ON [dbo].[couriers]
(
	[pack_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[boxes]  WITH CHECK ADD  CONSTRAINT [FK_boxes_check_points] FOREIGN KEY([destination_id])
REFERENCES [dbo].[destinations] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[boxes] CHECK CONSTRAINT [FK_boxes_check_points]
GO
ALTER TABLE [dbo].[boxes]  WITH CHECK ADD  CONSTRAINT [FK_boxes_destinations] FOREIGN KEY([current_check_point])
REFERENCES [dbo].[check_points] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[boxes] CHECK CONSTRAINT [FK_boxes_destinations]
GO
ALTER TABLE [dbo].[couriers]  WITH CHECK ADD  CONSTRAINT [FK_couriers_boxes] FOREIGN KEY([pack_id])
REFERENCES [dbo].[boxes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[couriers] CHECK CONSTRAINT [FK_couriers_boxes]
GO
USE [master]
GO
ALTER DATABASE [postman_pack_db] SET  READ_WRITE 
GO
