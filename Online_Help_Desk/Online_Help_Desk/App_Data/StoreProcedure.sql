use OHD
Go
-----------Start Roles ----------

Create Proc Roles_GetbyAll
AS
	SELECT RoleID,RoleName,RoleDescription,Status FROM Roles
GO

Create Proc Roles__Update
	@RoleID	int,
	@RoleName	nvarchar(50),
	@RoleDescription	nvarchar(100),
	@Status		bit
AS
	Update Roles 
		SET RoleName = @RoleName,RoleDescription = @RoleDescription, Status = @Status Where RoleID = @RoleID
Go  

Create Proc Roles_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT RoleID,RoleName,RoleDescription,Status FROM Roles'+ @strWhere + @strOrder)
Go	

Create Proc Roles_Insert
	@RoleName nvarchar(50),
	@RoleDescription	nvarchar(100),
	@Status	  bit
AS
	Insert Into Roles values(@RoleName,@RoleDescription,@Status)
Go

Create Proc Roles_Delete
	@RoleID		int
AS
	 DELETE FROM Roles Where RoleID = @RoleID
Go 

--------------- End Roles -----------------

--------------- Start Users ---------------


Create Proc Users_GetbyAll
AS
	SELECT UserID,RoleID,FacilityID,UserName,FirstName,LastName,[Password],Gender,Email,PhoneNumber,[Address],RegisterDate,Status FROM Users
GO

Create Proc Users__Update
	@UserID		int, 
	@RoleID		int,
	@FacilityID	int,
	@UserName	nvarchar(50),
	@FirstName	nvarchar(50),
	@LastName	nvarchar(50),
	@Gender		bit,
	@RegisterDate	DateTime,
	@Password	nvarchar(50),
	@Email		nvarchar(50),
	@PhoneNumber	nvarchar(50),
	@Address	nvarchar(50),
	@Status		int
AS
	Update Users 
		SET RoleID = @RoleID,FacilityID = @FacilityID,LastName = @LastName, UserName = @UserName,Gender = @Gender,RegisterDate = @RegisterDate,
		FirstName = @FirstName,Password = @Password,Email = @Email,PhoneNumber = @PhoneNumber,
		[Address] = @Address,[Status] = @Status Where UserID = @UserID
Go  

Create Proc Users_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT UserID,RoleID,FacilityID,UserName,FirstName,LastName,[Password],Gender,Email,PhoneNumber,[Address],
			RegisterDate,Status FROM Users'+ @strWhere + @strOrder)
Go	

Create Proc Users_Insert
	@RoleID		int,
	@FacilityID	int,
	@UserName	nvarchar(50),
	@FirstName	nvarchar(50),
	@LastName	nvarchar(50),
	@Gender		bit,
	@RegisterDate	DateTime,
	@Password	nvarchar(50),
	@Email		nvarchar(50),
	@PhoneNumber	nvarchar(50),
	@Address	nvarchar(50),
	@Status		int
AS
	Insert Into Users(RoleID,FacilityID,UserName,LastName,FirstName,Password,Gender,RegisterDate,Email,PhoneNumber,Address,Status)
    values(@RoleID,@FacilityID,@UserName,@LastName,@FirstName,@Password,@Gender,@RegisterDate,@Email,@PhoneNumber,@Address,@Status)
Go

Create Proc Users_Delete
	@UserID		int
AS
	 DELETE FROM Users WHERE UserID = @UserID
Go 

------------- End Users ----------------

------------- End ADMIN ----------------

Create Proc Admin_GetbyAll
AS
	SELECT AdminID,AdminName,Password,AdminLevel,Status FROM Administrators
GO

Create Proc Admin_Update
	@AdminID		int, 
	@AdminName	nvarchar(50), 
	@Password	nvarchar(50), 
	@AdminLevel	INT, 
	@Status		int
AS
	Update [Administrators]
		SET AdminName = @AdminName,Password = @Password,AdminLevel = @AdminLevel,[Status] = @Status Where AdminID = @AdminID
Go  

Create Proc Admin_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT AdminID,AdminName,Password,AdminLevel,Status FROM Administrators'+ @strWhere + @strOrder)
Go	

Create Proc Admin_Insert 
	@AdminLevel	int,
	@AdminName	varchar(25),
	@Password	varchar(25),
	@Status		int
AS
	Insert Into Administrators(AdminName,Password,AdminLevel,Status)
    values(@AdminName,@Password,@AdminLevel,@Status)
Go

Create Proc Admin_Delete
	@AdminID		int
AS
	 DELETE FROM Administrators WHERE AdminID = @AdminID
Go 

------------- End Users ----------------


------------- Start Request ------------
 
Create Proc Request_GetbyAll
AS
	SELECT RequestID,UserID,FacilityID,SeverityID,StatusID,RequestName,RequestDescription,
			StartDate,EndDate,Status FROM Requests
GO

Create Proc Request_Update
	@RequestID		int,
	@UserID			int,
	@FacilityID		int,
	@SevertyID		int,
	@StatusID		int,
	@RequestName	nvarchar(50),
	@RequestDescription	nvarchar(100), 
	@StartDate	DateTime,
	@EndDate	Datetime,
	@Status		bit
AS
	Update Requests 
		SET UserID = @UserID, FacilityID = @FacilityID,SeverityID = @SevertyID,StatusID = @StatusID,
		RequestName = @RequestName,RequestDescription = @RequestDescription,
		StartDate = @StartDate,EndDate = @EndDate,[Status] = @Status
		WHERE RequestID = @RequestID
Go  

Create Proc Request_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT RequestID,UserID,FacilityID,SeverityID,StatusID,RequestName,RequestDescription,
			StartDate,EndDate,Status FROM Requests'+ @strWhere + @strOrder)
Go	

Create Proc Request_Insert
	@UserID			int,
	@FacilityID		int,
	@SevertyID		int,
	@StatusID		int,
	@RequestName	nvarchar(50),
	@RequestDescription	nvarchar(100), 
	@StartDate	DateTime,
	@EndDate	Datetime,
	@Status		bit
AS
	Insert Into Requests(FacilityID,UserID,SeverityID,StatusID,RequestName,RequestDescription,StartDate,EndDate,Status)
    values(@FacilityID,@UserID,@SevertyID,@StatusID,@RequestName,@RequestDescription,@StartDate,@EndDate,@Status)
Go

Create Proc Request_Delete
	@RequestID		int
AS
	 DELETE FROM Requests WHERE RequestID = @RequestID
Go 

------------- End Request --------------

------------- Start Severitys ------------
Select *from Severities
Create Proc Severity_GetbyAll
AS
	SELECT Severitys.SeverityID,Severitys.SeverityName,Severitys.Status FROM Severitys
GO

Create Proc Severity_Update
	@SevertyID		int,
	@SeverityName	int, 
	@Status				bit
AS
	Update Severitys 
		SET SeverityName = @SeverityName,Status = @Status
	WHERE SeverityID = @SevertyID
Go  

Create Proc Severity_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT Severitys.SeverityID,Severitys.SeverityName,Severitys.Status FROM Severitys '
		+ @strWhere + @strOrder)
Go	

Create Proc Severity_Insert
	@SeverityName	int, 
	@Status				bit
AS
	Insert Into Severitys(SeverityName,Status)
    values(@SeverityName,@Status)
Go

Create Proc Severity_Delete
	@SeverityID		int
AS
	 DELETE FROM Severitys WHERE SeverityID = @SeverityID
Go 

------------- End Severitys --------------

------------- Start STATUS ------------
Select *from Status
Create Proc Status_GetbyAll
AS
	SELECT StatusID,StatusName [Status] FROM Status
GO

Create Proc Status_Update
	@StatusID		int,
	@StatusName		int,
	@Status			bit
AS
	Update Status 
		SET StatusName = @StatusName,Status = @Status
	WHERE StatusID = @StatusID
Go  

Create Proc Status_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('	SELECT StatusID,StatusName,Status FROM Status '
		+ @strWhere + @strOrder)
Go	

Create Proc Status_Insert
	@StatusName	int,
	@Status		bit
AS
	Insert Into Status(StatusName,Status)
    values(@StatusName,@Status)
Go

Create Proc Status_Delete
	@StatusID		int
AS
	 DELETE FROM Status WHERE StatusID = @StatusID
Go 

------------- End STATUS --------------

------------- Start Admin__REQUEST ------------

Create Proc Admin_Request_GetbyAll
AS
	SELECT AdminID,RequestID,Remarks FROM Admin_Requests
GO

Create Proc Admin_Request_Update
	@AdminID		int,
	@RequestID	int,
	@Remarks	nvarchar(100)
AS
	Update Admin_Requests 
		SET Remarks = @Remarks
	WHERE AdminID = @AdminID and RequestID = @RequestID
Go  

Create Proc Admin_Request_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT AdminID,RequestID,Remarks FROM Admin_Requests '
		+ @strWhere + @strOrder)
Go	

Create Proc Admin_Request_Insert
	@AdminID		int,
	@RequestID	int,
	@Remarks	nvarchar(100)
AS
	Insert Into Users_Requests(UserID,RequestID,Remarks)
    values(@AdminID,@RequestID,@Remarks)
Go

Create Proc Admin_Request_Delete
	@AdminID	int,
	@RequestID	int
AS
	 DELETE FROM Users_Requests WHERE AdminID = @AdminID and RequestID = @RequestID
Go 

------------- End Users_Requests --------------

------------- Start FAQs ------------

Create Proc FAQs_GetbyAll
AS
	SELECT FAQs.FaqID,FAQs.Question,FAQs.Answers,FAQs.Rating,FAQs.Status FROM FAQs
GO

Create Proc FAQs_Update
	@FaqID		int,
	@Question	TEXT,
	@Answers	TEXT,
	@Rating		int,
	@Status		bit
AS
	Update FAQs 
		SET Question = @Question,Answers = @Answers,Rating = @Rating,Status = @Status
	WHERE FaqID = @FaqID
Go  

Create Proc FAQs_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT FAQs.FaqID,FAQs.Question,FAQs.Answers,FAQs.Rating,FAQs.Status FROM FAQs '
		+ @strWhere + @strOrder)
Go	

Create Proc FAQs_Insert
	@Question	TEXT,
	@Answers	TEXT,
	@Rating		int,
	@Status		bit
AS
	Insert Into FAQs(Question,Answers,Rating,Status)
    values(@Question,@Answers,@Rating,@Status)
Go

Create Proc FAQs_Delete
	@FaqID		int
AS
	 DELETE FROM FAQs WHERE FaqID = @FaqID
Go 

------------- End FAQs --------------

------------- Start FACILITYs ------------

Create Proc Facilitys_GetbyAll
AS
	SELECT FacilityID,FacilityName,Status FROM Facilitys
GO

Create Proc Facilitys_Update
	@FacilityID		int,
	@FacilityName	nvarchar(50), 
	@Status		bit
AS
	Update Facilitys 
		SET FacilityName = @FacilityName,Status = @Status
		WHERE FacilityID = @FacilityID
Go  

Create Proc Facilitys_GetbyWhere
	@strWhere varchar(4096) = '',
	@strOrder varchar(4096) = ''
AS
	IF @strWhere <> ''
		SET @strWhere = ' WHERE ' + @strWhere
	IF @strOrder <> ''
		SET @strOrder = ' ORDER BY ' + @strOrder
	Exec('SELECT FacilityID,FacilityName,Status FROM Facilitys '
		+ @strWhere + @strOrder)
Go	

Create Proc Facilitys_Insert
	@FacilityName	nvarchar(50), 
	@Status		bit
AS
	Insert Into Facilitys(FacilityName,Status)
    values(@FacilityName,@Status)
Go

Create Proc Facilitys_Delete
	@FacilityID		int
AS
	 DELETE FROM Facilitys WHERE FacilityID = @FacilityID
Go 

------------- End Facilitys --------------