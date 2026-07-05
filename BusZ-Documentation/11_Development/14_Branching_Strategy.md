# Branching Strategy

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-014

Priority

Critical

Version

1.0

---

# 1. Purpose

Branching Strategy định nghĩa chiến lược quản lý Branch của BusZ nhằm đảm bảo việc phát triển song song, phát hành phiên bản và sửa lỗi được thực hiện an toàn, nhất quán.

Mục tiêu

- Chuẩn hóa Branch Strategy
- Giảm Merge Conflict
- Hỗ trợ CI/CD
- Hỗ trợ Release
- Hỗ trợ AI Code Generation

---

# 2. Branch Types

```text
main

develop

feature/*

bugfix/*

hotfix/*

release/*
```

---

# 3. Main Branch

```text
main
```

Mục đích

```text
Production Ready

Stable Code

Release Only
```

Quy định

```text
Protected

No Direct Push

Review Required

CI Required
```

---

# 4. Develop Branch

```text
develop
```

Mục đích

```text
Integration

Testing

Sprint Development
```

---

# 5. Feature Branch

Format

```text
feature/<feature-name>
```

Ví dụ

```text
feature/login

feature/payment

feature/booking-history

feature/review-system
```

Tạo từ

```text
develop
```

Merge vào

```text
develop
```

---

# 6. Bugfix Branch

Format

```text
bugfix/<bug-name>
```

Ví dụ

```text
bugfix/payment-timeout

bugfix/seat-lock

bugfix/profile-image
```

---

# 7. Hotfix Branch

Format

```text
hotfix/<issue>
```

Ví dụ

```text
hotfix/login-error

hotfix/payment-crash

hotfix/api-security
```

Tạo từ

```text
main
```

Merge

```text
main

↓

develop
```

---

# 8. Release Branch

Format

```text
release/v1.0.0
```

Ví dụ

```text
release/v1.1.0

release/v1.2.0

release/v2.0.0
```

Mục đích

```text
Final Testing

Bug Fix

Release Candidate
```

---

# 9. Branch Lifecycle

```text
Create Branch

↓

Develop

↓

Commit

↓

Push

↓

Pull Request

↓

Review

↓

Merge

↓

Delete Branch
```

---

# 10. Branch Protection

Áp dụng

```text
main

develop
```

Yêu cầu

```text
Review

CI Passed

Signed Commit (Optional)

No Force Push

No Direct Commit
```

---

# 11. Merge Rules

```text
Feature → Develop

Bugfix → Develop

Release → Main

Hotfix → Main + Develop
```

---

# 12. Pull Request Rules

```text
One Feature

One Issue

One Reviewer

CI Passed

Documentation Updated
```

---

# 13. Commit Rules

```text
Atomic Commit

Small Commit

Meaningful Message

Conventional Commit
```

---

# 14. Release Workflow

```text
develop

↓

release

↓

QA

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
Production Issue

↓

hotfix

↓

Review

↓

Test

↓

Merge main

↓

Merge develop
```

---

# 16. Branch Naming Rules

Chỉ dùng

```text
Lowercase

Hyphen

English
```

Ví dụ

```text
feature/payment-history

bugfix/login-timeout
```

Không dùng

```text
Feature1

FixBug

NewCode
```

---

# 17. CI/CD Integration

Tự động chạy

```text
Build

Lint

Unit Test

Integration Test

Security Scan
```

---

# 18. Development Rules

```text
Không làm nhiều Feature trên một Branch.

Không Merge khi có Conflict.

Không Push trực tiếp vào main.

Luôn Pull trước khi Push.

Luôn Resolve Conflict trước Review.
```

---

# 19. Best Practices

```text
Branch ngắn hạn.

Merge thường xuyên.

Commit nhỏ.

Review sớm.

Delete Branch sau Merge.
```

---

# 20. Acceptance Criteria

✓ Branch Strategy rõ ràng

✓ Protected Branch

✓ Merge Rules

✓ Release Workflow

✓ Hotfix Workflow

✓ CI Integration

✓ AI sinh Branch đúng chuẩn

---

# 21. Related Documents

Git Workflow

Code Review

CI/CD

Versioning

Definition of Done

---

# 22. Summary

Branching Strategy định nghĩa chiến lược quản lý Branch của BusZ theo mô hình GitHub Flow mở rộng với các nhánh Feature, Bugfix, Hotfix và Release. Quy trình này giúp nhóm phát triển làm việc song song hiệu quả, giảm xung đột, hỗ trợ CI/CD và đảm bảo chất lượng trước khi phát hành phiên bản mới.