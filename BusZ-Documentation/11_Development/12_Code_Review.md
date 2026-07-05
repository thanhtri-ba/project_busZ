# Code Review Standards

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-012

Priority

Critical

Version

1.0

---

# 1. Purpose

Code Review Standards định nghĩa quy trình kiểm tra mã nguồn nhằm đảm bảo chất lượng, tính bảo trì, bảo mật và tính nhất quán của toàn bộ dự án BusZ.

Mục tiêu

- Chuẩn hóa Code Review
- Giảm Bug Production
- Tăng Code Quality
- Chia sẻ kiến thức
- Hỗ trợ AI Code Generation

---

# 2. Objectives

```text
Improve Quality

Reduce Bugs

Knowledge Sharing

Maintain Standards

Increase Security
```

---

# 3. Review Principles

```text
Review Code

Not People

Constructive Feedback

Evidence-Based

Respectful Communication
```

---

# 4. Review Workflow

```text
Developer

↓

Commit

↓

Pull Request

↓

Automatic Checks

↓

Reviewer

↓

Approve

↓

Merge
```

---

# 5. Pull Request Requirements

Mỗi Pull Request phải có

```text
Title

Description

Issue Reference

Screenshots (UI)

Testing Result

Checklist
```

---

# 6. PR Size

Khuyến nghị

```text
<500 Lines
```

Không nên

```text
>1000 Lines
```

---

# 7. Review Checklist

Kiểm tra

```text
Business Logic

Naming Convention

Architecture

Performance

Security

Testing

Documentation
```

---

# 8. Code Quality Checklist

```text
Readable

Maintainable

Reusable

Simple

Consistent
```

---

# 9. Security Checklist

```text
SQL Injection

XSS

CSRF

JWT

Sensitive Data

Authorization

Validation
```

---

# 10. Performance Checklist

```text
N+1 Query

Index Usage

Caching

Loop Optimization

Memory Usage
```

---

# 11. Database Checklist

```text
Migration

Transaction

Index

Foreign Key

Soft Delete

Rollback
```

---

# 12. API Checklist

```text
HTTP Status

Validation

Response Format

Swagger

Authentication

Pagination
```

---

# 13. Flutter Checklist

```text
Widget Structure

Riverpod State

GoRouter

Responsive

Accessibility
```

---

# 14. React Checklist

```text
Reusable Components

Hooks

State Management

Performance

Accessibility
```

---

# 15. Backend Checklist

```text
Controller

Service

Repository

DTO

Validation

Logging
```

---

# 16. Testing Checklist

```text
Unit Test

Integration Test

Manual Test

Regression Test
```

---

# 17. Merge Rules

Chỉ Merge khi

```text
Review Approved

CI Passed

No Conflict

Documentation Updated

Tests Passed
```

---

# 18. Approval Rules

```text
Minimum 1 Reviewer

Critical Module = 2 Reviewers

Security Module = Security Review
```

---

# 19. Review Comments

Ví dụ

```text
Suggestion

Question

Issue

Nitpick

Required Change
```

---

# 20. Merge Strategy

```text
Squash Merge

Rebase Merge

Merge Commit
```

Khuyến nghị

```text
Squash Merge
```

---

# 21. CI Requirements

```text
Lint

Build

Unit Test

Integration Test

Security Scan
```

---

# 22. Development Rules

```text
Không Merge trực tiếp vào Main.

Không bỏ qua Review.

Không Merge khi CI lỗi.

Không Merge Code chưa Test.

Luôn cập nhật Documentation.
```

---

# 23. Acceptance Criteria

✓ Pull Request chuẩn

✓ Review Checklist đầy đủ

✓ CI Passed

✓ Documentation cập nhật

✓ Security Review

✓ AI sinh PR đúng chuẩn

---

# 24. Related Documents

Coding Standards

Git Workflow

Branching Strategy

Code Quality

Definition of Done

CI/CD Pipeline

---

# 25. Summary

Code Review Standards định nghĩa quy trình kiểm tra mã nguồn của BusZ từ Pull Request, Review Checklist, Approval, CI đến Merge. Tài liệu giúp đảm bảo mọi thay đổi đều được kiểm tra kỹ lưỡng, tuân thủ Coding Standards, giảm lỗi và duy trì chất lượng mã nguồn ở mức enterprise.