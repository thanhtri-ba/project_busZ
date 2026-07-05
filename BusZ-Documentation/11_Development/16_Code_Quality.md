# Code Quality Standards

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-016

Priority

Critical

Version

1.0

---

# 1. Purpose

Code Quality Standards định nghĩa các tiêu chuẩn đánh giá chất lượng mã nguồn của BusZ nhằm đảm bảo tính ổn định, khả năng bảo trì, hiệu năng và bảo mật của hệ thống.

Mục tiêu

- Chuẩn hóa Code Quality
- Giảm Technical Debt
- Tăng Maintainability
- Tăng Testability
- Hỗ trợ AI Code Generation

---

# 2. Quality Principles

```text
Readable

Maintainable

Reusable

Testable

Secure

Performant
```

---

# 3. Code Style

Tuân thủ

```text
ESLint

Prettier

Dart Format

EditorConfig
```

---

# 4. Naming Quality

```text
Meaningful Class

Meaningful Variable

Meaningful Function

Meaningful Constant
```

Không dùng

```text
a

abc

temp

test123

data1
```

---

# 5. Function Quality

```text
Single Responsibility

≤50 Lines

≤5 Parameters

Return Early

No Deep Nesting
```

---

# 6. Class Quality

```text
Single Responsibility

Dependency Injection

High Cohesion

Low Coupling
```

---

# 7. Complexity

Cyclomatic Complexity

```text
Target ≤10

Maximum ≤15
```

---

# 8. Code Duplication

```text
Maximum

<3%
```

Nếu lớn hơn

```text
Refactor

Shared Utility

Reusable Component
```

---

# 9. Test Coverage

Backend

```text
≥80%
```

Flutter

```text
≥80%
```

Critical Module

```text
≥90%
```

---

# 10. Static Analysis

Sử dụng

```text
ESLint

SonarQube

Dart Analyze

TypeScript Compiler
```

---

# 11. Security Quality

Kiểm tra

```text
SQL Injection

XSS

CSRF

JWT

Secrets

Hardcoded Password
```

---

# 12. Performance Quality

```text
Avoid N+1 Query

Pagination

Caching

Lazy Loading

Index Optimization
```

---

# 13. Documentation Quality

Mỗi Module phải có

```text
README

API Docs

Comments

Examples
```

---

# 14. Logging Quality

```text
Meaningful Log

No Sensitive Data

Request ID

Trace ID

Audit Log
```

---

# 15. Error Handling Quality

```text
Meaningful Exception

Global Handler

Error Code

Retry Policy
```

---

# 16. Maintainability

Maintainability Index

```text
>80
```

Technical Debt

```text
<5%
```

---

# 17. SonarQube Targets

```text
Bugs = 0

Vulnerabilities = 0

Code Smells <20

Coverage ≥80%

Duplications <3%
```

---

# 18. AI Generated Code Rules

```text
Review Required

Lint Required

Tests Required

Documentation Required

Security Review Required
```

---

# 19. Development Rules

```text
Không commit code chưa format.

Không merge khi còn Warning nghiêm trọng.

Không bỏ qua Linter.

Không để TODO trong Production.

Luôn Refactor khi phát hiện Duplicate Code.
```

---

# 20. Acceptance Criteria

✓ ESLint Passed

✓ Prettier Passed

✓ SonarQube Passed

✓ Coverage đạt yêu cầu

✓ Complexity đạt chuẩn

✓ AI Code được Review

---

# 21. Related Documents

Coding Standards

Code Review

Testing Strategy

Git Workflow

Best Practices

Definition of Done

---

# 22. Summary

Code Quality Standards định nghĩa các tiêu chuẩn đánh giá chất lượng mã nguồn của BusZ, bao gồm Coding Style, Static Analysis, Code Coverage, Cyclomatic Complexity, Duplication, Security và Maintainability. Tài liệu này giúp đảm bảo toàn bộ mã nguồn đạt chất lượng enterprise và hỗ trợ AI sinh mã nguồn theo cùng một tiêu chuẩn.