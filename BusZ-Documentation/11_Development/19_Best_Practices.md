# Best Practices

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-019

Priority

Critical

Version

1.0

---

# 1. Purpose

Best Practices định nghĩa các nguyên tắc và kinh nghiệm phát triển phần mềm được áp dụng trong toàn bộ dự án BusZ nhằm nâng cao chất lượng mã nguồn, hiệu năng, bảo mật và khả năng bảo trì.

Mục tiêu

- Chuẩn hóa Best Practices
- Giảm Technical Debt
- Tăng Maintainability
- Tăng Performance
- Hỗ trợ AI Code Generation

---

# 2. General Principles

```text
Keep It Simple

Don't Repeat Yourself

You Aren't Gonna Need It

Single Responsibility

Clean Code
```

---

# 3. Backend Best Practices

```text
Thin Controller

Business Logic trong Service

Repository chỉ truy cập Database

DTO cho Request/Response

Validation trước Business Logic
```

---

# 4. API Best Practices

```text
RESTful Design

HTTP Status đúng chuẩn

Pagination

Filtering

Sorting

Versioning

Idempotency
```

---

# 5. Database Best Practices

```text
Normalization

Index đúng chỗ

Transaction

Soft Delete

Audit Fields

Foreign Key
```

Không nên

```text
SELECT *

Hard Delete

Long Transaction

N+1 Query
```

---

# 6. Prisma Best Practices

```text
One Model = One Table

Use Enum

Use Transaction

Use Include hợp lý

Không Query trong Loop
```

---

# 7. Flutter Best Practices

```text
Feature First

Riverpod

Repository Pattern

UseCase Pattern

GoRouter

Responsive Layout
```

---

# 8. React Best Practices

```text
Reusable Components

Feature-based Folder

React Query

Lazy Loading

Memoization

Custom Hooks
```

---

# 9. UI/UX Best Practices

```text
Responsive

Dark Mode

Accessibility

Loading State

Empty State

Error State
```

---

# 10. Security Best Practices

```text
JWT

HTTPS

RBAC

Input Validation

Password Hash

Rate Limiting
```

Không nên

```text
Hardcode Secret

Store Password

Trust Client Data
```

---

# 11. Performance Best Practices

```text
Caching

Pagination

Compression

Image Optimization

Background Jobs

Connection Pool
```

---

# 12. Logging Best Practices

```text
Structured Logging

Correlation ID

Audit Log

Security Log

Payment Log
```

Không Log

```text
Password

OTP

JWT

Credit Card

Refresh Token
```

---

# 13. Error Handling Best Practices

```text
Global Exception Handler

Meaningful Error Code

Retry Policy

Rollback

Graceful Degradation
```

---

# 14. Git Best Practices

```text
Small Commit

Feature Branch

Review trước Merge

Delete Branch sau Merge

Tag mỗi Release
```

---

# 15. Code Review Best Practices

```text
Review Logic

Review Security

Review Performance

Review Readability

Review Documentation
```

---

# 16. Testing Best Practices

```text
Unit Test

Integration Test

Widget Test

Regression Test

Performance Test
```

---

# 17. Documentation Best Practices

```text
Update cùng Source Code

README đầy đủ

API Docs

Architecture Docs

Release Notes
```

---

# 18. AI Development Best Practices

```text
AI chỉ hỗ trợ sinh Code.

Developer phải Review.

AI Code phải Test.

AI Code phải Format.

AI Code phải qua CI.
```

---

# 19. Team Collaboration

```text
Daily Standup

Sprint Planning

Code Review

Retrospective

Knowledge Sharing
```

---

# 20. Technical Debt Management

```text
Refactor thường xuyên.

Không bỏ TODO lâu dài.

Theo dõi SonarQube.

Giảm Duplicate Code.

Cập nhật Dependency.
```

---

# 21. Acceptance Criteria

✓ Backend Best Practices

✓ Frontend Best Practices

✓ Flutter Best Practices

✓ Database Best Practices

✓ Security Best Practices

✓ AI Development Best Practices

---

# 22. Related Documents

Coding Standards

Code Review

Code Quality

Development Checklist

Definition of Done

Security Guidelines

---

# 23. Summary

Best Practices tổng hợp các nguyên tắc phát triển phần mềm được áp dụng trong BusZ cho Backend, Frontend, Flutter, Database, API, Security và quy trình làm việc nhóm. Việc tuân thủ các nguyên tắc này giúp hệ thống ổn định, dễ mở rộng, dễ bảo trì và hỗ trợ AI sinh mã nguồn đạt chất lượng enterprise.