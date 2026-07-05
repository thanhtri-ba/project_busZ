# Development Checklist

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-018

Priority

Critical

Version

1.0

---

# 1. Purpose

Development Checklist định nghĩa danh sách kiểm tra bắt buộc trước khi Commit, Pull Request, Merge và Release nhằm đảm bảo mọi thay đổi trong BusZ đáp ứng đầy đủ tiêu chuẩn chất lượng.

Mục tiêu

- Chuẩn hóa Development Process
- Giảm Production Bug
- Chuẩn hóa Release
- Hỗ trợ QA
- Hỗ trợ AI Code Generation

---

# 2. Development Workflow

```text
Requirement

↓

Development

↓

Self Review

↓

Testing

↓

Commit

↓

Pull Request

↓

Code Review

↓

Merge

↓

Deploy
```

---

# 3. Before Coding

Developer phải xác nhận

```text
Requirement rõ ràng

Business Rules đã đọc

API Specification đã có

Database Schema đã cập nhật

Task được phân công
```

---

# 4. During Development

```text
Coding Standards

Architecture Standards

Naming Convention

Repository Pattern

Service Pattern

Validation
```

---

# 5. Before Commit

Kiểm tra

```text
Build Success

No Compile Error

Lint Passed

Format Completed

No Debug Code
```

---

# 6. Before Push

```text
Pull Latest Code

Resolve Conflict

Run Unit Test

Update Documentation

Review Changed Files
```

---

# 7. Pull Request Checklist

```text
PR Description

Issue Reference

Screenshots (UI)

Testing Result

Documentation Updated

Checklist Completed
```

---

# 8. Backend Checklist

```text
Controller

Service

Repository

DTO

Validation

Logging

Error Handling

Transaction
```

---

# 9. Frontend Checklist

```text
Responsive

Accessibility

Reusable Component

API Integration

Loading State

Error State
```

---

# 10. Flutter Checklist

```text
Riverpod

GoRouter

Offline Cache

Secure Storage

Responsive Layout

Widget Test
```

---

# 11. Database Checklist

```text
Migration

Rollback

Indexes

Foreign Keys

Soft Delete

Audit Fields
```

---

# 12. API Checklist

```text
Swagger Updated

Validation

HTTP Status

Response Format

Authentication

Pagination
```

---

# 13. Security Checklist

```text
JWT

RBAC

Input Validation

SQL Injection

XSS

Sensitive Data
```

---

# 14. Testing Checklist

```text
Unit Test

Integration Test

Regression Test

Manual Test

Performance Test
```

---

# 15. Performance Checklist

```text
No N+1 Query

Caching

Pagination

Compression

Lazy Loading
```

---

# 16. Documentation Checklist

```text
README Updated

API Updated

Architecture Updated

Database Updated

Release Notes Updated
```

---

# 17. Code Review Checklist

```text
Approval

CI Passed

No Critical Issue

No Security Issue

Comments Resolved
```

---

# 18. Before Merge

```text
CI Passed

Review Approved

Conflict Resolved

Tests Passed

Documentation Updated
```

---

# 19. Before Release

```text
Release Notes

Git Tag

Version Updated

Deployment Ready

Rollback Plan

Backup Completed
```

---

# 20. Development Rules

```text
Không bỏ qua Checklist.

Không Merge khi Checklist chưa hoàn thành.

Checklist phải được Review.

Mọi Critical Module phải có ít nhất 2 Reviewer.

Documentation phải được cập nhật cùng Source Code.
```

---

# 21. Acceptance Criteria

✓ Checklist đầy đủ

✓ Backend Checklist

✓ Frontend Checklist

✓ Flutter Checklist

✓ Database Checklist

✓ Release Checklist

✓ AI sinh Checklist đúng chuẩn

---

# 22. Related Documents

Coding Standards

Code Review

Git Workflow

Versioning

Definition of Done

CI/CD Pipeline

---

# 23. Summary

Development Checklist là danh sách kiểm tra bắt buộc trong quy trình phát triển BusZ từ Coding, Testing, Code Review đến Release. Tài liệu giúp giảm lỗi, tăng chất lượng phần mềm, đảm bảo mọi thay đổi đều tuân thủ tiêu chuẩn kỹ thuật và hỗ trợ AI sinh mã nguồn theo quy trình phát triển thống nhất.