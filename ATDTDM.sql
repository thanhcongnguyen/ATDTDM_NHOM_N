-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-12-05 12:48:01.44

-- tables
-- Table: ChiTietHoaDon
CREATE TABLE ChiTietHoaDon (
    MaSP char(10) NOT NULL,
    MaHD char(10) NOT NULL,
    SoLuongMua int NOT NULL,
    DonGiaBan double(10,2) NOT NULL,
    HoaDon_MaHD char(10) NOT NULL,
    SanPham_MaSP char(10) NOT NULL,
    CONSTRAINT ChiTietHoaDon_pk PRIMARY KEY (MaSP,MaHD)
);

-- Table: HoaDon
CREATE TABLE HoaDon (
    MaHD char(10) NOT NULL,
    NgayLap timestamp NOT NULL,
    MaKH char(10) NOT NULL,
    KhachHang_MaKH char(10) NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY (MaHD)
);

-- Table: KhachHang
CREATE TABLE KhachHang (
    MaKH char(10) NOT NULL,
    TenKH varchar(200) NOT NULL,
    DiaChi text NOT NULL,
    SoDT char(10) NOT NULL,
    CONSTRAINT KhachHang_pk PRIMARY KEY (MaKH)
);

-- Table: LoaiSanPham
CREATE TABLE LoaiSanPham (
    MaLSP char(10) NOT NULL,
    TenLSP varchar(200) NOT NULL,
    CONSTRAINT LoaiSanPham_pk PRIMARY KEY (MaLSP)
);

-- Table: SanPham
CREATE TABLE SanPham (
    MaSP char(10) NOT NULL,
    TenSP varchar(250) NOT NULL,
    SoLuong int NOT NULL,
    Mota text NOT NULL,
    MaLSP char(10) NOT NULL,
    LoaiSanPham_MaLSP char(10) NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY (MaSP)
);

-- foreign keys
-- Reference: ChiTietHoaDon_HoaDon (table: ChiTietHoaDon)
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_HoaDon FOREIGN KEY ChiTietHoaDon_HoaDon (HoaDon_MaHD)
    REFERENCES HoaDon (MaHD);

-- Reference: ChiTietHoaDon_SanPham (table: ChiTietHoaDon)
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_SanPham FOREIGN KEY ChiTietHoaDon_SanPham (SanPham_MaSP)
    REFERENCES SanPham (MaSP);

-- Reference: HoaDon_KhachHang (table: HoaDon)
ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_KhachHang FOREIGN KEY HoaDon_KhachHang (KhachHang_MaKH)
    REFERENCES KhachHang (MaKH);

-- Reference: SanPham_LoaiSanPham (table: SanPham)
ALTER TABLE SanPham ADD CONSTRAINT SanPham_LoaiSanPham FOREIGN KEY SanPham_LoaiSanPham (LoaiSanPham_MaLSP)
    REFERENCES LoaiSanPham (MaLSP);

-- End of file.


-- Them du lieu cho KhachHang
INSERT INTO KhachHang VALUES('kh01', 'Nguyen Van Anh', 'Quang Nam', '0981362365');
INSERT INTO KhachHang VALUES('kh02', 'Nguyen Van Ba', 'Ha Noi', '0981362366');
INSERT INTO KhachHang VALUES('kh03', 'Nguyen Tu', 'TP.HCM', '0981362367');
INSERT INTO KhachHang VALUES('kh04', 'Nguyen Nam', 'Gia Lai', '0981362368');
INSERT INTO KhachHang VALUES('kh05', 'Nguyen Hai Anh', 'Da Lat', '0981362369');

-- Them du lieu LoaiSanPham
INSERT INTO LoaiSanPham VALUES('loai_01', 'Loai san pham 01');
INSERT INTO LoaiSanPham VALUES('loai_02', 'Loai san pham 02');
INSERT INTO LoaiSanPham VALUES('loai_03', 'Loai san pham 03');
INSERT INTO LoaiSanPham VALUES('loai_04', 'Loai san pham 04');
INSERT INTO LoaiSanPham VALUES('loai_05', 'Loai san pham 05');

-- Them du lieu SanPham

INSERT INTO SanPham VALUES('SP_01', 'but bi', 10, 'but bi thang long', 'loai_01', 'loai_01');
INSERT INTO SanPham VALUES('SP_02', 'bong ban', 10, 'bong ban', 'loai_02', 'loai_02');
INSERT INTO SanPham VALUES('SP_03', 'xe dap', 10, 'xe dap dia hinh', 'loai_03', 'loai_03');
INSERT INTO SanPham VALUES('SP_04', 'noi com dien', 10, 'noi com dien nhat ban', 'loai_04', 'loai_04');
INSERT INTO SanPham VALUES('SP_05', 'ba lo', 10, 'ba lo dung lap top', 'loai_05', 'loai_05');


-- Them du lieu HoaDon
INSERT INTO HoaDon VALUES('hoadon_01', '2020-12-04 13:24:32', 'kh01', 'kh01');
INSERT INTO HoaDon VALUES('hoadon_02', '2020-12-05 13:24:32', 'kh02', 'kh02');
INSERT INTO HoaDon VALUES('hoadon_03', '2020-12-06 13:24:32', 'kh03', 'kh03');
INSERT INTO HoaDon VALUES('hoadon_04', '2020-12-07 13:24:32', 'kh04', 'kh04');
INSERT INTO HoaDon VALUES('hoadon_05', '2020-12-08 13:24:32', 'kh05', 'kh05');

-- Them due lieu ChiTietDonHang
INSERT INTO ChiTietDonHang VALUES('SP_01', 'hoadon_01', 1, 200, 'hoadon_01', 'SP_01');
INSERT INTO ChiTietDonHang VALUES('SP_02', 'hoadon_02', 1, 150, 'hoadon_02', 'SP_02');
INSERT INTO ChiTietDonHang VALUES('SP_03', 'hoadon_03', 1, 280, 'hoadon_03', 'SP_03');
INSERT INTO ChiTietDonHang VALUES('SP_04', 'hoadon_04', 1, 249, 'hoadon_04', 'SP_04');
INSERT INTO ChiTietDonHang VALUES('SP_05', 'hoadon_05', 1, 500, 'hoadon_05', 'SP_05');



