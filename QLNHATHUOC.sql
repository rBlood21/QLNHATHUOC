CREATE DATABASE QLNHATHUOC
GO
SET DATEFORMAT DMY
GO
USE QLNHATHUOC
GO
CREATE TABLE THUOC
(
	MaThuoc VARCHAR(20) PRIMARY KEY,
	TenThuoc NVARCHAR(100) NOT NULL,
	HoatChat NVARCHAR(200) NOT NULL,
	GiaNhap INT NOT NULL,
	GiaSauThue INT NOT NULL,
	GiaBan INT NOT NULL,
	ThoiHanSuDung INT NOT NULL
)
GO
CREATE TABLE DUOCSY
(
	MaDuocSy VARCHAR(10) PRIMARY KEY,
	TenDuocSy VARCHAR(30) NOT NULL,
	BangCap VARCHAR(20) NOT NULL,
	NgayVaoLam DATE NOT NULL,
	Luong INT NOT NULL
)
GO
CREATE TABLE KHACHHANG
(
	MaKH VARCHAR(10) PRIMARY KEY,
	TenKH NVARCHAR(40),
	DIACHIKH NVARCHAR(50),
)
GO
CREATE TABLE DONBAN
(
	MaDonBan VARCHAR(10) PRIMARY KEY,
	LoaiDon INT NOT NULL,
	-- 0: Đơn bán sỉ, 1: Đơn bán lẻ
	NgayBan DATE NOT NULL,
	MaKH VARCHAR(10) FOREIGN KEY REFERENCES KHACHHANG(MaKH),
	MaDuocSy VARCHAR(10) NOT NULL REFERENCES DUOCSY(MaDuocSy),
	TacDung NVARCHAR(200)
)
GO
CREATE TABLE CTDONTHUOC
(
	MaDonBan VARCHAR(10) NOT NULL REFERENCES DONBAN(MaDonBan),
	MaThuoc VARCHAR(20) NOT NULL REFERENCES THUOC(MaThuoc),
	SoLuong INT NOT NULL,
	NgayHetHan DATE NOT NULL,
	LoaiDonThuoc INT NOT NULL,
	CONSTRAINT PK_CTDONTHUOC PRIMARY KEY(MaDonBan, MaThuoc)
)
GO
CREATE TABLE CONGTY
(
	MaCongTy VARCHAR(20) PRIMARY KEY,
	TenCongTy NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE DONNHAP
(
	MaDonNhap VARCHAR(10) PRIMARY KEY,
	NgayNhap DATE NOT NULL,
	MaCongTy VARCHAR(20) NOT NULL REFERENCES CONGTY(MaCongTy),
	MaDuocSy VARCHAR(10) NOT NULL REFERENCES DUOCSY(MaDuocSy) 
)
GO
CREATE TABLE CTDN
(
	MaThuoc VARCHAR(20) NOT NULL REFERENCES THUOC(MaThuoc),
	MaDonNhap VARCHAR(10) NOT NULL REFERENCES DONNHAP(MaDonNhap),
	SoLuong INT NOT NULL,
	NgayHetHan DATE NOT NULL,
	CONSTRAINT PK_KHO PRIMARY KEY(MaThuoc, MaDonNhap)
)
GO
CREATE TABLE TAIKHOAN
(
	TaiKhoan VARCHAR(30) PRIMARY KEY,
	MatKhau NVARCHAR(100) NOT NULL,
	MaDuocSy VARCHAR(10) NOT NULL REFERENCES DUOCSY(MaDuocSy)
)
GO
CREATE TABLE QUYEN
(
	TaiKhoan VARCHAR(30) NOT NULL REFERENCES TAIKHOAN(TaiKhoan),
	BanThuoc INT NOT NULL,
	NhapThuoc INT NOT NULL,
	ThongKe INT NOT NULL,
	CONSTRAINT PK_QUYEN PRIMARY KEY(TaiKhoan, BanThuoc)
)

INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT001', 'Aspirin','Acid Acetylsalicylic',3000,3300,4500,3);
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT002', 'PROBIO', 'Vitamin B1,B2,B3', 3000, 3300, 4000, 1);
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT003', 'ACTAPULGITE', 'Attapulgite mormoiron 3g', 2000, 2200, 3500, 3);
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT004', 'PMS-DIVACAL', 'Calci D', 3000, 3300, 3500, 2);
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT005', 'AC MEXCOLD', 'PARACETAMOL 325mg, CHLORPHENIRAMIN 2mg', 300, 330, 400, 2);
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT006', 'PANADOL', 'Paracetamol 500mg, Cafein 65mg', 500, 550, 700, 2);
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT007', 'EUGICA', 'Eucalyptol 100mg, Menthol 0,5mg', 300, 330, 400, 2); 
INSERT INTO THUOC (MaThuoc, TenThuoc , HoatChat ,GiaNhap ,GiaSauThue ,GiaBan ,ThoiHanSuDung ) VALUES ('MT008', 'OTIV', 'Blueberry', 8000, 8800, 9500, 3);


INSERT INTO DUOCSY (MaDuocSy, TenDuocSy, BangCap, NgayVaoLam, Luong) VALUES ('MDS001', N'Nguyễn Duy Khánh', N'Đại học', '22/01/2018', 6000000);
INSERT INTO DUOCSY (MaDuocSy, TenDuocSy, BangCap, NgayVaoLam, Luong) VALUES ('MDS002', N'Huỳnh Văn Tô Nis', N'Đại học', '14/02/2018', 6000000);
INSERT INTO DUOCSY (MaDuocSy, TenDuocSy, BangCap, NgayVaoLam, Luong) VALUES ('MDS003', N'Võ Hoàng Duy', N'Cao đẳng', '25/06/2018', 4800000);
INSERT INTO DUOCSY (MaDuocSy, TenDuocSy, BangCap, NgayVaoLam, Luong) VALUES ('MDS004', N'Võ Hoàng Kha', N'Trung cấp', '22/08/2018', 4000000);

INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('114', N'Nhựt Phi', N'29, đường số 27, Sơn Kỳ, Tân Phú, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('244', N'Quang Vũ', N'29, đường số 27, Sơn Kỳ, Tân Phú, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('153', N'Bảo Chấn', N'35, đường Sơn Kỳ, Sơn Kỳ, Tân Phú, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('325', N'Minh Quân', N'2, đường CMT8, Gò Vấp, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('024', N'Trung Tín', N' đường Hậu Gian, Quận 6, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('441', N'Phúc Huy', N'112, đường Bà Hom, Bình Tân, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('257', N'Ngọc Tuyền', N'544, đường tỉnh lộ 10,Bình Tân, Hồ Chí Minh');
INSERT INTO KHACHHANG(MaKH, TenKH, DIACHIKH) VALUES ('996', N'Quang Phúc', N'86, đường Gò Dầu, Sơn Kỳ, Tân Phú, Hồ Chí Minh');

INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan ,MaKH, MaDuocSy, TacDung) VALUES ('MDB001', 1, '07/09/2018','114', 'MDS001', N'Hạ sốt');
INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan, MaKH, MaDuocSy, TacDung) vALUES ('MDB002', 1, '11/09/2018','024', 'MDS001', N'đau họng');
INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan, MaKH, MaDuocSy, TacDung) VALUES ('MDB003', 1, '08/09/2018','244', 'MDS001', N'Cảm');
INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan, MaKH, MaDuocSy, TacDung) VALUES ('MDB004', 0, '08/09/2018','153', 'MDS002', N'Vitamin');
INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan, MaKH, MaDuocSy, TacDung) VALUES ('MDB005', 1, '09/09/2018','441', 'MDS003', N'Bổ não');
INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan, MaKH, MaDuocSy, TacDung) VALUES ('MDB006', 1, '10/09/2018','257', 'MDS004', N'Ho, đau họng');
INSERT INTO DONBAN (MaDonBan, LoaiDon, NgayBan, MaKH, MaDuocSy, TacDung) VALUES ('MDB007', 0, '10/09/2018','996', 'MDS002', N'Panadol');


INSERT INTO CTDONTHUOC VALUES ('MDB001', 'MT005', 3, '07/09/2020', 1); 
INSERT INTO CTDONTHUOC VALUES ('MDB001', 'MT002', 2, '07/09/2019', 1);
INSERT INTO CTDONTHUOC VALUES ('MDB002', 'MT005', 3, '08/09/2020', 1);
INSERT INTO CTDONTHUOC VALUES ('MDB003', 'MT002', 200, '08/09/2019', 0);
INSERT INTO CTDONTHUOC VALUES ('MDB004', 'MT008', 10, '09/09/2021', 1);
INSERT INTO CTDONTHUOC VALUES ('MDB005', 'MT007', 3, '10/09/2020', 1);
INSERT INTO CTDONTHUOC VALUES ('MDB006', 'MT006', 300, '10/09/2020', 0);


INSERT INTO CONGTY (MaCongTy, TenCongTy, DiaChi) VALUES ('MCT001', N'Tuệ Linh', N'156/17 Tô Hiến Thành, Phường 15, Quận 10, Hồ Chí Minh');
INSERT INTO CONGTY (MaCongTy, TenCongTy, DiaChi) VALUES ('MCT002', N'CTY CP DP MEXPHARM', N'Đường số 2A, Bình Hưng Hoà B, Bình Tân, Hồ Chí Minh');
INSERT INTO CONGTY (MaCongTy, TenCongTy, DiaChi) VALUES ('MCT003', N'CTY TNHH MTV DP TW 2', N'334 Tô Hiến Thành, Phường 14, Quận 10');
INSERT INTO CONGTY (MaCongTy, TenCongTy, DiaChi) VALUES ('MCT004', N'CTY CP Sao Thái Dương', N'92 Phố Vĩnh Hưng, Phường Vĩnh Hưng, Hoàng Mai, Hà Nội');


INSERT INTO DONNHAP (MaDonNhap, NgayNhap, MaCongTy, MaDuocSy) VALUES ('MDN001', '08/08/2018', 'MCT002', 'MDS001');
INSERT INTO DONNHAP (MaDonNhap, NgayNhap, MaCongTy, MaDuocSy) VALUES ('MDN002', '08/08/2018', 'MCT003', 'MDS001');
INSERT INTO DONNHAP (MaDonNhap, NgayNhap, MaCongTy, MaDuocSy) VALUES ('MDN003', '09/08/2018', 'MCT001', 'MDS002');


INSERT INTO CTDN VALUES ('MT002', 'MDN001', 500, '08/08/2019');
INSERT INTO CTDN VALUES ('MT004', 'MDN001', 1000, '08/08/2020');
INSERT INTO CTDN VALUES ('MT001', 'MDN002', 2000, '08/08/2021');
INSERT INTO CTDN VALUES ('MT006', 'MDN002', 1500, '08/08/2020');
INSERT INTO CTDN VALUES ('MT007', 'MDN002', 1000, '08/08/2020');
INSERT INTO CTDN VALUES ('MT003', 'MDN003', 1200, '09/08/2020');
INSERT INTO CTDN VALUES ('MT005', 'MDN003', 1000, '09/08/2020');
INSERT INTO CTDN VALUES ('MT008', 'MDN003', 800, '09/08/2021');


INSERT INTO TAIKHOAN (TaiKhoan, MatKhau, MaDuocSy) VALUES ('duykhanh01', 'Khanh001', 'MDS001');
INSERT INTO TAIKHOAN (TaiKhoan, MatKhau, MaDuocSy) VALUES ('tonis', 'Nis002', 'MDS002');
INSERT INTO TAIKHOAN (TaiKhoan, MatKhau, MaDuocSy) VALUES ('duy03', 'Duy003', 'MDS003');
INSERT INTO TAIKHOAN (TaiKhoan, MatKhau, MaDuocSy) VALUES ('khavo', 'Kha004', 'MDS004');


select MaThuoc 'Mã Thuốc', TenThuoc 'Tên Thuốc', HoatChat 'Hoạt Chất',GiaNhap 'Giá Nhập',GiaSauThue 'Giá Sau Thuế',GiaBan 'Giá Bán',ThoiHanSuDung 'Thời Hạn Sử Dụng'  from THUOC

select * from CONGTY
select *from DONBAN




