USE [master]
GO
/****** Object:  Database [StoneWare]    Script Date: 19.02.2020 21:04:58 ******/
CREATE DATABASE [StoneWare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoneWare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StoneWare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoneWare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StoneWare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StoneWare] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoneWare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoneWare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoneWare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoneWare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoneWare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoneWare] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoneWare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoneWare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoneWare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoneWare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoneWare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoneWare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoneWare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoneWare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoneWare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoneWare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoneWare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoneWare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoneWare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoneWare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoneWare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoneWare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoneWare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoneWare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoneWare] SET  MULTI_USER 
GO
ALTER DATABASE [StoneWare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoneWare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoneWare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoneWare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoneWare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoneWare] SET QUERY_STORE = OFF
GO
USE [StoneWare]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19.02.2020 21:04:59 ******/
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
/****** Object:  Table [dbo].[Issue]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[VersionNumberId] [int] NOT NULL,
	[OperatingSystemId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
	[TimeLastUpdated] [datetime] NOT NULL,
	[Problem] [nvarchar](1000) NOT NULL,
	[Resolution] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperatingSystem]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingSystem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVersionOs]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVersionOs](
	[ProductId] [int] NOT NULL,
	[OperatingSystemId] [int] NOT NULL,
	[VersionNumberId] [int] NOT NULL,
 CONSTRAINT [PK_ProductVersionOs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OperatingSystemId] ASC,
	[VersionNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VersionNumber]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_VersionNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Issue_ProductId_OperatingSystemId_VersionNumberId]    Script Date: 19.02.2020 21:04:59 ******/
CREATE NONCLUSTERED INDEX [IX_Issue_ProductId_OperatingSystemId_VersionNumberId] ON [dbo].[Issue]
(
	[ProductId] ASC,
	[OperatingSystemId] ASC,
	[VersionNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Issue_StatusId]    Script Date: 19.02.2020 21:04:59 ******/
CREATE NONCLUSTERED INDEX [IX_Issue_StatusId] ON [dbo].[Issue]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersionOs_OperatingSystemId]    Script Date: 19.02.2020 21:04:59 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersionOs_OperatingSystemId] ON [dbo].[ProductVersionOs]
(
	[OperatingSystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVersionOs_VersionNumberId]    Script Date: 19.02.2020 21:04:59 ******/
CREATE NONCLUSTERED INDEX [IX_ProductVersionOs_VersionNumberId] ON [dbo].[ProductVersionOs]
(
	[VersionNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_ProductVersionOs] FOREIGN KEY([ProductId], [OperatingSystemId], [VersionNumberId])
REFERENCES [dbo].[ProductVersionOs] ([ProductId], [OperatingSystemId], [VersionNumberId])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_ProductVersionOs]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Status]
GO
ALTER TABLE [dbo].[ProductVersionOs]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersionOs_OperatingSystem] FOREIGN KEY([OperatingSystemId])
REFERENCES [dbo].[OperatingSystem] ([Id])
GO
ALTER TABLE [dbo].[ProductVersionOs] CHECK CONSTRAINT [FK_ProductVersionOs_OperatingSystem]
GO
ALTER TABLE [dbo].[ProductVersionOs]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersionOs_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductVersionOs] CHECK CONSTRAINT [FK_ProductVersionOs_Product]
GO
ALTER TABLE [dbo].[ProductVersionOs]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersionOs_VersionNumber] FOREIGN KEY([VersionNumberId])
REFERENCES [dbo].[VersionNumber] ([Id])
GO
ALTER TABLE [dbo].[ProductVersionOs] CHECK CONSTRAINT [FK_ProductVersionOs_VersionNumber]
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstanding]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All outstanding issues.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstanding] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All outstanding issues containing a list of keywords (all products).
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingKeywords] 
	-- Add the parameters for the stored procedure here
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdAllVer]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All outstanding issues for a given product (all versions).
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdAllVer] 
	-- Add the parameters for the stored procedure here
	@ProductId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 
		AND i.ProductId = @ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdAllVerDateRange]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All resolved issues for a product (single version) within a date range.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdAllVerDateRange] 
	@ProductId int = 0, 
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND 
		ProductId = @ProductId AND
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdAllVerDateRangeKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	Outstanding issues within a date range for a product (all versions) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdAllVerDateRangeKeywords] 
	@ProductId int = 0, 
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07',
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND 
		ProductId = @ProductId AND
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdAllVerKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	All outstanding issues for a product (all versions) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdAllVerKeywords] 
	-- Add the parameters for the stored procedure here
	@ProductId int = 0,
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND
		i.ProductId = @ProductId AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdSingleVer]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All outstanding issues for a product (single version).
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdSingleVer] 
	-- Add the parameters for the stored procedure here
	@ProductId int = 0, 
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1
		AND ProductId = @ProductId
		AND VersionNumberId = @VersionNumberId
		AND OperatingSystemId = @OperatingSystemId
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdSingleVerDateRange]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All outstanding issues for a single product within an inclusive date range (all versions).
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdSingleVerDateRange] 
-- Add the parameters for the stored procedure here
	@ProductId int = 0, 
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0,
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND 
		ProductId = @ProductId AND 
		VersionNumberId = @VersionNumberId AND 
		OperatingSystemId = @OperatingSystemId AND 
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdSingleVerDateRangeKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	Outstanding issues within a date range for a product (single version) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdSingleVerDateRangeKeywords] 
	@ProductId int = 0, 
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0,
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07',
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND 
		ProductId = @ProductId AND
		VersionNumberId = @VersionNumberId AND 
		OperatingSystemId = @OperatingSystemId AND 
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdSingleVerKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	Outstanding issues for a product (single version) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdSingleVerKeywords]
-- Add the parameters for the stored procedure here
	@ProductId int = 0,
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0,
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 1 AND
		i.ProductId = @ProductId AND
		VersionNumberId = @VersionNumberId AND
		OperatingSystemId = @OperatingSystemId AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolved]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All outstanding issues.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolved] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	All resolved issues containing a list of keywords,
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedKeywords] 
	-- Add the parameters for the stored procedure here
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdAllVer]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All resolved issues for a product (all versions)
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdAllVer] 
	-- Add the parameters for the stored procedure here
	@ProductId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2
		AND ProductId = @ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdAllVerDateRange]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All resolved issues for a product (all versions) within a date range
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdAllVerDateRange] 
	-- Add the parameters for the stored procedure here
	@ProductId int = 0, 
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND 
		ProductId = @ProductId AND
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdAllVerDateRangeKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	Resolved issues within a date range for a product (all versions) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdAllVerDateRangeKeywords] 
	@ProductId int = 0, 
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07',
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND 
		ProductId = @ProductId AND
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdAllVerKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	All resolved issues for a product (all versions) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdAllVerKeywords] 
-- Add the parameters for the stored procedure here
	@ProductId int = 0,
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND
		i.ProductId = @ProductId AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdSingleVer]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All resolved issues for a single product (single version).
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdSingleVer] 
	-- Add the parameters for the stored procedure here
	@ProductId int = 0, 
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2
		AND ProductId = @ProductId
		AND VersionNumberId = @VersionNumberId
		AND OperatingSystemId = @OperatingSystemId
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdSingleVerDateRange]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	All resolved issues for a product (single version) within a date range.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdSingleVerDateRange] 
	@ProductId int = 0, 
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0,
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND 
		ProductId = @ProductId AND 
		VersionNumberId = @VersionNumberId AND 
		OperatingSystemId = @OperatingSystemId AND 
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdSingleVerDateRangeKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	Resolved issues within a date range for a product (single version) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdSingleVerDateRangeKeywords] 
	@ProductId int = 0, 
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0,
	@StartDate date = '1980-01-01',
	@EndDate date = '1980-01-07',
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND 
		ProductId = @ProductId AND
		VersionNumberId = @VersionNumberId AND 
		OperatingSystemId = @OperatingSystemId AND 
		CAST(TimeCreated AS date) BETWEEN @StartDate AND @EndDate AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
/****** Object:  StoredProcedure [dbo].[spIssuesResolvedSingleProdSingleVerKeywords]    Script Date: 19.02.2020 21:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 18/02/2020
-- Description:	Outstanding issues for a product (single version) containing a list of keywords.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesResolvedSingleProdSingleVerKeywords]
-- Add the parameters for the stored procedure here
	@ProductId int = 0,
	@VersionNumberId int = 0,
	@OperatingSystemId int = 0,
	@Keywords nvarchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		i.Id,
		i.ProductId,
		p.Name AS ProductName,
		i.OperatingSystemId,
		os.Name AS OperatingSystem,
		i.VersionNumberId,
		vn.Description AS VersionNumber,
		i.StatusId,
		s.Name AS Status,
		i.TimeCreated,
		i.TimeLastUpdated,
		i.Problem,
		i.Resolution
	FROM 
		dbo.Issue i 		
		INNER JOIN dbo.Status s ON i.StatusId = s.Id
		INNER JOIN dbo.VersionNumber vn ON i.VersionNumberId = vn.Id
		INNER JOIN dbo.OperatingSystem os ON i.OperatingSystemId = os.Id
		INNER JOIN dbo.Product p ON i.ProductId = p.Id
	WHERE
		i.StatusId = 2 AND
		i.ProductId = @ProductId AND
		VersionNumberId = @VersionNumberId AND
		OperatingSystemId = @OperatingSystemId AND
		EXISTS 
		(	
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(i.Problem, ' ')
			INTERSECT 
			SELECT 
				TRIM(value) 
			FROM 
				STRING_SPLIT(@Keywords, ',')
		)
END
GO
USE [master]
GO
ALTER DATABASE [StoneWare] SET  READ_WRITE 
GO
