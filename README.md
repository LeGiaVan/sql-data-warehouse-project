
# 📊 Dự án Data Warehouse và Phân Tích Dữ Liệu

Chào mừng đến với **Dự án Data Warehouse và Analytics**! 🚀
Dự án này trình bày một giải pháp toàn diện về **xây dựng kho dữ liệu và phân tích dữ liệu**, bao gồm từ việc thiết kế mô hình đến việc tạo ra các báo cáo phân tích mang tính chiến lược.
Đây là một dự án mang tính học tập và thực hành, được xây dựng theo các **chuẩn mực trong ngành Data Engineering và Data Analytics**.

---

## 🏗️ Kiến trúc Dữ liệu (Data Architecture)

Dự án áp dụng mô hình **Medallion Architecture** với 3 lớp dữ liệu: **Bronze**, **Silver**, và **Gold**.
![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer**: Lưu trữ dữ liệu gốc (raw data) từ các hệ thống nguồn. Dữ liệu được nạp từ các tệp CSV vào cơ sở dữ liệu SQL Server.
2. **Silver Layer**: Bao gồm các bước làm sạch, chuẩn hóa và chuyển đổi dữ liệu để chuẩn bị cho việc phân tích.
3. **Gold Layer**: Chứa dữ liệu đã sẵn sàng cho nghiệp vụ, được mô hình hóa theo **Star Schema** phục vụ cho báo cáo và phân tích.

---

## 📖 Tổng quan Dự án

Dự án bao gồm các phần chính sau:

1. **Data Architecture**: Thiết kế kho dữ liệu hiện đại dựa trên kiến trúc Medallion (Bronze – Silver – Gold).
2. **ETL Pipelines**: Thực hiện trích xuất, chuyển đổi và nạp dữ liệu (Extract – Transform – Load).
3. **Data Modeling**: Phát triển các bảng **fact** và **dimension** được tối ưu cho truy vấn phân tích.
4. **Analytics & Reporting**: Tạo các báo cáo và dashboard dựa trên SQL để đưa ra các **insight** có giá trị.

🎯 Dự án giúp người học và người làm trong lĩnh vực dữ liệu phát triển kỹ năng:

* SQL Development
* Data Architecture
* Data Engineering
* ETL Pipeline
* Data Modeling
* Data Analytics

---

## 🛠️ Công cụ & Tài nguyên

Tất cả các tài nguyên trong dự án đều **miễn phí**:

* **[Datasets](datasets/):** Bộ dữ liệu thô sử dụng trong dự án (tệp CSV từ hệ thống ERP và CRM).
* **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Phiên bản miễn phí của SQL Server để lưu trữ dữ liệu.
* **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms):** Giao diện quản lý và làm việc với SQL Server.
* **[GitHub](https://github.com/):** Nền tảng lưu trữ và quản lý mã nguồn.
* **[DrawIO](https://www.drawio.com/):** Công cụ vẽ sơ đồ dữ liệu và kiến trúc hệ thống.
* **[Notion](https://www.notion.com/):** Công cụ quản lý và theo dõi tiến độ dự án.
* **[Notion Project Steps](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4):** Ghi chú toàn bộ quy trình và giai đoạn của dự án.

---

## 🚀 Yêu cầu Dự án

### 1. Xây dựng Kho Dữ liệu (Data Engineering)

**Mục tiêu:**
Phát triển một **Data Warehouse hiện đại** bằng SQL Server để hợp nhất dữ liệu bán hàng, phục vụ cho báo cáo phân tích và ra quyết định kinh doanh.

**Yêu cầu chi tiết:**

* **Nguồn dữ liệu:** Hai hệ thống nguồn (ERP và CRM) ở dạng CSV.
* **Chất lượng dữ liệu:** Làm sạch và xử lý lỗi dữ liệu trước khi phân tích.
* **Tích hợp:** Hợp nhất dữ liệu từ hai nguồn thành một mô hình duy nhất, dễ truy vấn.
* **Phạm vi:** Tập trung vào **dữ liệu hiện tại**, không yêu cầu lưu trữ lịch sử.
* **Tài liệu hóa:** Cung cấp **tài liệu mô hình dữ liệu** rõ ràng cho cả nhóm nghiệp vụ và phân tích.

---

### 2. Phân tích & Báo cáo (Data Analysis)

**Mục tiêu:**
Phát triển các báo cáo SQL cung cấp **insight** chi tiết về:

* Hành vi khách hàng (Customer Behavior)
* Hiệu suất sản phẩm (Product Performance)
* Xu hướng doanh số (Sales Trends)

Những phân tích này hỗ trợ **ra quyết định chiến lược** cho doanh nghiệp.
Chi tiết xem thêm tại [docs/requirements.md](docs/requirements.md).

---

## 📂 Cấu trúc Thư mục Dự án

```
data-warehouse-project/
│
├── datasets/                           # Dữ liệu gốc (ERP và CRM)
│
├── docs/                               # Tài liệu, sơ đồ và kiến trúc
│   ├── etl.drawio                      # Sơ đồ quy trình ETL
│   ├── data_architecture.drawio        # Kiến trúc tổng thể của dự án
│   ├── data_catalog.md                 # Danh mục dữ liệu và mô tả trường
│   ├── data_flow.drawio                # Sơ đồ luồng dữ liệu
│   ├── data_models.drawio              # Mô hình dữ liệu (Star Schema)
│   ├── naming-conventions.md           # Quy tắc đặt tên bảng, cột và tệp
│
├── scripts/                            # Mã SQL cho ETL và xử lý dữ liệu
│   ├── bronze/                         # Extract & Load dữ liệu thô
│   ├── silver/                         # Làm sạch & chuẩn hóa dữ liệu
│   ├── gold/                           # Mô hình dữ liệu phục vụ phân tích
│
├── tests/                              # Script kiểm thử và kiểm tra chất lượng
│
├── README.md                           # Tệp mô tả dự án
├── LICENSE                             # Giấy phép sử dụng
├── .gitignore                          # Cấu hình bỏ qua tệp cho Git
└── requirements.txt                    # Danh sách thư viện hoặc công cụ cần thiết
```

---

## 🛡️ Giấy phép

Dự án được phân phối theo **[Giấy phép MIT](LICENSE)**.
Bạn có thể tự do sử dụng, chỉnh sửa và chia sẻ dự án này — miễn là ghi rõ nguồn gốc.
