USE [Online_Help_Desk]
GO
/****** Object:  StoredProcedure [dbo].[Request_GetbyWhere]    Script Date: 04/09/2012 13:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Request_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT RequestID,UserID,FacilityID,SeverityID,StatusID,RequestName,RequestSubject,RequestDetail,
			RequestDate,RequestLastDate,Status FROM Requests'+ @strWhere + @strOrder)
GO
/****** Object:  StoredProcedure [dbo].[Severity_GetbyWhere]    Script Date: 04/09/2012 13:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Severity_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT Severitys.SeverityID,Severitys.SeverityName,Severitys.Status FROM Severitys '
		+ @strWhere + @strOrder)
GO
/****** Object:  StoredProcedure [dbo].[FAQs_GetbyWhere]    Script Date: 04/09/2012 13:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[FAQs_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT FAQs.FaqID,FAQs.Question,FAQs.Answers,FAQs.Rating,FAQs.Status FROM FAQs '
		+ @strWhere + @strOrder)
GO
/****** Object:  Table [dbo].[Status]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severitys]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severitys](
	[SeverityID] [int] IDENTITY(1,1) NOT NULL,
	[SeverityName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_Severitys] PRIMARY KEY CLUSTERED 
(
	[SeverityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DateRegister] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Users_GetbyWhere]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Users_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT UserID,UserName,FirstName,[Password],Gender,Email,Telephone,[Address],
			DateRegister,Status FROM Users'+ @strWhere + @strOrder)
GO
/****** Object:  StoredProcedure [dbo].[Status_GetbyWhere]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Status_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('	SELECT StatusID,StatusName,Status FROM Status '
		+ @strWhere + @strOrder)
GO
/****** Object:  Table [dbo].[Facilitys]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilitys](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_Facility] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Admin_GetbyWhere]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT AdminID,FacilityID,RoleID,AdminName,FirstName,[Password],Gender,DateRegister,Email,
			Telephone,[Address],Status FROM ADMIN'+ @strWhere + @strOrder)
GO
/****** Object:  StoredProcedure [dbo].[Admin_Request_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Request_Delete]
	@AdminID	int,
	@RequestID	int
AS
	 DELETE FROM Users_Requests WHERE AdminID = @AdminID and RequestID = @RequestID
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Admin_Request_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Request_Insert]
	@AdminID		int,
	@RequestID	int,
	@Remarks	nvarchar(100)
AS
	Insert Into Users_Requests(UserID,RequestID,Remarks)
    values(@AdminID,@RequestID,@Remarks)
GO
/****** Object:  StoredProcedure [dbo].[Admin_Request_GetbyWhere]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Request_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT AdminID,RequestID,Remarks FROM Admin_Requests '
		+ @strWhere + @strOrder)
GO
/****** Object:  StoredProcedure [dbo].[Facilitys_GetbyWhere]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Facilitys_GetbyWhere]
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT FacilityID,FacilityName,Status FROM Facilitys '
		+ @strWhere + @strOrder)
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[FaqId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [text] NULL,
	[Answers] [text] NULL,
	[Rating] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_FAQs] PRIMARY KEY CLUSTERED 
(
	[FaqId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Facilitys_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Facilitys_Update]
	@FacilityID		int,
	@FacilityName	nvarchar(50), 
	@Status		bit
AS
	Update Facilitys 
		SET FacilityName = @FacilityName,Status = @Status
		WHERE FacilityID = @FacilityID
GO
/****** Object:  StoredProcedure [dbo].[Facilitys_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Facilitys_Insert]
	@FacilityName	nvarchar(50), 
	@Status		bit
AS
	Insert Into Facilitys(FacilityName,Status)
    values(@FacilityName,@Status)
GO
/****** Object:  StoredProcedure [dbo].[Facilitys_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Facilitys_GetbyAll]
AS
	SELECT FacilityID,FacilityName,Status FROM Facilitys
GO
/****** Object:  StoredProcedure [dbo].[Facilitys_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Facilitys_Delete]
	@FacilityID		int
AS
	 DELETE FROM Facilitys WHERE FacilityID = @FacilityID
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FacilityID] [int] NULL,
	[SeverityID] [int] NULL,
	[StatusID] [int] NULL,
	[RequestName] [nvarchar](50) NULL,
	[RequestSubject] [nvarchar](50) NULL,
	[RequestDetail] [nvarchar](50) NULL,
	[RequestDate] [datetime] NULL,
	[RequestLastDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pkRequests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NULL,
	[RoleID] [int] NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DateRegister] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AdminName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Users_Insert]
	@Gender		bit,
	@DateRegister	DateTime,
	@UserName	nvarchar(50),
	@FirstName	nvarchar(50),
	@Password	nvarchar(50),
	@Email		nvarchar(50),
	@Telephone	nvarchar(50),
	@Address	nvarchar(50),
	@Status		int
AS
	Insert Into Users(UserName,FirstName,Password,Gender,DateRegister,Email,Telephone,Address,Status)
    values(@UserName,@FirstName,@Password,@Gender,@DateRegister,@Email,@Telephone,@Address,@Status)
GO
/****** Object:  StoredProcedure [dbo].[Status_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Status_GetbyAll]
AS
	SELECT StatusID,StatusName [Status] FROM Status
GO
/****** Object:  StoredProcedure [dbo].[Status_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Status_Delete]
	@StatusID		int
AS
	 DELETE FROM Status WHERE StatusID = @StatusID
GO
/****** Object:  StoredProcedure [dbo].[Users_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Users_GetbyAll]
AS
	SELECT UserID,UserName,FirstName,[Password],Gender,Email,Telephone,[Address],DateRegister,Status FROM Users
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Users_Delete]
	@UserID		int
AS
	 DELETE FROM Users WHERE UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[Users__Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Users__Update]
	@UserID		int, 
	@UserName	nvarchar(50),
	@FirstName	nvarchar(50),
	@Gender		bit,
	@DateRegister	DateTime,
	@Password	nvarchar(50),
	@Email		nvarchar(50),
	@Telephone	nvarchar(50),
	@Address	nvarchar(50),
	@Status		int
AS
	Update Users 
		SET UserName = @UserName,Gender = @Gender,DateRegister = @DateRegister,
		FirstName = @FirstName,Password = @Password,Email = @Email,Telephone = @Telephone,
		[Address] = @Address,[Status] = @Status Where UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[Status_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Status_Update]
	@StatusID		int,
	@StatusName		int,
	@Status			bit
AS
	Update Status 
		SET StatusName = @StatusName,Status = @Status
	WHERE StatusID = @StatusID
GO
/****** Object:  StoredProcedure [dbo].[Status_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Status_Insert]
	@StatusName	int,
	@Status		bit
AS
	Insert Into Status(StatusName,Status)
    values(@StatusName,@Status)
GO
/****** Object:  StoredProcedure [dbo].[Severity_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Severity_Update]
	@SevertyID		int,
	@SeverityName	int, 
	@Status				bit
AS
	Update Severitys 
		SET SeverityName = @SeverityName,Status = @Status
	WHERE SeverityID = @SevertyID
GO
/****** Object:  StoredProcedure [dbo].[Severity_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Severity_Insert]
	@SeverityName	int, 
	@Status				bit
AS
	Insert Into Severitys(SeverityName,Status)
    values(@SeverityName,@Status)
GO
/****** Object:  StoredProcedure [dbo].[FAQs_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[FAQs_Update]
	@FaqID		int,
	@Question	TEXT,
	@Answers	TEXT,
	@Rating		int,
	@Status		bit
AS
	Update FAQs 
		SET Question = @Question,Answers = @Answers,Rating = @Rating,Status = @Status
	WHERE FaqID = @FaqID
GO
/****** Object:  StoredProcedure [dbo].[FAQs_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[FAQs_Insert]
	@Question	TEXT,
	@Answers	TEXT,
	@Rating		int,
	@Status		bit
AS
	Insert Into FAQs(Question,Answers,Rating,Status)
    values(@Question,@Answers,@Rating,@Status)
GO
/****** Object:  StoredProcedure [dbo].[FAQs_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[FAQs_GetbyAll]
AS
	SELECT FAQs.FaqID,FAQs.Question,FAQs.Answers,FAQs.Rating,FAQs.Status FROM FAQs
GO
/****** Object:  StoredProcedure [dbo].[FAQs_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[FAQs_Delete]
	@FaqID		int
AS
	 DELETE FROM FAQs WHERE FaqID = @FaqID
GO
/****** Object:  StoredProcedure [dbo].[Severity_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Severity_GetbyAll]
AS
	SELECT Severitys.SeverityID,Severitys.SeverityName,Severitys.Status FROM Severitys
GO
/****** Object:  StoredProcedure [dbo].[Severity_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Severity_Delete]
	@SeverityID		int
AS
	 DELETE FROM Severitys WHERE SeverityID = @SeverityID
GO
/****** Object:  StoredProcedure [dbo].[Request_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Request_GetbyAll]
AS
	SELECT RequestID,UserID,FacilityID,SeverityID,StatusID,RequestName,RequestSubject,RequestDetail,
			RequestDate,RequestLastDate,Status FROM Requests
GO
/****** Object:  StoredProcedure [dbo].[Request_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Request_Delete]
	@RequestID		int
AS
	 DELETE FROM Requests WHERE RequestID = @RequestID
GO
/****** Object:  StoredProcedure [dbo].[Admin_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Insert]
	@FacilityID	int,
	@RoleID		int,
	@AdminName	nvarchar(50),
	@FirstName	nvarchar(50),
	@Password	nvarchar(50),
	@Email		nvarchar(50),
	@Telephone	nvarchar(50),
	@Gender		bit,
	@DateRegister	DateTime,
	@Address	nvarchar(50),
	@Status		int
AS
	Insert Into Admin(FacilityID,RoleID,AdminName,FirstName,Password,Email,Telephone,Gender,DateRegister,Address,Status)
    values(@FacilityID,@RoleID,@AdminName,@FirstName,@Password,@Email,@Telephone,@Gender,@DateRegister,@Address,@Status)
GO
/****** Object:  StoredProcedure [dbo].[Admin_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_GetbyAll]
AS
	SELECT AdminID,FacilityID,RoleID,AdminName,FirstName,[Password],Gender,DateRegister,Email,Telephone,[Address],Status FROM ADMIN
GO
/****** Object:  StoredProcedure [dbo].[Admin_Delete]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Delete]
	@AdminID		int
AS
	 DELETE FROM Admin WHERE AdminID = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[Admin_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Update]
	@AdminID		int,
	@FacilityID	int,
	@RoleID		int,
	@AdminName	nvarchar(50),
	@FirstName	nvarchar(50),
	@Password	nvarchar(50),
	@Email		nvarchar(50),
	@Telephone	nvarchar(50),
	@Address	nvarchar(50),
	@Gender		bit,
	@DateRegister Datetime,
	@Status		int
AS
	Update [Admin]
		SET FacilityID = @FacilityID,RoleID = @RoleID,AdminName = @AdminName,
		FirstName = @FirstName,Password = @Password,Email = @Email,Telephone = @Telephone,Gender=@Gender,DateRegister = @DateRegister,
		[Address] = @Address,[Status] = @Status Where AdminID = @AdminID
GO
/****** Object:  Table [dbo].[Admin_Requests]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Requests](
	[AdminID] [int] NOT NULL,
	[RequestID] [int] NOT NULL,
	[Remarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_Admin_Requests] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC,
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Request_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Request_Update]
	@RequestID		int,
	@UserID			int,
	@FacilityID		int,
	@SevertyID		int,
	@StatusID		int,
	@RequestName	nvarchar(50),
	@RequestSubject	nvarchar(50),
	@RequestDetail	nvarchar(50),
	@RequestDate	DateTime,
	@RequestLastDate	Datetime,
	@Status				bit
AS
	Update Requests 
		SET UserID = @UserID, FacilityID = @FacilityID,SeverityID = @SevertyID,StatusID = @StatusID,
		RequestName = @RequestName,RequestSubject = @RequestSubject,RequestDetail = @RequestDetail,
		RequestDate = @RequestDate,RequestLastDate = @RequestLastDate,[Status] = @Status 
		WHERE RequestID = @RequestID
GO
/****** Object:  StoredProcedure [dbo].[Request_Insert]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Request_Insert]
	@FacilityID		int,
	@UserID			int,
	@SevertyID		int,
	@StatusID		int,
	@RequestName	nvarchar(50),
	@RequestSubject	nvarchar(50),
	@RequestDetail	nvarchar(50),
	@RequestDate	DateTime,
	@RequestLastDate	Datetime,
	@Status				bit
AS
	Insert Into Requests(FacilityID,UserID,SeverityID,StatusID,RequestName,RequestSubject,RequestDetail,RequestDate,RequestLastDate,Status)
    values(@FacilityID,@UserID,@SevertyID,@StatusID,@RequestName,@RequestSubject,@RequestDetail,@RequestDate,@RequestLastDate,@Status)
GO
/****** Object:  StoredProcedure [dbo].[Admin_Request_GetbyAll]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Request_GetbyAll]
AS
	SELECT AdminID,RequestID,Remarks FROM Admin_Requests
GO
/****** Object:  StoredProcedure [dbo].[Admin_Request_Update]    Script Date: 04/09/2012 13:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Admin_Request_Update]
	@AdminID		int,
	@RequestID	int,
	@Remarks	nvarchar(100)
AS
	Update Admin_Requests 
		SET Remarks = @Remarks
	WHERE AdminID = @AdminID and RequestID = @RequestID
GO
/****** Object:  ForeignKey [FK_Requests_Facilitys]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Facilitys] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilitys] ([FacilityID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Facilitys]
GO
/****** Object:  ForeignKey [FK_Requests_Severitys]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Severitys] FOREIGN KEY([SeverityID])
REFERENCES [dbo].[Severitys] ([SeverityID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Severitys]
GO
/****** Object:  ForeignKey [FK_Requests_Status]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Status]
GO
/****** Object:  ForeignKey [FK_Requests_Users]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
/****** Object:  ForeignKey [FK_Admin_Role]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Role]
GO
/****** Object:  ForeignKey [FK_Facilitys_Admin]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Facilitys_Admin] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilitys] ([FacilityID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Facilitys_Admin]
GO
/****** Object:  ForeignKey [FK_Users_Requests_Admin]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Admin_Requests]  WITH CHECK ADD  CONSTRAINT [FK_Users_Requests_Admin] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Admin_Requests] CHECK CONSTRAINT [FK_Users_Requests_Admin]
GO
/****** Object:  ForeignKey [FK_Users_Requests_Requests]    Script Date: 04/09/2012 13:41:08 ******/
ALTER TABLE [dbo].[Admin_Requests]  WITH CHECK ADD  CONSTRAINT [FK_Users_Requests_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([RequestID])
GO
ALTER TABLE [dbo].[Admin_Requests] CHECK CONSTRAINT [FK_Users_Requests_Requests]
GO
