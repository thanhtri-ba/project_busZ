# Frontend Architecture

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-004

Priority

Critical

Version

1.0

---

# 1. Purpose

Frontend Architecture định nghĩa kiến trúc chuẩn cho toàn bộ ứng dụng Frontend của BusZ bao gồm Passenger Website, Admin Portal và Operator Portal nhằm đảm bảo tính mở rộng, dễ bảo trì và trải nghiệm người dùng nhất quán.

Mục tiêu

- Chuẩn hóa Frontend
- Tách biệt Business Logic
- Hỗ trợ Component Reuse
- Hỗ trợ Responsive UI
- Hỗ trợ AI Code Generation

---

# 2. Technology Stack

Framework

```text
React 19

TypeScript

Vite
```

UI

```text
Material UI

TailwindCSS
```

State Management

```text
Redux Toolkit

React Query
```

Routing

```text
React Router
```

API

```text
Axios
```

Validation

```text
Zod

React Hook Form
```

---

# 3. Architecture Style

```text
Presentation

↓

Feature

↓

Service

↓

API

↓

Backend
```

---

# 4. Project Structure

```text
src/

api/

assets/

components/

config/

constants/

contexts/

features/

hooks/

layouts/

pages/

routes/

services/

stores/

styles/

types/

utils/
```

---

# 5. Feature Structure

```text
authentication/

booking/

payment/

ticket/

trip/

profile/

notification/

review/

dashboard/
```

---

# 6. Component Structure

```text
components/

common/

layout/

forms/

tables/

dialogs/

charts/

maps/
```

---

# 7. Page Structure

```text
pages/

Home

Search

Trip Detail

Booking

Payment

Profile

History

Login

Register
```

---

# 8. Layout Structure

```text
Main Layout

Admin Layout

Operator Layout

Auth Layout

Error Layout
```

---

# 9. Routing

```text
Public Routes

Protected Routes

Admin Routes

Operator Routes

404 Page
```

---

# 10. State Management

Global

```text
Authentication

User

Theme

Language

Notification
```

Feature

```text
Booking

Payment

Trip

Profile
```

---

# 11. API Layer

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

# 12. Services

```text
Authentication Service

Booking Service

Payment Service

Trip Service

User Service
```

---

# 13. UI Principles

```text
Responsive

Reusable

Accessible

Consistent

Fast
```

---

# 14. Form Handling

```text
React Hook Form

Zod Validation

Error Message

Loading State
```

---

# 15. Error Handling

```text
404 Page

500 Page

Network Error

Permission Error

Validation Error
```

---

# 16. Authentication

```text
JWT

Refresh Token

Protected Routes

Role-based UI
```

---

# 17. Performance

```text
Lazy Loading

Code Splitting

Memoization

Image Optimization

Caching
```

---

# 18. Security

```text
HTTPS

JWT

XSS Protection

CSRF Protection

Input Sanitization
```

---

# 19. Accessibility

```text
Keyboard Navigation

ARIA Labels

Contrast

Screen Reader Support
```

---

# 20. Responsive Breakpoints

```text
Mobile

Tablet

Laptop

Desktop

Ultra-wide
```

---

# 21. Development Rules

```text
One Component One Responsibility

No Business Logic in UI

Custom Hooks

Reusable Components

Shared Constants
```

---

# 22. Folder Dependency

```text
Page

↓

Feature

↓

Service

↓

API

↓

Backend
```

---

# 23. Acceptance Criteria

✓ Feature-Based Structure

✓ Responsive UI

✓ Component Reuse

✓ State Management rõ ràng

✓ API Layer độc lập

✓ AI dễ sinh Frontend

---

# 24. Related Documents

Project Structure

Coding Standards

Flutter Architecture

API Development

Backend Architecture

UI Design System

---

# 25. Summary

Frontend Architecture định nghĩa kiến trúc chuẩn cho Passenger Website, Admin Portal và Operator Portal của BusZ theo Feature-Based Architecture. Kiến trúc này giúp giao diện dễ mở rộng, dễ bảo trì, tái sử dụng Component cao và hỗ trợ AI sinh mã nguồn React/TypeScript theo cùng một tiêu chuẩn thống nhất.