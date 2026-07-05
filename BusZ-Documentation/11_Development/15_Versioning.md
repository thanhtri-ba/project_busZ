# Versioning

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-015

Priority

Critical

Version

1.0

---

# 1. Purpose

Versioning định nghĩa quy tắc quản lý phiên bản của toàn bộ hệ thống BusZ bao gồm Backend API, Mobile App, Web App, Database và Documentation nhằm đảm bảo việc phát hành phiên bản nhất quán và dễ theo dõi.

Mục tiêu

- Chuẩn hóa Versioning
- Chuẩn hóa Release
- Chuẩn hóa Git Tag
- Chuẩn hóa Release Notes
- Hỗ trợ AI Code Generation

---

# 2. Versioning Standard

BusZ sử dụng

```text
Semantic Versioning (SemVer)

MAJOR.MINOR.PATCH
```

Ví dụ

```text
1.0.0

1.1.0

1.1.1

2.0.0
```

---

# 3. MAJOR Version

Tăng khi

```text
Breaking Changes

Architecture Changes

Database Breaking Changes

API Breaking Changes
```

Ví dụ

```text
1.x.x

↓

2.0.0
```

---

# 4. MINOR Version

Tăng khi

```text
New Feature

New API

New Module

Backward Compatible
```

Ví dụ

```text
1.1.0

↓

1.2.0
```

---

# 5. PATCH Version

Tăng khi

```text
Bug Fix

Security Fix

Performance Improvement

Documentation Update
```

Ví dụ

```text
1.2.0

↓

1.2.1
```

---

# 6. Pre-release Version

```text
1.0.0-alpha

1.0.0-beta

1.0.0-rc.1

1.0.0-rc.2
```

---

# 7. Release Lifecycle

```text
Development

↓

Alpha

↓

Beta

↓

Release Candidate

↓

Production

↓

Maintenance
```

---

# 8. Git Tags

Format

```text
v1.0.0

v1.1.0

v1.2.3

v2.0.0
```

---

# 9. Release Branch

Ví dụ

```text
release/v1.0.0

release/v1.1.0

release/v2.0.0
```

---

# 10. Release Notes

Bao gồm

```text
New Features

Bug Fixes

Breaking Changes

Known Issues

Migration Guide
```

---

# 11. API Versioning

Format

```text
/api/v1

/api/v2
```

Quy tắc

```text
Không thay đổi API cũ.

API mới tạo Version mới.

Deprecated trước khi xóa.
```

---

# 12. Mobile Version

Android

```text
versionName

versionCode
```

Flutter

```text
1.0.0+1
```

Ví dụ

```text
1.2.0+45
```

---

# 13. Database Version

Migration

```text
20260704120000_init

20260705103000_add_payment

20260706150000_add_ticket
```

---

# 14. Documentation Version

Ví dụ

```text
v1.0

v1.1

v2.0
```

---

# 15. Compatibility Policy

Đảm bảo

```text
Backward Compatibility

API Compatibility

Database Compatibility
```

---

# 16. Deprecation Policy

Quy trình

```text
Announce

↓

Mark Deprecated

↓

Migration Period

↓

Remove
```

---

# 17. Hotfix Version

Ví dụ

```text
1.2.1

1.2.2

1.2.3
```

Không tạo

```text
1.3.0
```

---

# 18. Build Metadata

Ví dụ

```text
1.2.0+20260704

1.2.0+build102

1.2.0+ci456
```

---

# 19. Development Rules

```text
Không sửa Git Tag.

Không ghi đè Release.

Luôn cập nhật CHANGELOG.

Mỗi Release phải có Release Notes.

Mỗi Version phải có Git Tag.
```

---

# 20. Acceptance Criteria

✓ Semantic Versioning

✓ Git Tag

✓ Release Branch

✓ Release Notes

✓ API Versioning

✓ Database Versioning

✓ AI sinh Version đúng chuẩn

---

# 21. Related Documents

Git Workflow

Branching Strategy

Deployment

API Development

CI/CD

Release Checklist

---

# 22. Summary

Versioning định nghĩa tiêu chuẩn quản lý phiên bản của BusZ theo Semantic Versioning (SemVer), áp dụng cho Backend, Frontend, Mobile, Database và Documentation. Tài liệu này giúp đảm bảo việc phát hành phần mềm được quản lý chặt chẽ, dễ theo dõi và hỗ trợ AI sinh Release, Git Tag và API Version đúng chuẩn.