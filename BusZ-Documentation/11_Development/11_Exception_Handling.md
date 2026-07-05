# Exception Handling

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-011

Priority

Critical

Version

1.0

---

# 1. Purpose

Exception Handling định nghĩa tiêu chuẩn xây dựng, quản lý và xử lý Exception trong toàn bộ hệ thống BusZ nhằm đảm bảo tính nhất quán, dễ bảo trì và hỗ trợ AI Code Generation.

Mục tiêu

- Chuẩn hóa Exception
- Chuẩn hóa Business Exception
- Chuẩn hóa Infrastructure Exception
- Chuẩn hóa Error Mapping
- Chuẩn hóa Retry Strategy

---

# 2. Exception Principles

```text
Meaningful

Traceable

Recoverable

Consistent

Secure
```

---

# 3. Exception Categories

```text
Validation Exception

Authentication Exception

Authorization Exception

Business Exception

Database Exception

Payment Exception

Notification Exception

Infrastructure Exception

System Exception
```

---

# 4. Exception Hierarchy

```text
BaseException

↓

ValidationException

↓

AuthenticationException

↓

AuthorizationException

↓

BusinessException

↓

PaymentException

↓

DatabaseException

↓

InfrastructureException
```

---

# 5. Validation Exception

Ví dụ

```text
Invalid Email

Invalid Phone

Invalid Seat

Invalid Booking

Required Field
```

HTTP

```text
422
```

---

# 6. Authentication Exception

```text
Invalid Password

Expired Token

Invalid JWT

Refresh Expired

Invalid OTP
```

HTTP

```text
401
```

---

# 7. Authorization Exception

```text
Permission Denied

Role Denied

Access Forbidden
```

HTTP

```text
403
```

---

# 8. Business Exception

```text
Seat Reserved

Booking Expired

Trip Cancelled

Refund Rejected

Ticket Invalid
```

HTTP

```text
409
```

---

# 9. Payment Exception

```text
Gateway Timeout

Payment Failed

Duplicate Transaction

Refund Failed

Invalid Signature
```

---

# 10. Database Exception

```text
Connection Lost

Deadlock

Duplicate Key

Constraint Failed

Migration Error
```

---

# 11. Infrastructure Exception

```text
Redis Down

SMTP Failed

Firebase Failed

Storage Failed

Queue Failed
```

---

# 12. Exception Structure

```text
Error Code

Message

Details

HTTP Status

Trace ID

Timestamp
```

---

# 13. Exception Mapping

```text
Validation → 422

Authentication → 401

Authorization → 403

Business → 409

Database → 500

Infrastructure → 500
```

---

# 14. Retry Policy

Retry

```text
Network Error

SMTP

Firebase

Payment Timeout

Queue Failure
```

Không Retry

```text
Permission

Validation

Duplicate Booking

Duplicate Payment
```

---

# 15. Rollback Rules

Rollback khi

```text
Booking Failed

Payment Failed

Refund Failed

Ticket Failed
```

---

# 16. Transaction Rules

```text
Atomic

Consistent

Rollback

Commit

Audit
```

---

# 17. Logging Rules

Log

```text
Exception Type

Trace ID

Stack Trace

Request ID

Execution Time
```

---

# 18. User Messages

Hiển thị

```text
Đã xảy ra lỗi.

Không thể xử lý yêu cầu.

Vui lòng thử lại.
```

Không hiển thị

```text
Stack Trace

SQL

Internal Exception

Source Code
```

---

# 19. Monitoring

```text
Top Exceptions

Most Frequent Errors

Unhandled Exceptions

Payment Errors

Database Errors
```

---

# 20. Development Rules

```text
Không throw Exception chung.

Không swallow Exception.

Luôn throw đúng loại.

Luôn có Error Code.

Không dùng Exception để điều khiển Business Logic.
```

---

# 21. Testing

```text
Validation Exception

Business Exception

Gateway Exception

Rollback

Retry

Unhandled Exception
```

---

# 22. Performance

```text
Exception Mapping <5 ms

Rollback <500 ms

Retry <2 Seconds
```

---

# 23. Acceptance Criteria

✓ Exception phân loại rõ

✓ Error Code thống nhất

✓ Retry Policy

✓ Rollback

✓ Logging

✓ AI sinh Exception đúng chuẩn

---

# 24. Related Documents

Error Handling

Logging Standards

Backend Architecture

Security Guidelines

API Development

---

# 25. Summary

Exception Handling định nghĩa toàn bộ kiến trúc Exception của BusZ, bao gồm phân loại Exception, Error Mapping, Rollback, Retry Policy và Logging. Tài liệu này giúp toàn bộ Backend xử lý lỗi thống nhất, an toàn và hỗ trợ AI sinh mã nguồn theo cùng một tiêu chuẩn.