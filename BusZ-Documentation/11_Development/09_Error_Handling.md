# Error Handling Standards

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-009

Priority

Critical

Version

1.0

---

# 1. Purpose

Error Handling Standards định nghĩa tiêu chuẩn xử lý lỗi thống nhất cho toàn bộ hệ thống BusZ nhằm đảm bảo API nhất quán, dễ debug, an toàn và hỗ trợ AI Code Generation.

Mục tiêu

- Chuẩn hóa Exception
- Chuẩn hóa Error Response
- Chuẩn hóa Logging
- Chuẩn hóa Retry Strategy
- Chuẩn hóa Error Code

---

# 2. Error Handling Principles

```text
Consistent

Secure

Traceable

User Friendly

Machine Readable
```

---

# 3. Error Categories

```text
Validation Error

Authentication Error

Authorization Error

Business Error

Database Error

Infrastructure Error

External Service Error

Unexpected Error
```

---

# 4. Validation Errors

Ví dụ

```text
Required Field

Invalid Email

Invalid Phone

Invalid Date

Invalid Booking
```

HTTP

```text
422 Unprocessable Entity
```

---

# 5. Authentication Errors

```text
Invalid Password

Invalid Token

Expired Token

Refresh Expired

Account Disabled
```

HTTP

```text
401 Unauthorized
```

---

# 6. Authorization Errors

```text
Permission Denied

Role Not Allowed

Resource Forbidden
```

HTTP

```text
403 Forbidden
```

---

# 7. Business Errors

```text
Seat Already Reserved

Booking Expired

Payment Failed

Trip Cancelled

Ticket Refunded
```

HTTP

```text
409 Conflict
```

---

# 8. Database Errors

```text
Duplicate Key

Foreign Key

Transaction Failed

Deadlock

Connection Failed
```

HTTP

```text
500 Internal Server Error
```

---

# 9. External Service Errors

```text
Payment Gateway Timeout

Firebase Failed

SMTP Failed

SMS Failed

Google Maps Failed
```

---

# 10. Standard Error Response

```json
{
  "success": false,
  "code": "BOOKING_NOT_FOUND",
  "message": "Booking not found",
  "errors": [],
  "traceId": "req_01HXYZ...",
  "timestamp": "2026-07-04T12:00:00Z"
}
```

---

# 11. Error Code Convention

```text
AUTH_XXXX

BOOKING_XXXX

PAYMENT_XXXX

TICKET_XXXX

TRIP_XXXX

USER_XXXX

SYSTEM_XXXX
```

Ví dụ

```text
AUTH_0001

BOOKING_0007

PAYMENT_0015
```

---

# 12. Global Exception Handler

Xử lý tập trung

```text
Validation

Authentication

Authorization

Business Exception

Database Exception

Unexpected Exception
```

---

# 13. Retry Strategy

Cho phép Retry

```text
Gateway Timeout

Network Error

Temporary Failure

Queue Failure
```

Không Retry

```text
Validation Error

Permission Denied

Booking Not Found

Duplicate Booking
```

---

# 14. Logging Rules

Log

```text
Request ID

User ID

Endpoint

HTTP Status

Execution Time

Stack Trace (Internal)
```

Không Log

```text
Password

JWT

Refresh Token

OTP

Credit Card
```

---

# 15. Exception Hierarchy

```text
BaseException

↓

BusinessException

↓

ValidationException

↓

AuthenticationException

↓

PaymentException

↓

InfrastructureException
```

---

# 16. User Messages

Hiển thị

```text
Đã xảy ra lỗi.

Vui lòng thử lại.

Không thể kết nối máy chủ.

Phiên đăng nhập đã hết hạn.
```

Không hiển thị

```text
SQL Error

Stack Trace

Internal Path

Database Exception
```

---

# 17. Monitoring

Theo dõi

```text
Error Rate

API Failure

Gateway Failure

Validation Failure

Authentication Failure
```

---

# 18. Alert Rules

```text
Payment Failure >5%

Database Down

Redis Down

API Error >2%

CPU >90%
```

---

# 19. Error Recovery

```text
Retry

Rollback

Fallback

Circuit Breaker

Graceful Degradation
```

---

# 20. Development Rules

```text
Không dùng try-catch rỗng.

Luôn throw Exception có ý nghĩa.

Luôn log Unexpected Error.

Không expose Internal Error.

Controller không xử lý Exception.
```

---

# 21. Testing

Kiểm thử

```text
Validation Error

Authentication Error

Business Error

Database Error

Timeout

Retry
```

---

# 22. Performance Targets

```text
Exception Handling <5 ms

Error Logging <10 ms

Retry Delay <2 Seconds
```

---

# 23. Acceptance Criteria

✓ Global Exception Handler

✓ Error Code thống nhất

✓ Error Response chuẩn

✓ Logging đầy đủ

✓ Retry Strategy rõ ràng

✓ Không lộ thông tin hệ thống

✓ AI sinh Exception đúng chuẩn

---

# 24. Related Documents

Backend Architecture

API Development

Logging Standards

Authentication Development

Security Guidelines

Monitoring

---

# 25. Summary

Error Handling Standards định nghĩa cơ chế xử lý lỗi thống nhất cho BusZ, bao gồm phân loại lỗi, Error Code, Error Response, Global Exception Handler, Logging và Retry Strategy. Tài liệu này giúp toàn bộ Backend phản hồi lỗi nhất quán, an toàn và hỗ trợ AI sinh mã nguồn theo cùng một tiêu chuẩn.