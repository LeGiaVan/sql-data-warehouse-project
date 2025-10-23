/*
=============================================================
TẠO DATABASE VÀ SCHEMA CHO PROJECT
=============================================================
Mục đích của Scripts:
    Script này tạo một Database mới tên là 'DataWarehouse' sau khi kiểm tra nó có tồn tại hay không.
    Nếu đã tồn tài thì xóa đi và tạo mới. Script còn thiết lập 3 schema trong database: bronze, silver và gold
	
LƯU Ý:
    Khi chạy scipts này, nếu đã tồn tại database tên 'DataWarehouse' thí nó sẽ mất hết dữ liệu.
    Tất cả data sẽ mất vĩnh viễn nếu chạy scripts này, hãy backup trước 
*/

USE master;
GO

-- Xóa và tạo mới 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Tạo 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Tạo Schema
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
