# Backend Architecture

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-003

Priority

Critical

Version

1.0

---

# 1. Purpose

Backend Architecture định nghĩa kiến trúc Backend chuẩn của BusZ nhằm đảm bảo khả năng mở rộng, dễ bảo trì và dễ kiểm thử.

Mục tiêu

- Chuẩn hóa Backend
- Hỗ trợ Clean Architecture
- Tăng khả năng mở rộng
- Giảm Coupling
- Hỗ trợ AI Code Generation

---

# 2. Technology Stack

Framework

```text
Node.js

NestJS / Express

TypeScript
```

ORM

```text
Prisma ORM
```

Database

```text
PostgreSQL
```

Cache

```text
Redis
```

Queue

```text
BullMQ
```

---

# 3. Architecture Style

```text
Presentation Layer

↓

Application Layer

↓

Domain Layer

↓

Infrastructure Layer

↓

Database
```

---

# 4. Backend Structure

```text
src/

controllers/

services/

repositories/

middlewares/

validators/

dto/

entities/

events/

jobs/

config/

utils/

shared/
```

---

# 5. Layer Responsibilities

Presentation

```text
HTTP Request

Validation

Authentication

Authorization

Response
```

Application

```text
Business Logic

Workflow

Transaction

Use Cases
```

Domain

```text
Entities

Business Rules

Enums

Interfaces
```

Infrastructure

```text
Database

Redis

Storage

Email

SMS

Payment Gateway
```

---

# 6. Request Flow

```text
Client

↓

Controller

↓

Validation

↓

Service

↓

Repository

↓

Database

↓

Response
```

---

# 7. Controllers

Bao gồm

```text
AuthController

UserController

TripController

SeatController

BookingController

PaymentController

TicketController

NotificationController

ReviewController

AdminController
```

---

# 8. Services

```text
AuthService

BookingService

TripService

SeatService

PaymentService

TicketService

NotificationService

ReviewService

ReportService
```

---

# 9. Repository Layer

```text
UserRepository

BookingRepository

TripRepository

SeatRepository

PaymentRepository

TicketRepository

NotificationRepository
```

---

# 10. DTO Layer

```text
LoginRequest

RegisterRequest

BookingRequest

PaymentRequest

RefundRequest

ReviewRequest
```

---

# 11. Entity Layer

```text
User

Company

Driver

Vehicle

Route

Trip

Seat

Booking

Passenger

Payment

Ticket

Promotion

Review

Notification
```

---

# 12. Middleware

```text
JWT Authentication

RBAC

Rate Limiter

Request Logger

Error Handler

Request ID
```

---

# 13. Validation

```text
class-validator

Zod

Custom Validator
```

Kiểm tra

```text
Email

Phone

Booking

Payment

Ticket

Promotion
```

---

# 14. Business Rules

```text
Service Layer Only

Repository không chứa Business Logic

Controller không truy cập Database

Transaction trong Service
```

---

# 15. Database Access

```text
Controller

↓

Service

↓

Repository

↓

Prisma

↓

PostgreSQL
```

---

# 16. External Integrations

```text
VNPay

MoMo

ZaloPay

Firebase

SMTP

SMS Gateway

Google Maps
```

---

# 17. Event Processing

```text
Payment Success

↓

Generate Ticket

↓

Send Notification

↓

Update Analytics

↓

Audit Log
```

---

# 18. Background Jobs

```text
Booking Expiration

Seat Release

Notification Queue

Daily Report

Database Backup
```

---

# 19. Error Handling

```text
Business Exception

Validation Exception

Authentication Exception

Infrastructure Exception

Unexpected Exception
```

---

# 20. Logging

```text
Access Log

Application Log

Audit Log

Payment Log

Security Log
```

---

# 21. Security

```text
HTTPS

JWT

RBAC

Password Hash

Rate Limiting

Input Validation

Webhook Signature
```

---

# 22. Performance

```text
Redis Cache

Pagination

Database Index

Connection Pool

Async Processing
```

---

# 23. Scalability

```text
Horizontal Scaling

Stateless API

Queue Processing

Read Replica

Microservices Ready
```

---

# 24. Development Principles

```text
SOLID

DRY

KISS

YAGNI

Repository Pattern

Dependency Injection
```

---

# 25. Acceptance Criteria

✓ Layer tách biệt

✓ Controller mỏng

✓ Business Logic nằm trong Service

✓ Repository chỉ truy cập Database

✓ Có Background Jobs

✓ Hỗ trợ Scale ngang

✓ AI dễ sinh Backend

---

# 26. Related Documents

Coding Standards

Project Structure

API Development

Database Guidelines

Authentication Development

Deployment Architecture

---

# 27. Summary

Backend Architecture định nghĩa kiến trúc chuẩn cho Backend BusZ theo mô hình phân tầng kết hợp Clean Architecture. Mỗi thành phần có trách nhiệm rõ ràng, giúp hệ thống dễ mở rộng, dễ kiểm thử và hỗ trợ AI sinh mã nguồn chất lượng cao theo cùng một kiến trúc thống nhất.