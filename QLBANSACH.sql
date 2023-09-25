CREATE DATABASE QLBANSACH
GO

USE QLBANSACH
GO


-----Table
CREATE TABLE USERS
(
	Id CHAR(10) NOT NULL,
	FullName NVARCHAR(30) NOT NULL,
	Password VARCHAR(30) NOT NULL,
	Email VARCHAR(255),
	Phone CHAR(10) NOT NULL
)

CREATE TABLE ROLES
(
	Id CHAR(10) NOT NULL,
	Name NVARCHAR(30) NOT NULL
)

CREATE TABLE USERROLES
(
	Id CHAR(10) NOT NULL,
	UserId CHAR(10) NOT NULL,
	RoleId CHAR(10) NOT NULL
)

CREATE TABLE WEBACTIONS
(
	Id CHAR(10) NOT NULL,
	Name NVARCHAR(30),
)

CREATE TABLE ROLEACTIONS
(
	Id CHAR(10) NOT NULL,
	RoleId CHAR(10) NOT NULL,
	WebActionId CHAR(10) NOT NULL,
)

CREATE TABLE CATEGORIES
(
	Id CHAR(10) NOT NULL,
	Name NVARCHAR(50)
)

CREATE TABLE BANNERS
(
	Id CHAR(10) NOT NULL,
	Name NVARCHAR(50),
	Description NTEXT
)

CREATE TABLE VOUCHERS
(
	Id CHAR(10) NOT NULL,
	Quantity INT,
	PercentDiscount DECIMAL,
	MaxDiscount MONEY
)

CREATE TABLE AUTHORS
(
	Id CHAR(10) NOT NULL,
	Name NVARCHAR(50),
	Image IMAGE,
	Description NTEXT
)
CREATE TABLE SUPPLIERS
(
	Id CHAR(10) NOT NULL,
	Name NVARCHAR(50),
	Email VARCHAR(255),
	Description NTEXT,
	Phone CHAR(10) NOT NULL
)

CREATE TABLE CUSTOMERS
(
	Id CHAR(10) NOT NULL,
	FullName CHAR(50),
	Photo IMAGE,
	Activated CHAR(50),
	Password CHAR(10),
	Email VARCHAR(255),
	Phone CHAR(10) NOT NULL
)


CREATE TABLE BOOKS
(
	Id CHAR(10) NOT NULL,
	Title NVARCHAR(50),
	Image IMAGE,
	AuthorId CHAR(10) NOT NULL,
	SupplierId CHAR(10) NOT NULL,
	UnitPrice MONEY,
	PublishYear INT,
	Available BIT,
	Quantity INT
)

CREATE TABLE BOOKDETAILS
(
	Id CHAR(10) NOT NULL,
	BookId CHAR(10) NOT NULL,
	CategoryId CHAR(10) NOT NULL,
	Dimensions CHAR(20),
	Pages INT,
	Description NTEXT
)

CREATE TABLE ORDERS
(
	Id CHAR(10) NOT NULL,
	CustomerId CHAR(10) NOT NULL,
	OrderDate DATETIME,
	Status TINYINT,
	Address NVARCHAR(100),
	Description NTEXT
)

CREATE TABLE ORDERDETAILS
(
	Id CHAR(10) NOT NULL,
	OrderId CHAR(10) NOT NULL,
	BookId CHAR(10) NOT NULL,
	UnitPrice MONEY,
	Quantity INT,
)

CREATE TABLE BILLS
(
	Id CHAR(10) NOT NULL,
	OrderId CHAR(10) NOT NULL,
	UserId CHAR(10) NOT NULL,
	VoucherId CHAR(10) NOT NULL,
	BillDate DATETIME,
	TotalAmount MONEY
)



-----Primary key 
ALTER TABLE USERS
ADD PRIMARY KEY (Id);

ALTER TABLE ROLES
ADD PRIMARY KEY (Id);

ALTER TABLE USERROLES
ADD PRIMARY KEY (Id);

ALTER TABLE WEBACTIONS
ADD PRIMARY KEY (Id);

ALTER TABLE ROLEACTIONS
ADD PRIMARY KEY (Id);

ALTER TABLE CATEGORIES
ADD PRIMARY KEY (Id);

ALTER TABLE BANNERS
ADD PRIMARY KEY (Id);

ALTER TABLE VOUCHERS
ADD PRIMARY KEY (Id);

ALTER TABLE AUTHORS
ADD PRIMARY KEY (Id);

ALTER TABLE SUPPLIERS
ADD PRIMARY KEY (Id);

ALTER TABLE CUSTOMERS
ADD PRIMARY KEY (Id);

ALTER TABLE BOOKS
ADD PRIMARY KEY (Id);

ALTER TABLE BOOKDETAILS
ADD PRIMARY KEY (Id);

ALTER TABLE ORDERS
ADD PRIMARY KEY (Id);

ALTER TABLE ORDERDETAILS
ADD PRIMARY KEY (Id);

ALTER TABLE BILLS
ADD PRIMARY KEY (Id);



-----Forgein key
--1
ALTER TABLE BOOKDETAILS
ADD CONSTRAINT FK_BOOKDETAILS_CATEGORIES
FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id);
--2
ALTER TABLE BOOKDETAILS
ADD CONSTRAINT FK_BOOKDETAILS_BOOKS
FOREIGN KEY (BookId) REFERENCES BOOKS(Id);
--3
ALTER TABLE BOOKS
ADD CONSTRAINT FK_BOOKS_AUTHORS
FOREIGN KEY (AuthorId) REFERENCES AUTHORS(Id);
--4
ALTER TABLE BOOKS
ADD CONSTRAINT FK_BOOKS_SUPPLIERS
FOREIGN KEY (SupplierId) REFERENCES SUPPLIERS(Id);
--5
ALTER TABLE ORDERDETAILS
ADD CONSTRAINT FK_ORDERDETAILS_BOOKS
FOREIGN KEY (BookId) REFERENCES BOOKS(Id);
--6
ALTER TABLE ORDERDETAILS
ADD CONSTRAINT FK_ORDERDETAILS_ORDERS
FOREIGN KEY (OrderId) REFERENCES ORDERS(Id);
--7
ALTER TABLE ORDERS
ADD CONSTRAINT FK_ORDERS_CUSTOMERS
FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(Id);
--8
ALTER TABLE BILLS
ADD CONSTRAINT FK_BILLS_VOUCHERS
FOREIGN KEY (VoucherId) REFERENCES VOUCHERS(Id);
--9
ALTER TABLE BILLS
ADD CONSTRAINT FK_BILLS_ORDERS
FOREIGN KEY (OrderId) REFERENCES ORDERS(Id);
--10
ALTER TABLE BILLS
ADD CONSTRAINT FK_BILLS_USERS
FOREIGN KEY (UserId) REFERENCES USERS(Id);
--11
ALTER TABLE USERROLES
ADD CONSTRAINT FK_USERROLES_USERS
FOREIGN KEY (UserId) REFERENCES USERS(Id);
--12
ALTER TABLE USERROLES
ADD CONSTRAINT FK_USERROLES_ROLES
FOREIGN KEY (RoleId) REFERENCES ROLES(Id);
--13
ALTER TABLE ROLEACTIONS
ADD CONSTRAINT FK_ROLEACTIONS_ROLES
FOREIGN KEY (RoleId) REFERENCES ROLES(Id);
--14
ALTER TABLE ROLEACTIONS
ADD CONSTRAINT FK_ROLEACTIONS_WEBACTIONS
FOREIGN KEY (WebActionId) REFERENCES WEBACTIONS(Id);



-----Insert
INSERT INTO USERS
VALUES ('U10000', N'Nguyễn Đức Ân', '123', 'firewolf148@gmail.com', '0337333918'),
('U10001', N'Lê Thị Hồng Ngọt', '123', 'lehongongot17102003@gmail.com', '0384753419');

INSERT INTO ROLES
VALUES ('R100', N'Admin'),
       ('R101', N'Nhân viên kho')

INSERT INTO USERROLES
VALUES ('UR1000', 'U10000', 'R100'),
('UR1001', 'U10000', 'R101')

INSERT INTO WEBACTIONS 
VALUES ('WA1000',N'Thêm user'),
	   ('WA1001',N'Xóa user'),
	   ('WA1002',N'Sửa user'),
	   ('WA1003',N'Xem danh sách user')

INSERT INTO ROLEACTIONS 
VALUES ('RA1000','R101','WA1000'),
	   ('RA1001','R101','WA1001')

INSERT INTO BANNERS 
VALUES ('B1', N' Quảng cáo', N' Quảng cáo bán sách'),
     ('B2', N'Anh văn ', N'Quảng cáo sách anh văn')

INSERT INTO VOUCHERS 
VALUES ('VKANN',10,0.2,50000),
	   ('VNNKA',20,0.3,20000)

INSERT INTO CATEGORIES 
VALUES ('C_VH',N'Văn học'),
	   ('C_KT',N'Kinh tế')

INSERT INTO AUTHORS 
VALUES ('A100',N'Ngô Tất Tố','//',N'Là văn,nhà nho, nhà văn học Việt Nam'),
	   ('A101',N'Nam Cao','//',N'Nhà văn, nhà thơ, nhà báo và cũng là một chiến sĩ, liệt sỹ người Việt Nam')
	 
INSERT INTO SUPPLIERS
VALUES ('S1000',N'Minh Long','minhlong@gmail.com',N'Cung cấp sách văn thơ','0384753419'),
	   ('S1001',N'Nguyễn Đức Ân','firewolf148@gmail.com',N'Cung cấp sách kinh tế','0337333918')

INSERT INTO CUSTOMERS
VALUES ('C10000',N'Nguyễn Văn A',0x0123456789ABCDEF,N'Đã kích hoạt','123hfs','firewolf148@gmail.com','0337333918'),
	   ('C10001',N'Lê Thị B',0x0123456789ABCDEF,N'Chưa kích hoạt','123hfs','lehongngot17102003@gmail.com','0384753419')

INSERT INTO BOOKS
VALUES ('B1000',N'Tuyển tập Ngô Tất Tố','//','A100','S1000',107250,2023,1,10),
	   ('B1001',N'Tuyển tập Nam Cao','//','A101','S1000',114250,2022,1,10)

INSERT INTO BOOKDETAILS
VALUES ('BD1000','B1000','C_VH','20.5 x 14.5 cm',720,N'Ngô Tất Tố sinh tại làng Lộc Hà, tổng Hội Phụ, phủ Từ Sơn, nay là thôn Lộc Hà, huyện Đông Anh, Hà Nội. Ông là một trong những nhà văn sáng lập trào lưu hiện thực trong nền NXB Văn Học nước nhà trước năm 1945 với các tác phẩm tiêu biểu như Tắt đèn, Việc làng, Lều chõng, Tập án cái đình... Ngô Tất Tố đồng thời là nhà báo nổi tiếng với biệt tài viết tản văn và chính luận, là nhà văn hoá thành danh với các pho truyện lịch sử, khảo cứu triết học, dịch thuật, phê bình... Với tổng số hơn 30 bút danh, trên hơn 30 tờ báo, tạp chí, suốt 30 năm cầm bút viết văn làm báo, Ngô Tất Tố đã để lại hơn 1500 tác phẩm các thể loại, trong đó có 1350 di tác... Ông được truy tặng Giải thưởng Hồ Chí Minh về NXB Văn Học nghệ thuật Đợt I (1996). Trên cả nước có 8 thành phố lớn có phố và đường phố mang tên Ngô Tất Tố.'),
('BD1001','B1001','C_VH','20.5 x 14.5 x 3.2 cm',739,N'Nam Cao có nhiều đóng góp quan trọng đối với việc hoàn thiện phong cách truyện ngắn và tiểu thuyết Việt Nam nửa đầu thế kỷ XX . Với 15 năm cầm bút, Nam Cao đã để lại một văn nghiệp đồ sộ với 2 tiểu thuyết, 50 truyện ngắn, bút ký, ... trong đó có những nhân vật như Lão Hạc, giáo Thứ, Bá Kiến, Thị Nở, Chí Phèo,...không thể phai mờ trông tâm trí người đọc nhiều thế hệ . ')

INSERT INTO  ORDERS
VALUES ('O100000','C10000',01-01-2023,00,N'Mỹ thành bắc,Cai Lậy,Tiền Giang',N'Nhân xác vào giờ trưa'),
		('O100001','C10001',01-01-2023,00,N'Mỹ Tho',N'Nhân xác vào giờ trưa')

INSERT INTO ORDERDETAILS
VALUES ('OD1000','O100001','B1000',200000,1),
	  ('OD1001','O100000','B1001',190000,1)

INSERT INTO BILLS
VALUES ('BL10000','O100001','U10000','VKANN',2023-01-01,200000),
       ('BL10001','O100000','U10000','VKANN',2023-05-01,180000)



-----Stored Procedure


-----Trigger