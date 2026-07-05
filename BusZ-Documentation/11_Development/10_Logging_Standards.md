# Logging Standards

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-010

Priority

Critical

Version

1.0

---

# 1. Purpose

Logging Standards định nghĩa tiêu chuẩn ghi log thống nhất cho toàn bộ hệ thống BusZ nhằm phục vụ Debugging, Monitoring, Audit, Security và Incident Investigation.

Mục tiêu

- Chuẩn hóa Logging
- Hỗ trợ Monitoring
- Hỗ trợ Debug
- Hỗ trợ Security
- Hỗ trợ AI Code Generation

---

# 2. Logging Principles

```text
Structured

Centralized

Traceable

Secure

Searchable
```

---

# 3. Logging Levels

```text
TRACE

DEBUG

INFO

WARN

ERROR

FATAL
```

---

# 4. Log Categories

```text
Application Log

Audit Log

Security Log

Payment Log

Access Log

System Log
```

---

# 5. Application Log

Ghi nhận

```text
Request

Response

Business Event

Execution Time

Cache

Queue
```

---

# 6. Audit Log

Ghi nhận

```text
Create

Update

Delete

Login

Logout

Permission Change

Refund Approval
```

---

# 7. Security Log

Ghi nhận

```text
Failed Login

Permission Denied

Token Expired

JWT Validation

Password Reset

Brute Force

Blocked IP
```

---

# 8. Payment Log

```text
Payment Created

Gateway Request

Gateway Callback

Refund

Webhook

Duplicate Callback
```

---

# 9. Access Log

```text
Request URL

Method

Status Code

Duration

IP Address

User Agent

Request ID
```

---

# 10. Log Format

JSON

```json
{
  "timestamp": "...",
  "level": "INFO",
  "service": "booking-service",
  "requestId": "...",
  "userId": "...",
  "message": "...",
  "duration": 125
}
```

---

# 11. Correlation ID

Mỗi Request phải có

```text
Request ID

Correlation ID

Trace ID
```

---

# 12. Log Context

```text
User ID

Booking ID

Payment ID

Trip ID

Company ID

Device ID
```

---

# 13. Sensitive Data

Không ghi log

```text
Password

JWT

Refresh Token

OTP

Credit Card

CVV

Bank Account
```

---

# 14. Exception Logging

Log

```text
Stack Trace

Request

Exception Type

Message

Trace ID
```

---

# 15. Performance Logging

```text
Slow Query

API Response Time

Cache Hit

Queue Time

Memory Usage
```

---

# 16. Monitoring Integration

```text
Prometheus

Grafana

Loki

OpenTelemetry
```

---

# 17. Log Rotation

```text
Daily Rotation

Compress Old Logs

Auto Cleanup

Retention Policy
```

---

# 18. Retention Policy

```text
Application Log

90 Days

Audit Log

7 Years

Payment Log

10 Years

Security Log

2 Years
```

---

# 19. Alert Rules

```text
ERROR >50/min

FATAL

Database Down

Payment Failure

Unauthorized Access

High CPU
```

---

# 20. Search Index

```text
Timestamp

Level

User

Booking

Payment

Request ID

Trace ID
```

---

# 21. Development Rules

```text
Log đúng Level.

Không log dữ liệu nhạy cảm.

Luôn có Request ID.

Business Event phải có Audit Log.

Unexpected Error phải có Stack Trace.
```

---

# 22. Performance Targets

```text
Logging <5 ms

Search Log <2 Seconds

Retention 99.9%

Log Delivery >99.99%
```

---

# 23. Acceptance Criteria

✓ Structured Logging

✓ Correlation ID

✓ Audit Log

✓ Security Log

✓ Payment Log

✓ Monitoring Integration

✓ AI sinh Logging đúng chuẩn

---

# 24. Related Documents

Error Handling

Backend Architecture

Monitoring

Security Guidelines

Deployment

Audit Policy

---

# 25. Summary

Logging Standards định nghĩa tiêu chuẩn ghi log của BusZ theo hướng Structured Logging và Centralized Logging. Hệ thống phân loại rõ Application Log, Audit Log, Security Log và Payment Log, đồng thời tích hợp với Prometheus, Grafana, Loki và OpenTelemetry để hỗ trợ Monitoring, Debugging và Incident Response hiệu quả.