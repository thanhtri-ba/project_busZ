# ADR-004 JWT Authentication Strategy

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Architecture Decision Record

Document ID

ADR-004

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

BusZ yêu cầu cơ chế xác thực hiện đại hỗ trợ:

- Mobile
- Web
- Admin
- REST API
- Multiple Devices
- Cloud Deployment

Hệ thống cần:

- Stateless
- High Performance
- Secure
- Easy Scaling

---

# 2. Problem Statement

Lựa chọn cơ chế Authentication cho toàn hệ thống.

---

# 3. Considered Options

Option 1

JWT + Refresh Token

---

Option 2

Session Authentication

---

Option 3

OAuth Only

---

Option 4

API Key

---

# 4. Evaluation

| Method | Stateless | Mobile | Scalability | Security |
|----------|:---------:|:------:|:-----------:|:--------:|
| JWT | ✅ | ✅ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Session | ❌ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| OAuth Only | ⚠️ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| API Key | ❌ | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ |

---

# 5. Decision

BusZ sử dụng

JWT Access Token

+

Refresh Token Rotation

---

# 6. Rationale

Lý do

- Stateless
- High Performance
- Mobile Friendly
- Easy Scaling
- Cloud Native
- Supports Microservices

---

# 7. Consequences

Ưu điểm

- Không lưu Session
- Dễ Scale
- Phù hợp Mobile

Nhược điểm

- Cần quản lý Refresh Token
- Cần Token Rotation

---

# 8. Related ADR

ADR-002 NestJS

ADR-006 Redis

ADR-013 Security

---

# 9. Review

Đánh giá lại khi:

- Authentication Architecture thay đổi
- Có yêu cầu Zero Trust