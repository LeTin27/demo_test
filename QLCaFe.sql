create database QLCafe
use QLCafe


--table
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY IDENTITY(1,1),
    TenNhanVien NVARCHAR(255),
	user_name varchar(50),
	pass varchar(50),
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(20),
    Email NVARCHAR(255),
	Luong INT,
);
CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    TenKhachHang NVARCHAR(255),
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(20)
);

CREATE TABLE TheLoai (
    MaTheLoai INT PRIMARY KEY,
    TenTheLoai NVARCHAR(255)
);

CREATE TABLE Topping(
	MaTopping INT PRIMARY KEY,
	Ten NVARCHAR(255),
	Gia INT
);

CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY IDENTITY(1,1),
    TenSanPham NVARCHAR(255),
    GiaTien DECIMAL(10, 2),
	MaTheLoai int,
	FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai)
);

CREATE TABLE DonHang (
    MaDonHang INT PRIMARY KEY IDENTITY(1,1),
    MaKhachHang INT,
    NgayDatHang DATE,
	MaNhanVien int,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE ChiTietDonHang (
    MaChiTietDonHang INT PRIMARY KEY IDENTITY(1,1),
    MaDonHang INT,
    MaSanPham INT,
    SoLuong INT,
	MaTopping INT,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
	FOREIGN KEY (MaTopping) REFERENCES Topping(MaTopping),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);



create table tbl_permision
(
	id_per int primary key IDENTITY(1,1),
	name_per nvarchar(50),
	description nvarchar(50),

)
create table tbl_per_relationship
(
	id_rel int primary key IDENTITY(1,1),
	id_user_rel int,
	id_per_rel int,
	suspended bit,
	FOREIGN KEY (id_user_rel) REFERENCES NhanVien(MaNhanVien),
	FOREIGN KEY (id_per_rel) REFERENCES tbl_permision(id_per),
)
create table tbl_permision_del
(
	id_pd int primary key IDENTITY(1,1),
	code_action nvarchar(50),
	id_per int,
	FOREIGN KEY (id_per) REFERENCES tbl_permision(id_per),
)
alter table SanPham
add HinhAnh image

---INSERT
INSERT INTO KhachHang  values ( 23001,N'Nguyễn Đức Long', N'Tp. Thủ Đức, TPHCM','0902748274')
INSERT INTO KhachHang   values (23002,N'Hoàng Thiện Tâm', N'q. Phú Nhuận, TPHCM','0902571923')
INSERT INTO KhachHang values (23003,N'Đoàn Duy Tùng', N'q. Gò Vấp, TPHCM','0902853404')
INSERT INTO KhachHang   values (23004,N'Lê Phương Trinh', N'Tp.Thủ Đức, TPHCM','0902059780')
INSERT INTO KhachHang  values (23005,N'Phạm Quốc Thanh', N'quận 7, TPHCM','0902491058')


INSERT INTO TheLoai (MaTheLoai,TenTheLoai) VALUES (1,N'Trà Sữa');
INSERT INTO TheLoai (MaTheLoai,TenTheLoai) VALUES (2,N'Hồng Trà');
INSERT INTO TheLoai (MaTheLoai,TenTheLoai) VALUES (3,N'Cà Phê');
INSERT INTO TheLoai (MaTheLoai,TenTheLoai) VALUES (4,N'Nước Đóng Chai');
INSERT INTO TheLoai (MaTheLoai,TenTheLoai) VALUES (5,N'Món Ăn');

INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Trà Sữa Matcha', 20000, 1);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Trà Sữa Thái Xanh', 18000.0, 1);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Trà Sữa Thái Đỏ', 18000, 1);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Trà Sữa Truyền Thống', 25000, 1);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Hồng Trà', 10000, 2);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Hồng Trà Chang', 10000, 2);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Hồng Trà Tắc', 12000, 2);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Cafe Đen', 15000, 3);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Cafe Sữa', 18000, 3);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Bạc Xĩu', 18000, 3);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Sting', 15000, 4);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Cocacola', 15000, 4);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Trà Olong', 12000, 4);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Pessi', 15000, 4);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Mì Gói', 10000, 5);
INSERT INTO SanPham (TenSanPham, GiaTien, MaTheLoai) VALUES (N'Pudding', 5000, 5);

INSERT INTO Topping (MaTopping,Ten,Gia) VALUES (1,N'Topping Khoai Môn',5000);
INSERT INTO Topping (MaTopping,Ten,Gia) VALUES (2,N'Topping Socola',5000);
INSERT INTO Topping (MaTopping,Ten,Gia) VALUES (3,N'Topping trân châu đen',5000);
INSERT INTO Topping (MaTopping,Ten,Gia) VALUES (4,N'Topping Thạch',5000);

INSERT INTO NhanVien (TenNhanVien,user_name,pass,DiaChi,SoDienThoai,Email,Luong)
VALUES (N'Nguyễn Văn A','user','123',N'Tây Ninh','01234567','nguyenvana@gmail.com',3000000);
INSERT INTO NhanVien (TenNhanVien,user_name,pass,DiaChi,SoDienThoai,Email,Luong)
VALUES (N'Nguyễn Văn B','admin','123',N'Hà Nội','01234568','nguyenvanB@gmail.com',3000000);

INSERT INTO tbl_permision(name_per,description) VALUES (N'Admin',N'Quyền Cao Nhất');
INSERT INTO tbl_permision(name_per,description) VALUES (N'Seller',N'Quyền Bán Hàng');
--Bảng mối quan hệ giữa nhân viên và nhóm quyền có bị chặn hay không
INSERT INTO tbl_per_relationship(id_user_rel,id_per_rel,suspended) VALUES (1,2,'False');
INSERT INTO tbl_per_relationship(id_user_rel,id_per_rel,suspended) VALUES (2,1,'False');
--Bảng chi tiết nhóm quyền sẽ được làm gì
INSERT INTO tbl_permision_del(code_action,id_per) VALUES('Thu Chi',2);
INSERT INTO tbl_permision_del(code_action,id_per) VALUES('Bao Cao',2);
INSERT INTO tbl_permision_del(code_action,id_per) VALUES('QL Khach Hang',2);
INSERT INTO tbl_permision_del(code_action,id_per) VALUES('ALL',1);