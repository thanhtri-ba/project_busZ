# Database Guidelines

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-006

Priority

Critical

Version

1.0

---

# 1. Purpose

Database Guidelines định nghĩa các tiêu chuẩn thiết kế, phát triển và quản lý cơ sở dữ liệu của BusZ nhằm đảm bảo tính nhất quán, hiệu năng, bảo mật và khả năng mở rộng.

Mục tiêu

- Chuẩn hóa Database
- Chuẩn hóa Prisma Schema
- Chuẩn hóa SQL
- Tăng hiệu năng
- Hỗ trợ AI Code Generation

---

# 2. Database Technology

Database

```text
PostgreSQL 17+
```

ORM

```text
Prisma ORM
```

Migration

```text
Prisma Migrate
```

---

# 3. Database Principles

```text
Normalization

Consistency

Performance

Security

Scalability
```

---

# 4. Naming Convention

Table

```text
snake_case

users

bookings

payments

trip_routes
```

Column

```text
snake_case

user_id

booking_status

created_at
```

Primary Key

```text
id
```

Foreign Key

```text
user_id

booking_id

trip_id
```

Index

```text
idx_booking_status

idx_departure_time

idx_payment_status
```

---

# 5. Data Types

```text
UUID

VARCHAR

TEXT

BOOLEAN

INTEGER

BIGINT

DECIMAL

DATE

TIMESTAMP

JSONB
```

---

# 6. Primary Key

Quy định

```text
UUID

NOT NULL

PRIMARY KEY
```

Ví dụ

```sql
id UUID PRIMARY KEY
```

---

# 7. Foreign Key

Ví dụ

```text
booking.user_id

booking.trip_id

ticket.booking_id

payment.booking_id
```

---

# 8. Timestamp Columns

Tất cả bảng phải có

```text
created_at

updated_at
```

Khuyến nghị

```text
deleted_at

created_by

updated_by
```

---

# 9. Soft Delete

Không xóa dữ liệu trực tiếp

Sử dụng

```text
deleted_at

deleted_by

is_deleted
```

---

# 10. Status Columns

Không dùng Boolean

Ví dụ

```text
BookingStatus

PaymentStatus

TripStatus

SeatStatus

TicketStatus
```

---

# 11. Index Strategy

Bắt buộc Index

```text
Email

Phone

Booking Code

Ticket Code

Payment Transaction

Departure Time

Route

Company
```

---

# 12. Unique Constraints

```text
Email

Phone

Citizen ID

License Plate

Promotion Code

Ticket Code
```

---

# 13. Transactions

Sử dụng Transaction cho

```text
Booking

Payment

Refund

Seat Hold

Check-in
```

---

# 14. Audit Fields

```text
created_by

updated_by

deleted_by

ip_address

device_id
```

---

# 15. Audit Logs

Theo dõi

```text
INSERT

UPDATE

DELETE

LOGIN

LOGOUT
```

---

# 16. JSON Fields

Chỉ dùng khi cần

```text
metadata

device_info

payment_response

notification_payload
```

---

# 17. Constraints

```text
PRIMARY KEY

FOREIGN KEY

UNIQUE

CHECK

NOT NULL
```

---

# 18. Migration Rules

```text
Không sửa Migration cũ

Tạo Migration mới

Review trước khi Deploy

Rollback được
```

---

# 19. Prisma Guidelines

```text
One Model = One Table

Enum cho Status

Relation rõ ràng

Cascade hợp lý

Không Duplicate Field
```

---

# 20. Performance

```text
Pagination

Index

Connection Pool

Query Optimization

Batch Processing
```

---

# 21. Security

```text
Parameterized Query

Least Privilege

Encrypted Backup

TLS Connection

Row Level Security (Future)
```

---

# 22. Backup Policy

```text
Daily Backup

Weekly Full Backup

Monthly Archive

Point-in-Time Recovery
```

---

# 23. Monitoring

```text
Slow Query

Deadlock

Replication

CPU

Disk Usage

Connection Count
```

---

# 24. Development Rules

```text
Không SELECT *

Không Hard Delete

Không Query trong Loop

Luôn dùng Transaction khi cập nhật nhiều bảng

Review Index trước Release
```

---

# 25. Acceptance Criteria

✓ Chuẩn hóa Naming

✓ Chuẩn hóa Prisma

✓ Soft Delete

✓ Audit Fields

✓ Migration chuẩn

✓ Database tối ưu

✓ AI dễ sinh Prisma Schema

---

# 26. Related Documents

Backend Architecture

Database Schema

ER Diagram

Coding Standards

API Development

Deployment

---

# 27. Summary

Database Guidelines định nghĩa toàn bộ tiêu chuẩn phát triển cơ sở dữ liệu của BusZ từ thiết kế bảng, quy tắc đặt tên, khóa chính, khóa ngoại, Index, Transaction, Migration đến Audit và Backup. Tài liệu này là nền tảng để Backend Developer và AI sinh Prisma Schema, SQL Migration và Database Design một cách nhất quán, an toàn và tối ưu.