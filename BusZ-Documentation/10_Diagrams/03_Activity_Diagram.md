# Activity Diagram

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Diagrams

Document ID

DIA-003

Priority

Critical

Version

1.0

---

# 1. Purpose

Activity Diagram mô tả luồng hoạt động của các nghiệp vụ chính trong hệ thống BusZ từ khi người dùng thao tác đến khi hoàn thành nghiệp vụ.

Mục tiêu

- Mô tả Business Workflow
- Hỗ trợ Developer
- Hỗ trợ QA
- Hỗ trợ Business Analyst
- Hỗ trợ AI Code Generation

---

# 2. Activity Overview

Bao gồm

```text
Authentication

Booking

Payment

Ticket

Check-in

Refund

Review
```

---

# 3. Booking Activity

```mermaid
flowchart TD

Start([Start])

Search[Search Trip]

SelectTrip[Select Trip]

SelectSeat[Select Seat]

PassengerInfo[Passenger Information]

CreateBooking[Create Booking]

Payment[Payment]

Ticket[Generate Ticket]

Finish([Finish])

Start --> Search

Search --> SelectTrip

SelectTrip --> SelectSeat

SelectSeat --> PassengerInfo

PassengerInfo --> CreateBooking

CreateBooking --> Payment

Payment --> Ticket

Ticket --> Finish
```

---

# 4. Payment Activity

```mermaid
flowchart TD

Start([Start])

CreatePayment[Create Payment]

Redirect[Redirect Gateway]

CustomerPay[Customer Payment]

Verify[Verify Webhook]

Success{Payment Success?}

Ticket[Generate Ticket]

Failed[Booking Pending]

Finish([Finish])

Start --> CreatePayment

CreatePayment --> Redirect

Redirect --> CustomerPay

CustomerPay --> Verify

Verify --> Success

Success -->|Yes| Ticket

Success -->|No| Failed

Ticket --> Finish

Failed --> Finish
```

---

# 5. Login Activity

```mermaid
flowchart TD

Start([Start])

EnterAccount[Enter Email]

EnterPassword[Enter Password]

Validate[Validate Credentials]

Success{Valid?}

Dashboard[Open Dashboard]

Error[Show Error]

Finish([Finish])

Start --> EnterAccount

EnterAccount --> EnterPassword

EnterPassword --> Validate

Validate --> Success

Success -->|Yes| Dashboard

Success -->|No| Error

Dashboard --> Finish

Error --> Finish
```

---

# 6. Ticket Activity

```mermaid
flowchart TD

Start([Start])

PaymentSuccess[Payment Success]

GenerateQR[Generate QR]

StoreTicket[Store Ticket]

SendNotification[Send Notification]

Finish([Finish])

Start --> PaymentSuccess

PaymentSuccess --> GenerateQR

GenerateQR --> StoreTicket

StoreTicket --> SendNotification

SendNotification --> Finish
```

---

# 7. Driver Check-in Activity

```mermaid
flowchart TD

Start([Start])

ScanQR[Scan QR]

ValidateTicket[Validate Ticket]

Valid{Valid?}

Checkin[Check-in]

Reject[Reject Passenger]

Finish([Finish])

Start --> ScanQR

ScanQR --> ValidateTicket

ValidateTicket --> Valid

Valid -->|Yes| Checkin

Valid -->|No| Reject

Checkin --> Finish

Reject --> Finish
```

---

# 8. Refund Activity

```mermaid
flowchart TD

Start([Start])

CancelBooking[Cancel Booking]

Policy[Check Refund Policy]

Approved{Refund Allowed?}

CreateRefund[Create Refund]

RejectRefund[Reject]

Finish([Finish])

Start --> CancelBooking

CancelBooking --> Policy

Policy --> Approved

Approved -->|Yes| CreateRefund

Approved -->|No| RejectRefund

CreateRefund --> Finish

RejectRefund --> Finish
```

---

# 9. Review Activity

```mermaid
flowchart TD

Start([Start])

CompletedTrip[Completed Trip]

WriteReview[Write Review]

Submit[Submit]

Publish[Publish Review]

Finish([Finish])

Start --> CompletedTrip

CompletedTrip --> WriteReview

WriteReview --> Submit

Submit --> Publish

Publish --> Finish
```

---

# 10. Notification Activity

```mermaid
flowchart TD

Start([Start])

BusinessEvent[Business Event]

CreateNotification[Create Notification]

Push[Push Notification]

Email[Email]

SMS[SMS]

Finish([Finish])

Start --> BusinessEvent

BusinessEvent --> CreateNotification

CreateNotification --> Push

CreateNotification --> Email

CreateNotification --> SMS

Push --> Finish

Email --> Finish

SMS --> Finish
```

---

# 11. Admin Activity

```mermaid
flowchart TD

Start([Start])

Login[Login]

Dashboard[Dashboard]

CRUD[Manage Data]

Reports[View Reports]

Logout[Logout]

Finish([Finish])

Start --> Login

Login --> Dashboard

Dashboard --> CRUD

CRUD --> Reports

Reports --> Logout

Logout --> Finish
```

---

# 12. Activity Summary

Các Activity Diagram bao phủ

```text
Authentication

Booking

Payment

Ticket

Check-in

Refund

Notification

Review

Administration
```

---

# 13. Acceptance Criteria

✓ Luồng Booking đầy đủ

✓ Luồng Payment đầy đủ

✓ Luồng Ticket đầy đủ

✓ Luồng Check-in đầy đủ

✓ Luồng Refund đầy đủ

✓ Luồng Notification đầy đủ

✓ Có Mermaid Diagram

---

# 14. Related Documents

Use Case Diagram

Sequence Diagram

State Diagram

Business Rules

API Specification

---

# 15. Summary

Activity Diagram mô tả các quy trình nghiệp vụ chính của BusZ theo trình tự hoạt động từ khi bắt đầu đến khi hoàn thành. Các sơ đồ này giúp Developer, QA và AI hiểu rõ luồng xử lý nghiệp vụ, hỗ trợ triển khai và kiểm thử hệ thống một cách chính xác.