# API Development Standards

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-007

Priority

Critical

Version

1.0

---

# 1. Purpose

API Development Standards định nghĩa tiêu chuẩn phát triển RESTful API cho BusZ nhằm đảm bảo tính nhất quán, bảo mật, dễ bảo trì và dễ tích hợp.

Mục tiêu

- Chuẩn hóa REST API
- Chuẩn hóa Response
- Chuẩn hóa Error Handling
- Hỗ trợ OpenAPI
- Hỗ trợ AI Code Generation

---

# 2. API Principles

```text
RESTful

Stateless

Secure

Versioning

Consistent

Scalable
```

---

# 3. Base URL

Development

```text
http://localhost:3000/api/v1
```

Staging

```text
https://staging-api.busz.com/api/v1
```

Production

```text
https://api.busz.com/api/v1
```

---

# 4. HTTP Methods

```text
GET

POST

PUT

PATCH

DELETE
```

---

# 5. Resource Naming

Sử dụng

```text
/api/v1/users

/api/v1/bookings

/api/v1/trips

/api/v1/payments

/api/v1/tickets
```

Không sử dụng

```text
/getUsers

/createBooking

/deleteTrip
```

---

# 6. Endpoint Structure

```text
/api/v1/auth

/api/v1/users

/api/v1/routes

/api/v1/trips

/api/v1/bookings

/api/v1/payments

/api/v1/tickets

/api/v1/reviews

/api/v1/promotions
```

---

# 7. Request Format

Headers

```http
Authorization: Bearer <JWT>

Content-Type: application/json
```

Body

```json
{
  "tripId": "...",
  "seatIds": [],
  "pickupPointId": "...",
  "dropoffPointId": "..."
}
```

---

# 8. Response Format

Success

```json
{
  "success": true,
  "message": "Success",
  "data": {},
  "meta": {}
}
```

Failure

```json
{
  "success": false,
  "message": "Validation failed",
  "errors": []
}
```

---

# 9. HTTP Status Codes

```text
200 OK

201 Created

204 No Content

400 Bad Request

401 Unauthorized

403 Forbidden

404 Not Found

409 Conflict

422 Validation Error

429 Too Many Requests

500 Internal Server Error
```

---

# 10. Pagination

Request

```text
?page=1&limit=20
```

Response

```json
{
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "totalPages": 5
  }
}
```

---

# 11. Sorting

```text
?sort=departure_time

?sort=-departure_time
```

---

# 12. Filtering

```text
?status=CONFIRMED

?companyId=...

?departureDate=2026-07-04
```

---

# 13. Searching

```text
?q=Ho Chi Minh
```

---

# 14. Authentication

```text
JWT Access Token

Refresh Token

RBAC

Permission Validation
```

---

# 15. Authorization

```text
Passenger

Driver

Operator

Admin

Super Admin
```

---

# 16. Validation

Sử dụng

```text
Zod

class-validator

Custom Validator
```

Kiểm tra

```text
Required

Format

Length

Business Rules
```

---

# 17. Error Response

```json
{
  "success": false,
  "code": "BOOKING_NOT_FOUND",
  "message": "Booking not found",
  "errors": []
}
```

---

# 18. Idempotency

Áp dụng cho

```text
Payment

Refund

Booking Confirmation
```

Header

```text
Idempotency-Key
```

---

# 19. Rate Limiting

```text
Authentication

100 Requests / Minute

Search

300 Requests / Minute

Public API

60 Requests / Minute
```

---

# 20. File Upload

```text
Avatar

Vehicle Image

Company Logo

Review Image

PDF Ticket
```

Giới hạn

```text
10 MB

JPEG

PNG

PDF
```

---

# 21. API Versioning

```text
/api/v1

/api/v2
```

Không thay đổi

```text
Breaking Changes
```

---

# 22. Documentation

Bắt buộc

```text
Swagger

OpenAPI 3.1

Example Request

Example Response

Error Example
```

---

# 23. Logging

Ghi nhận

```text
Request

Response

Duration

User ID

IP Address

Request ID
```

---

# 24. Security

```text
HTTPS

JWT

CORS

Rate Limiting

SQL Injection Protection

XSS Protection

Input Validation
```

---

# 25. Performance

```text
Compression

Caching

Pagination

Lazy Loading

Connection Pool
```

---

# 26. Development Rules

```text
Không trả HTTP 200 khi có lỗi.

Không expose Stack Trace.

Không trả Password.

Không trả Refresh Token trong API công khai.

Luôn Validate Request.
```

---

# 27. Acceptance Criteria

✓ RESTful API

✓ Chuẩn Response

✓ Chuẩn Error

✓ Swagger đầy đủ

✓ JWT Authentication

✓ Versioning

✓ AI sinh API đúng chuẩn

---

# 28. Related Documents

Backend Architecture

Authentication Development

Coding Standards

Database Guidelines

OpenAPI Specification

Security Guidelines

---

# 29. Summary

API Development Standards định nghĩa toàn bộ tiêu chuẩn xây dựng REST API của BusZ, bao gồm quy ước Endpoint, Request/Response, Authentication, Validation, Pagination, Error Handling, Versioning và Security. Tài liệu này giúp tất cả API trong hệ thống thống nhất về thiết kế, dễ tích hợp và hỗ trợ AI sinh Controller, Service và OpenAPI Specification theo cùng một tiêu chuẩn.