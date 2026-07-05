# ADR-002 NestJS Framework Decision

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Architecture Decision Record

Document ID

ADR-002

Status

Accepted

Decision Date

2026-07-05

Decision Owner

Architecture Team

Version

1.0

---

# 1. Context

BusZ yêu cầu một Backend Framework có khả năng:

- Enterprise Architecture
- Dependency Injection
- High Performance
- Modular Design
- REST API
- WebSocket
- Authentication
- Microservices Ready
- AI Integration
- Cloud Native

---

# 2. Problem Statement

Lựa chọn Backend Framework phù hợp cho hệ thống BusZ.

---

# 3. Considered Options

Option 1

NestJS

---

Option 2

ExpressJS

---

Option 3

Fastify

---

Option 4

Spring Boot

---

Option 5

ASP.NET Core

---

# 4. Evaluation

| Framework | Enterprise | DI | Performance | Learning | Community |
|------------|:----------:|:--:|:-----------:|:--------:|:---------:|
| NestJS | ✅ | ✅ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Express | ⚠️ | ❌ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Fastify | ⚠️ | ❌ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Spring Boot | ✅ | ✅ | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| ASP.NET | ✅ | ✅ | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |

---

# 5. Decision

BusZ sẽ sử dụng NestJS.

---

# 6. Rationale

Lý do

- Modular
- TypeScript Native
- Dependency Injection
- Swagger
- Guards
- Interceptors
- Pipes
- Prisma Integration
- JWT Support
- Enterprise Ready

---

# 7. Consequences

Ưu điểm

- Clean Architecture
- Scalable
- Testable
- Maintainable

Nhược điểm

- Learning Curve cao hơn Express
- Boilerplate nhiều hơn

---

# 8. Related ADR

ADR-001 PostgreSQL

ADR-004 JWT

ADR-006 Redis

ADR-007 Docker

ADR-008 Prisma

---

# 9. Review Criteria

Decision sẽ được xem xét lại nếu:

- Hiệu năng không đáp ứng
- Framework ngừng phát triển
- Có yêu cầu đặc biệt từ hệ thống