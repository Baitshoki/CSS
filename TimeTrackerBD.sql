USE [master]
GO
/****** Object:  Database [TimeTrackerDB]    Script Date: 9/10/2020 7:06:41 AM ******/
CREATE DATABASE [TimeTrackerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeTrackerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TimeTrackerDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeTrackerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TimeTrackerDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimeTrackerDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTrackerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTrackerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeTrackerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeTrackerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimeTrackerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeTrackerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TimeTrackerDB] SET  MULTI_USER 
GO
ALTER DATABASE [TimeTrackerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeTrackerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeTrackerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeTrackerDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TimeTrackerDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeTrackerDB', N'ON'
GO
USE [TimeTrackerDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Surname] [varchar](30) NULL,
	[EmailAddress] [varchar](50) NULL,
	[CellNumber] [varchar](15) NULL,
	[Password] [varchar](20) NULL,
	[RoleId] [int] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](50) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
	[isActive] [bit] NULL CONSTRAINT [DF_Role_isActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimeSheetId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[ProjectId] [int] NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[TimeSheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[TimeSheetEntry]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TimeSheetEntry]
AS
SELECT        dbo.Employee.Name, dbo.Employee.Surname, dbo.Role.Description, dbo.Project.ProjectName, dbo.TimeSheet.StartTime, dbo.TimeSheet.EndTime, 
                         dbo.Employee.EmployeeId
FROM            dbo.TimeSheet INNER JOIN
                         dbo.Employee ON dbo.TimeSheet.EmployeeId = dbo.Employee.EmployeeId INNER JOIN
                         dbo.Project ON dbo.TimeSheet.ProjectId = dbo.Project.ProjectId INNER JOIN
                         dbo.Role ON dbo.Employee.RoleId = dbo.Role.RoleId

GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Surname], [EmailAddress], [CellNumber], [Password], [RoleId], [IsActive]) VALUES (100, N'Asan', N'Kapel', N'akampel@css.co.za', N'0812020456', N'Asana@123', 2, 1)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Surname], [EmailAddress], [CellNumber], [Password], [RoleId], [IsActive]) VALUES (101, N'Baitshoki1', N'Kubu1', N'bkubu@css.co.za', N'08104581221', N'TK1', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Surname], [EmailAddress], [CellNumber], [Password], [RoleId], [IsActive]) VALUES (102, N'Dops', N'Lema', N'dlema@css.co.za', N'0734257070', N'dLema@123', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Surname], [EmailAddress], [CellNumber], [Password], [RoleId], [IsActive]) VALUES (103, N'Moo', N'Moore', N'mmoore@css.co.za', N'0671212556', N'moom@123', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Surname], [EmailAddress], [CellNumber], [Password], [RoleId], [IsActive]) VALUES (104, N'Deon', N'Stayle', N'dstayle@css.co.za', N'0743404545', N'ds@123', 2, 1)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Surname], [EmailAddress], [CellNumber], [Password], [RoleId], [IsActive]) VALUES (109, N'Malcom', N'Sebothoma', N'mseb@css.co.za', N'0793345500', N'mseb@123', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (1, N'CSS - (New System) System Integration')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (2, N'CSS - (New System) UX/UI Design')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (3, N'CSS - (New System) BackEnd Development')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (4, N'CSS - (New System)Testing')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (5, N'CSS - (Old System) Maintenace & Support')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (6, N'new project test')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (7, N'phase one - Feasibility s')
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (1006, N'Business Analysis - Test ')
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

GO
INSERT [dbo].[Role] ([RoleId], [Description], [isActive]) VALUES (1, N'Developer', 1)
GO
INSERT [dbo].[Role] ([RoleId], [Description], [isActive]) VALUES (2, N'Project Manager', 1)
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] ON 

GO
INSERT [dbo].[TimeSheet] ([TimeSheetId], [EmployeeId], [ProjectId], [StartTime], [EndTime]) VALUES (2, 100, 1, CAST(N'2020-01-05' AS Date), CAST(N'2020-02-27' AS Date))
GO
INSERT [dbo].[TimeSheet] ([TimeSheetId], [EmployeeId], [ProjectId], [StartTime], [EndTime]) VALUES (3, 101, 2, CAST(N'2020-01-05' AS Date), CAST(N'2020-07-07' AS Date))
GO
INSERT [dbo].[TimeSheet] ([TimeSheetId], [EmployeeId], [ProjectId], [StartTime], [EndTime]) VALUES (4, 101, 3, CAST(N'2020-04-05' AS Date), CAST(N'2020-05-10' AS Date))
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Employee]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Project]
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmployee]
	( 
	   @Name as Varchar(30),
	   @Surname as Varchar(30),
	   @EmailAddress as Varchar(50),
	   @CellNumber as Varchar(15),
	   @Password as Varchar(20),
	   @RoleId as int,
	   @isActive as bit

	 )

	 AS
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
BEGIN
	INSERT INTO Employee
	VALUES (@Name,@Surname,@EmailAddress,@CellNumber,@Password,@RoleId,@isActive)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertProject]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertProject]
	( 
	   @ProjectName as Varchar(30)
	   
	   	 )

	 AS
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
BEGIN
	INSERT INTO Project
	VALUES (@ProjectName)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTimeSheet]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[sp_InsertTimeSheet]  
(  
     
   @EmployeeId INT OUTPUT,
   @TimeSheetId as int, 
   @ProjectId as int, 
   @StartTime as Date,
   @EndTime as date
 
)  
AS  
BEGIN  
------------------------------------------------------------------- 
DECLARE @eid INT 
  
IF EXISTS( SELECT 1 FROM TimeSheet WHERE TimeSheetId = @TimeSheetId)

BEGIN
   UPDATE TimeSheet
   SET ProjectId = @ProjectId,
   StartTime  = @StartTime,
   EndTime  = @EndTime  
   WHERE TimeSheetId = @TimeSheetId
END
ELSE  
BEGIN  
INSERT INTO TimeSheet (ProjectId,EmployeeId,StartTime,EndTime)  
VALUES (@ProjectId,@EmployeeId,@StartTime,@EndTime)

SET @eid = SCOPE_IDENTITY()
RETURN @eid
END  
 

  
BEGIN  
SELECT @eid = @EmployeeId FROM TimeSheet  
WHERE TimeSheetId = @TimeSheetId 
END  


END

GO
/****** Object:  StoredProcedure [dbo].[sp_TIMESHEETENTRY]    Script Date: 9/10/2020 7:06:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TIMESHEETENTRY]  
 --@EmailAddress as  varchar(50),
 --@ProjectName as varchar(50),
 @ProjectId INT,
 @StartTime as date,  
 @EndTime as date,
 @EmployeeId int output 
AS  
BEGIN 
 
 ----DECLARE  
 
 --SELECT * from Employee  order by 1 desc
 --DECLARE @EmployeeId INT 
 ----SELECT @EmployeeId = max(@EmployeeId) from Employee

 --Select @EmployeeId = EmployeeId from Employee --Where EmployeeId=@EmployeeId-- EmailAddress=@EmailAddress  --EmployeeId=@EmployeeId
 --SET @EmployeeId=@@IDENTITY  
 --SELECT @EmployeeId
 SET @EmployeeId=SCOPE_IDENTITY()
      RETURN  @EmployeeId
 INSERT into TimeSheet(EmployeeId,ProjectId,StartTime,EndTime) Values (@EmployeeId,@ProjectId,@StartTime,@EndTime)
 SET @EmployeeId=SCOPE_IDENTITY()
      RETURN  @EmployeeId

 END
 


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TimeSheet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 187
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 160
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Project"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4065
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TimeSheetEntry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TimeSheetEntry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TimeSheetEntry'
GO
USE [master]
GO
ALTER DATABASE [TimeTrackerDB] SET  READ_WRITE 
GO
