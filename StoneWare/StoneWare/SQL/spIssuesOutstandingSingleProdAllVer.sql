USE [StoneWare]
GO
/****** Object:  StoredProcedure [dbo].[spIssuesOutstandingSingleProdAllVer]    Script Date: 21.02.2020 22:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jon Karlsen
-- Create date: 17/02/2020
-- Description:	This stored procedure returns all issues with status set to “outstanding” for a single product of all versions.
-- =============================================
CREATE PROCEDURE [dbo].[spIssuesOutstandingSingleProdAllVer] 
	-- Add the parameters for the stored procedure here
	@ProductId int
AS
BEGIN

    -- Validate input not NULL

	IF @ProductId IS NULL
	BEGIN
		SELECT 'Parameter @ProductId cannot be NULL.'
		RETURN;
	END

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
