# Flutter Architecture

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-005

Priority

Critical

Version

1.0

---

# 1. Purpose

Flutter Architecture định nghĩa kiến trúc chuẩn cho ứng dụng Mobile BusZ nhằm đảm bảo khả năng mở rộng, dễ bảo trì, dễ kiểm thử và hỗ trợ AI Code Generation.

Mục tiêu

- Chuẩn hóa Flutter Architecture
- Áp dụng Clean Architecture
- Feature First
- Reusable Components
- Offline Ready

---

# 2. Technology Stack

Framework

```text
Flutter
```

Language

```text
Dart
```

State Management

```text
Riverpod
```

Networking

```text
Dio
```

Navigation

```text
GoRouter
```

Local Database

```text
Hive
```

Secure Storage

```text
Flutter Secure Storage
```

Push Notification

```text
Firebase Cloud Messaging
```

---

# 3. Architecture Style

```text
Presentation

↓

Application

↓

Domain

↓

Data

↓

API / Local Storage
```

---

# 4. Folder Structure

```text
lib/

core/

config/

features/

shared/

services/

routes/

widgets/

main.dart
```

---

# 5. Feature Structure

```text
booking/

payment/

ticket/

trip/

authentication/

profile/

notification/

review/

home/
```

---

# 6. Feature Architecture

```text
feature/

data/

domain/

presentation/
```

---

# 7. Data Layer

```text
Datasource

Repository

DTO

Mapper

Model
```

---

# 8. Domain Layer

```text
Entity

UseCase

Repository Interface

Business Rules
```

---

# 9. Presentation Layer

```text
Pages

Widgets

Riverpod Providers

State

ViewModel
```

---

# 10. Core Module

```text
Constants

Theme

Localization

Error Handler

Network

Logger

Dependency Injection
```

---

# 11. Shared Module

```text
Buttons

Dialogs

Cards

Forms

Extensions

Utilities
```

---

# 12. Routing

```text
Splash

Login

Home

Search

Booking

Payment

Profile

History

Settings
```

Navigation

```text
GoRouter
```

---

# 13. State Management

Global

```text
Authentication

Theme

Language

Notification
```

Feature

```text
Booking

Trip

Seat

Payment

Profile
```

---

# 14. API Layer

```text
Authentication API

Booking API

Payment API

Trip API

Ticket API

Notification API

Review API
```

---

# 15. Local Storage

```text
JWT

Refresh Token

Cached User

Offline Booking

Search History

Settings
```

---

# 16. Offline Support

```text
Cached Routes

Cached Booking

Retry Queue

Offline Ticket
```

---

# 17. Dependency Injection

```text
Riverpod Provider

Repository Provider

Service Provider

UseCase Provider
```

---

# 18. Error Handling

```text
Network Error

Timeout

Unauthorized

Validation Error

Business Error

Unknown Error
```

---

# 19. Security

```text
HTTPS

JWT

Secure Storage

Certificate Pinning

Biometric Login (Future)
```

---

# 20. Performance

```text
Lazy Loading

Image Cache

Pagination

Background Fetch

Memory Optimization
```

---

# 21. UI Principles

```text
Responsive

Material Design 3

Dark Mode

Accessibility

Reusable Widgets
```

---

# 22. Testing Strategy

```text
Unit Test

Widget Test

Integration Test

Golden Test
```

---

# 23. Development Rules

```text
One Feature One Folder

Business Logic không nằm trong Widget

Không gọi API trực tiếp trong UI

Repository Pattern

UseCase Pattern
```

---

# 24. Acceptance Criteria

✓ Clean Architecture

✓ Feature First

✓ Riverpod

✓ GoRouter

✓ Offline Ready

✓ AI dễ sinh Flutter Code

---

# 25. Related Documents

Coding Standards

Project Structure

Frontend Architecture

Backend Architecture

API Development

UI Design System

---

# 26. Summary

Flutter Architecture định nghĩa kiến trúc chuẩn cho ứng dụng Mobile BusZ theo mô hình Clean Architecture kết hợp Feature First. Kiến trúc này phân tách rõ Presentation, Domain và Data Layer, sử dụng Riverpod để quản lý trạng thái, GoRouter để điều hướng và Dio để giao tiếp với Backend API. Thiết kế này giúp ứng dụng dễ mở rộng, dễ kiểm thử và tạo nền tảng vững chắc cho AI sinh mã nguồn Flutter chất lượng cao.