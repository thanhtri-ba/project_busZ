# Coding Standards

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-001

Priority

Critical

Version

1.0

---

# 1. Purpose

Coding Standards định nghĩa các quy tắc lập trình thống nhất cho toàn bộ dự án BusZ nhằm đảm bảo mã nguồn dễ đọc, dễ bảo trì, dễ mở rộng và nhất quán giữa các thành viên.

Mục tiêu

- Chuẩn hóa Source Code
- Tăng khả năng bảo trì
- Giảm Technical Debt
- Hỗ trợ Code Review
- Hỗ trợ AI Code Generation

---

# 2. Scope

Áp dụng cho

```text
Flutter

React

Node.js

TypeScript

Prisma

SQL
```

---

# 3. General Principles

```text
Readable

Simple

Reusable

Maintainable

Testable
```

---

# 4. Naming Convention

Class

```text
PascalCase
```

Ví dụ

```text
BookingService

PaymentController

TicketRepository
```

---

# 5. Variable Naming

```text
camelCase
```

Ví dụ

```text
bookingId

paymentStatus

departureTime
```

---

# 6. Constant Naming

```text
UPPER_SNAKE_CASE
```

Ví dụ

```text
MAX_PASSENGERS

JWT_EXPIRE_TIME

DEFAULT_PAGE_SIZE
```

---

# 7. File Naming

```text
snake_case
```

Ví dụ

```text
booking_service.ts

payment_controller.ts

trip_repository.ts
```

---

# 8. Folder Structure

```text
controllers

services

repositories

middlewares

routes

validators

utils

config
```

---

# 9. Function Rules

```text
Single Responsibility

Maximum 50 Lines

Clear Name

Return Early
```

---

# 10. Class Rules

```text
One Responsibility

Constructor Injection

No Business Logic in Controller
```

---

# 11. Controller Rules

```text
Receive Request

Validate Input

Call Service

Return Response
```

Không xử lý

```text
Business Logic

Database Query
```

---

# 12. Service Rules

```text
Business Logic

Validation

Transaction

Workflow
```

---

# 13. Repository Rules

```text
Database Access Only

No Business Logic
```

---

# 14. Error Handling

```text
Throw Business Exception

Global Exception Handler

Meaningful Messages
```

---

# 15. Logging Rules

```text
Info

Warning

Error

Audit
```

Không log

```text
Password

Token

OTP

Credit Card
```

---

# 16. Comments

Chỉ comment khi

```text
Business Rule

Complex Algorithm

Temporary Workaround
```

---

# 17. Code Formatting

```text
Indent = 2 Spaces

UTF-8

LF

Trailing Spaces Removed
```

---

# 18. Security Rules

```text
Parameterized Query

Input Validation

HTTPS Only

JWT

RBAC
```

---

# 19. Acceptance Criteria

✓ Naming thống nhất

✓ Controller mỏng

✓ Service xử lý nghiệp vụ

✓ Repository chỉ truy cập DB

✓ Code dễ đọc

✓ Security đúng chuẩn

---

# 20. Related Documents

Backend Architecture

Frontend Architecture

Git Workflow

Code Review

Definition of Done

---

# 21. Summary

Coding Standards là bộ quy tắc lập trình thống nhất của BusZ, giúp toàn bộ mã nguồn được phát triển theo cùng một tiêu chuẩn, nâng cao chất lượng phần mềm, giảm lỗi và hỗ trợ AI sinh mã nguồn chính xác.