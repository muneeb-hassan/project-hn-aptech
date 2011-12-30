CREATE DATABASE AlluringDecors
GO
USE AlluringDecors
GO
CREATE TABLE FAQS
(
	FAQSID int identity(1,1) primary key,
	Question varchar(256) not null,
	Answer varchar(1000) not null,
	Visiable int default(0) null
)
GO
CREATE TABLE Feedback
(
	FeedbackID int identity(1,1) primary key,
	FullName varchar(50) not null,
	Email varchar(50) not null,
	Title varchar(256) not null,
	Body varchar(400) not null,
	CreateDate datetime not null,
	ReadFeedback int default(0) null,
	Visiable int default(0) null,
)
GO
CREATE TABLE ContactUS
(
	ContactID int identity(1,1) primary key,
	Contents text not null,
	Visiable int default(0) null
)
GO
CREATE TABLE Category
(
	CategoryID int identity(1,1) primary key,
	ParentID int default(0) null,
	CategoryName varchar(50) not null,
	Visiable int default(0) null
)
GO
CREATE TABLE Services
(
	ServicesID int identity(1,1) primary key,
	ServicesName varchar(256) not null,
	ImagesSmall varchar(156) null,
	Desription varchar(400) not null,
	ServicesDetails text not null,
	CategoryID int not null,
	PriceServices money not null,
	Unit varchar(50) null,--don vi: 1m or 1 chiec
	Visiable int default(0) null,
	CONSTRAINT fk_Services_Category FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID)
)
GO
CREATE TABLE Users
(
	UserID int identity(1,1) primary key,
	UserName varchar(50) not null,
	Passowrd varchar(50) not null,
	FullName varchar(50) not null,
	Address varchar(256) not null,
	Email varchar(50) not null,
	Phone varchar(15) not null,
	Visiable int default(0) null
)
GO
CREATE TABLE Orders
(
	OrderID int identity(1,1) primary key,
	OrderDate datetime not null,
	StartDate datetime not null,
	EndDate datetime not null,
	CanceDate datetime null,
	StatusOrder int default(0) null,
	UserID int not null,
	FullName varchar(50) not null,
	Address varchar(256) not null,
	Email varchar(50) not null,
	Phone varchar(15) not null,
	Visiable int default(0) null,
	CONSTRAINT fk_Order_User FOREIGN KEY(UserID) REFERENCES Users(UserID)
)
GO
CREATE TABLE OrderDetails
(
	OrderDetailsID int identity(1,1) primary key,
	OrderID int not null,
	ServicesID int not null,
	UnitPrice money not null,
	Quantity int not null,
	CONSTRAINT fk_OrderDetails_Order FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT fk_OrderDetails_Services FOREIGN KEY(ServicesID) REFERENCES Services(ServicesID)
)
GO


CREATE TABLE Payment
(
	PaymentID int identity(1,1) primary key,
	PaymentDateFinal datetime not null,
	TotalAmount money not null,--Tong so tien phai tra
	DuePay money default(0) null,-- So tien phai tra neu tra gop nhieu lan
	TypePay int not null,--Kieu thanh toan
	StatusPay int default(0) null,--tinh trang tra
	OrderID int not null,
	CONSTRAINT fk_Payment_Order FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
)
GO
CREATE TABLE PaymentDetails
(
	PaymentDetailsID int identity(1,1) primary key,
	PaidAmount money not null,--So tien tra
	DatePaid datetime not null,--ngay tra
	PaymentID int not null,
	CONSTRAINT fk_PaymentDetails_Payment FOREIGN KEY(PaymentID) REFERENCES Payment(PaymentID)
)
GO
CREATE TABLE Administrator
(
	AdministratorID int identity(1,1) primary key,
	UserName varchar(50) not null,
	Password varchar(50) not null,
	FullName varchar(50) not null,
	Address varchar(256) not null,
	Phone varchar(15) not null,
	Email varchar(50) not null,
	Roles int default(0) null,--0:Quan tri toan quyen, 1: Quan tri Order
	Visiable int default(0) null
)
GO
CREATE TABLE Project
(
	ProjectID int identity(1,1) primary key,
	ProjectName varchar(255) not null,
	Images varchar(255) not null,
	Description varchar(400) not null,
	Details text not null,
	StartDate datetime not null,
	EndDate datetime not null,
	StatusProject int default(0) not null,
	Visiable int default(0) null
)
GO
--\\\\\\\\\\\\\\\\\\\\Insert menu 1 cap///////////

insert into Category values(0, 'Kitchan Design', 0)
insert into Category values(0, 'Flooring Layout', 0)
insert into Category values(0, 'Lightning Efects', 0)
insert into Category values(0, 'Window Converings', 0)
insert into Category values(0, 'Colour Schemes', 0)
insert into Category values(0, 'Curtain Designing', 0)
insert into Category values(0, 'Architectural Design', 0)
insert into Category values(0, 'Planting', 0)
insert into Category values(0, 'Living Rooms', 0)
insert into Category values(0, 'Kitchan Design', 0)
insert into Category values(0, 'Bedroom Decor', 0)
insert into Category values(0, 'Kitchen Decor', 0)
insert into Category values(0, 'Color Basics', 0)
insert into Category values(0, 'Designing Tips', 0)
insert into Category values(0, 'Dorm Decor', 0)
insert into Category values(0, 'Home Cleaning', 0)
insert into Category values(0, 'Small Space Living', 0)
insert into Category values(0, 'Children Room', 0)
insert into Category values(0, 'Bathroom Decor', 0)