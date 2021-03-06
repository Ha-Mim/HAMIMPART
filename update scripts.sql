USE [master]
GO
/****** Object:  Database [VazaarDB]    Script Date: 3/7/2015 12:20:06 PM ******/
CREATE DATABASE [VazaarDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VazaarDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\VazaarDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VazaarDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\VazaarDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VazaarDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VazaarDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VazaarDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VazaarDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VazaarDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VazaarDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VazaarDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VazaarDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VazaarDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VazaarDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VazaarDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VazaarDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VazaarDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VazaarDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VazaarDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VazaarDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VazaarDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VazaarDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VazaarDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VazaarDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VazaarDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VazaarDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VazaarDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VazaarDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VazaarDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VazaarDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VazaarDB] SET  MULTI_USER 
GO
ALTER DATABASE [VazaarDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VazaarDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VazaarDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VazaarDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VazaarDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/7/2015 12:20:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/7/2015 12:20:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderedLists]    Script Date: 3/7/2015 12:20:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedLists](
	[OrderedListId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderedLists] PRIMARY KEY CLUSTERED 
(
	[OrderedListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/7/2015 12:20:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ImagePath] [nvarchar](100) NULL,
	[Specification] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Model] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[HardDisk] [nvarchar](max) NULL,
	[Ram] [nvarchar](max) NULL,
	[MadeBy] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 3/7/2015 12:20:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/7/2015 12:20:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MobileNo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ProductId]    Script Date: 3/7/2015 12:20:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[OrderedLists]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/7/2015 12:20:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[OrderedLists]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 3/7/2015 12:20:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubCategoryId]    Script Date: 3/7/2015 12:20:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubCategoryId] ON [dbo].[Products]
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/7/2015 12:20:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Products]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 3/7/2015 12:20:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[SubCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderedLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderedLists_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderedLists] CHECK CONSTRAINT [FK_dbo.OrderedLists_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[OrderedLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderedLists_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[OrderedLists] CHECK CONSTRAINT [FK_dbo.OrderedLists_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.SubCategories_SubCategoryId] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.SubCategories_SubCategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubCategories_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_dbo.SubCategories_dbo.Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [VazaarDB] SET  READ_WRITE 
GO
