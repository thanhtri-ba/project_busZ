# ADR-003 Flutter Framework Decision

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Architecture Decision Record

Document ID

ADR-003

Status

Accepted

Decision Date

2026-07-05

Decision Owner

Architecture Team

Version

1.0

---

# 1. Context

BusZ cần phát triển ứng dụng Mobile cho:

- Android
- iOS

Yêu cầu

- Một codebase
- Native Performance
- Modern UI
- Offline Support
- Map Integration
- Camera
- QR Code

---

# 2. Problem Statement

Lựa chọn Mobile Framework.

---

# 3. Considered Options

Flutter

React Native

Native Android

Native iOS

Kotlin Multiplatform

---

# 4. Evaluation

| Framework | Cross Platform | Performance | UI | Community |
|------------|:--------------:|:-----------:|:--:|:---------:|
| Flutter | ✅ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| React Native | ✅ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Native | ❌ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| KMP | ⚠️ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |

---

# 5. Decision

Flutter được lựa chọn.

---

# 6. Rationale

- Google Support
- Material Design
- Fast Development
- High Performance
- Rich UI
- Excellent Maps Support

---

# 7. Consequences

Ưu điểm

- Single Codebase

- Excellent UI

- Fast Development

- Rich Packages

Nhược điểm

- App Size lớn hơn Native

---

# 8. Related ADR

ADR-002 NestJS

ADR-005 OpenStreetMap

ADR-009 AI

---

# 9. Review

Decision sẽ được xem xét khi:

- Flutter không còn phù hợp
- Có thay đổi lớn về nền tảng