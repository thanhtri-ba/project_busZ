# Git Workflow

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-013

Priority

Critical

Version

1.0

---

# 1. Purpose

Git Workflow định nghĩa quy trình sử dụng Git thống nhất trong dự án BusZ nhằm đảm bảo quản lý mã nguồn hiệu quả, giảm xung đột và hỗ trợ phát triển theo nhóm.

Mục tiêu

- Chuẩn hóa Git Workflow
- Giảm Merge Conflict
- Hỗ trợ CI/CD
- Hỗ trợ Release
- Hỗ trợ AI Code Generation

---

# 2. Git Model

BusZ sử dụng

```text
GitHub Flow
```

Kết hợp

```text
Feature Branch

Pull Request

Code Review

CI/CD
```

---

# 3. Main Branches

```text
main

production-ready code
```

```text
develop

integration branch
```

---

# 4. Supporting Branches

```text
feature/*

bugfix/*

hotfix/*

release/*
```

Ví dụ

```text
feature/authentication

feature/payment

feature/booking

bugfix/payment-timeout

hotfix/login-error

release/v1.2.0
```

---

# 5. Workflow

```text
Create Feature Branch

↓

Develop

↓

Commit

↓

Push

↓

Pull Request

↓

Code Review

↓

CI

↓

Merge

↓

Delete Branch
```

---

# 6. Branch Naming

Feature

```text
feature/booking-history
```

Bug

```text
bugfix/payment-timeout
```

Hotfix

```text
hotfix/jwt-expired
```

Release

```text
release/v1.0.0
```

---

# 7. Commit Message Standard

Format

```text
type(scope): message
```

Ví dụ

```text
feat(auth): add login API

feat(payment): support VNPay

fix(booking): prevent duplicate booking

docs(api): update swagger

refactor(ticket): simplify QR validation

test(auth): add login tests

chore(ci): update workflow
```

---

# 8. Commit Types

```text
feat

fix

docs

style

refactor

perf

test

build

ci

chore

revert
```

---

# 9. Pull Request Process

```text
Create PR

↓

CI

↓

Review

↓

Approve

↓

Merge
```

---

# 10. Pull Request Template

```text
Summary

Changes

Testing

Screenshots

Checklist

Issue Reference
```

---

# 11. Merge Strategy

Khuyến nghị

```text
Squash Merge
```

Không khuyến nghị

```text
Force Push to Main

Merge without Review
```

---

# 12. Conflict Resolution

```text
Fetch Latest

Rebase

Resolve Conflict

Run Tests

Push Again
```

---

# 13. Protected Branches

```text
main

develop
```

Yêu cầu

```text
PR Required

Review Required

CI Passed

No Force Push
```

---

# 14. Release Workflow

```text
develop

↓

release/v1.x.x

↓

Testing

↓

main

↓

Tag

↓

Deploy
```

---

# 15. Hotfix Workflow

```text
main

↓

hotfix/*

↓

Review

↓

Merge main

↓

Merge develop
```

---

# 16. Git Tags

Ví dụ

```text
v1.0.0

v1.1.0

v1.2.0

v2.0.0
```

---

# 17. CI Integration

Mỗi Push sẽ chạy

```text
Build

Lint

Unit Test

Integration Test

Security Scan
```

---

# 18. Git Rules

```text
Không commit trực tiếp vào main.

Không push code chưa test.

Không merge khi CI lỗi.

Luôn cập nhật branch trước khi merge.

Luôn review trước khi merge.
```

---

# 19. Development Rules

```text
Một Feature = Một Branch.

Một Bug = Một Branch.

Một PR chỉ giải quyết một vấn đề.

Commit nhỏ và rõ ràng.

Xóa branch sau khi merge.
```

---

# 20. Acceptance Criteria

✓ Branch Strategy rõ ràng

✓ Commit Convention

✓ PR Workflow

✓ Review Process

✓ Release Process

✓ CI Integration

✓ AI sinh Git Workflow đúng chuẩn

---

# 21. Related Documents

Branching Strategy

Code Review

CI/CD

Coding Standards

Versioning

Definition of Done

---

# 22. Summary

Git Workflow định nghĩa toàn bộ quy trình quản lý mã nguồn của BusZ từ Branch, Commit, Pull Request, Code Review, Merge, Release đến Hotfix. Tài liệu này giúp nhóm phát triển làm việc thống nhất, giảm xung đột, nâng cao chất lượng mã nguồn và hỗ trợ AI tạo commit, branch và pull request theo đúng quy trình.