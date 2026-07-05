# Sequence Diagram

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Diagrams

Document ID

DIA-004

Priority

Critical

Version

1.0

---

# 1. Purpose

Sequence Diagram mô tả trình tự tương tác giữa các thành phần trong hệ thống BusZ.

Mục tiêu

- Hiểu luồng nghiệp vụ
- Hỗ trợ Backend Development
- Hỗ trợ Frontend Development
- Hỗ trợ QA
- Hỗ trợ AI Code Generation

---

# 2. Covered Scenarios

```text
Authentication

Search Trip

Seat Hold

Booking

Payment

Ticket

Notification

Refund

Driver Check-in

Review
```

---

# 3. Login Sequence

```mermaid
sequenceDiagram

actor User

participant Mobile

participant API

participant Auth

participant DB

User->>Mobile: Login

Mobile->>API: POST /login

API->>Auth: Validate Credentials

Auth->>DB: Query User

DB-->>Auth: User Data

Auth-->>API: JWT

API-->>Mobile: Login Success

Mobile-->>User: Dashboard
```

---

# 4. Search Trip Sequence

```mermaid
sequenceDiagram

actor Passenger

participant App

participant API

participant TripService

participant DB

Passenger->>App: Search Trip

App->>API: GET /search

API->>TripService: Search

TripService->>DB: Query Trips

DB-->>TripService: Result

TripService-->>API: Trip List

API-->>App: JSON Response

App-->>Passenger: Show Trips
```

---

# 5. Seat Hold Sequence

```mermaid
sequenceDiagram

actor Passenger

participant App

participant API

participant SeatService

participant Redis

Passenger->>App: Select Seat

App->>API: Hold Seat

API->>SeatService: Validate

SeatService->>Redis: Lock Seat

Redis-->>SeatService: Success

SeatService-->>API: Seat Held

API-->>App: Countdown 10 Minutes
```

---

# 6. Booking Sequence

```mermaid
sequenceDiagram

actor Passenger

participant App

participant API

participant BookingService

participant DB

Passenger->>App: Confirm Booking

App->>API: POST Booking

API->>BookingService: Create

BookingService->>DB: Insert Booking

DB-->>BookingService: BookingID

BookingService-->>API: Booking Created

API-->>App: Booking Success
```

---

# 7. Payment Sequence

```mermaid
sequenceDiagram

actor Passenger

participant App

participant API

participant PaymentGateway

participant Booking

participant Ticket

Passenger->>App: Pay

App->>API: Create Payment

API->>PaymentGateway: Transaction

PaymentGateway-->>Passenger: Payment Page

Passenger->>PaymentGateway: Complete Payment

PaymentGateway->>API: Webhook

API->>Booking: Update Status

API->>Ticket: Generate Ticket

Ticket-->>Passenger: QR Ticket
```

---

# 8. Ticket Sequence

```mermaid
sequenceDiagram

participant Payment

participant Ticket

participant Database

participant Notification

Payment->>Ticket: Payment Success

Ticket->>Database: Save Ticket

Database-->>Ticket: TicketID

Ticket->>Notification: Send Ticket

Notification-->>User: Push Notification
```

---

# 9. Driver Check-in Sequence

```mermaid
sequenceDiagram

actor Driver

participant DriverApp

participant API

participant Ticket

participant Database

Driver->>DriverApp: Scan QR

DriverApp->>API: Validate QR

API->>Ticket: Check Ticket

Ticket->>Database: Validate

Database-->>Ticket: OK

Ticket-->>API: Check-in

API-->>DriverApp: Success
```

---

# 10. Refund Sequence

```mermaid
sequenceDiagram

actor Passenger

participant App

participant API

participant Payment

participant Database

Passenger->>App: Cancel Booking

App->>API: Refund Request

API->>Payment: Refund

Payment->>Database: Update Refund

Database-->>Payment: Success

Payment-->>API: Refund Complete

API-->>App: Success
```

---

# 11. Notification Sequence

```mermaid
sequenceDiagram

participant Booking

participant Notification

participant FCM

participant User

Booking->>Notification: Booking Success

Notification->>FCM: Push

FCM-->>User: Notification
```

---

# 12. Review Sequence

```mermaid
sequenceDiagram

actor Passenger

participant App

participant API

participant Review

participant Database

Passenger->>App: Submit Review

App->>API: POST Review

API->>Review: Save

Review->>Database: Insert

Database-->>Review: Success

Review-->>API: Published

API-->>App: Review Created
```

---

# 13. Admin Sequence

```mermaid
sequenceDiagram

actor Admin

participant Portal

participant API

participant Database

Admin->>Portal: Open Dashboard

Portal->>API: Dashboard Data

API->>Database: Query

Database-->>API: Statistics

API-->>Portal: Dashboard
```

---

# 14. Error Flow

```mermaid
sequenceDiagram

participant Client

participant API

participant Database

Client->>API: Request

API->>Database: Query

Database-->>API: Error

API-->>Client: Error Response
```

---

# 15. Timeout Flow

```mermaid
sequenceDiagram

participant User

participant API

participant Payment

User->>API: Pay

API->>Payment: Create

Payment--xAPI: Timeout

API-->>User: Retry Payment
```

---

# 16. Acceptance Criteria

✓ Authentication Sequence đầy đủ

✓ Booking Sequence đầy đủ

✓ Payment Sequence đầy đủ

✓ Ticket Sequence đầy đủ

✓ Refund Sequence đầy đủ

✓ Driver Check-in đầy đủ

✓ Mermaid Diagram hợp lệ

---

# 17. Related Documents

System Overview

Use Case Diagram

Activity Diagram

ER Diagram

Component Diagram

API Specification

Business Rules

---

# 18. Summary

Sequence Diagram mô tả chi tiết trình tự tương tác giữa người dùng, ứng dụng, Backend API, Database và các dịch vụ bên ngoài trong từng nghiệp vụ của BusZ. Các sơ đồ này giúp Developer, QA và AI hiểu rõ cách các thành phần phối hợp với nhau để xử lý các chức năng quan trọng như đăng nhập, tìm chuyến, đặt vé, thanh toán, phát hành vé, hoàn tiền và check-in.