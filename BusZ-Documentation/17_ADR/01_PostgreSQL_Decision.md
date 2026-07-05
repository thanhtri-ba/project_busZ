# ADR-001 PostgreSQL Database Decision

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Architecture Decision Record

Status

Accepted

Decision Date

2026-07-05

Version

1.0

---

# 1. Context

BusZ cần một hệ quản trị cơ sở dữ liệu đáp ứng các yêu cầu:

- Hỗ trợ giao dịch (ACID)
- Quan hệ dữ liệu phức tạp
- Hiệu năng cao
- Hỗ trợ dữ liệu không gian (GIS)
- Có khả năng mở rộng
- Miễn phí và mã nguồn mở

Hệ thống quản lý:

- Người dùng
- Nhà xe
- Chuyến xe
- Tuyến đường
- Ghế
- Đặt vé
- Thanh toán
- AI Analytics

---

# 2. Problem Statement

Cần lựa chọn hệ quản trị cơ sở dữ liệu chính cho BusZ.

---

# 3. Considered Options

### Option 1

PostgreSQL

---

### Option 2

MySQL

---

### Option 3

MongoDB

---

### Option 4

SQL Server

---

### Option 5

Oracle Database

---

# 4. Evaluation

| Database | ACID | GIS | JSON | Performance | License |
|----------|:----:|:---:|:----:|:-----------:|:-------:|
| PostgreSQL | ✅ | ✅ | ✅ | ⭐⭐⭐⭐⭐ | Open Source |
| MySQL | ✅ | ⚠️ | ⚠️ | ⭐⭐⭐⭐ | Open Source |
| MongoDB | ❌ | ⚠️ | ✅ | ⭐⭐⭐⭐ | SSPL |
| SQL Server | ✅ | ⚠️ | ⚠️ | ⭐⭐⭐⭐⭐ | Commercial |
| Oracle | ✅ | ✅ | ⚠️ | ⭐⭐⭐⭐⭐ | Commercial |

---

# 5. Decision

BusZ sẽ sử dụng **PostgreSQL** làm cơ sở dữ liệu chính.

---

# 6. Rationale

Lý do lựa chọn:

- ACID Compliance
- Hỗ trợ PostGIS
- JSONB
- Hiệu năng cao
- Dễ mở rộng
- Prisma hỗ trợ tốt
- Docker hỗ trợ tốt
- Cloud Native
- Open Source

---

# 7. Consequences

Ưu điểm

- Quan hệ dữ liệu mạnh
- Hỗ trợ AI Analytics
- Spatial Database
- Full-text Search
- Window Functions

Nhược điểm

- Cấu hình phức tạp hơn SQLite
- Cần DBA khi mở rộng quy mô lớn

---

# 8. Related Decisions

- ADR-006 Redis Decision
- ADR-008 Prisma Decision
- ADR-005 OpenStreetMap Decision

---

# 9. Status

Accepted

---

# 10. Review

Decision này sẽ được xem xét lại nếu:

- Quy mô dữ liệu thay đổi đáng kể
- Kiến trúc chuyển sang phân tán hoàn toàn
- Xuất hiện yêu cầu kỹ thuật mới