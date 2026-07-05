# Project Structure

> Repository structure and documentation organization for the BusZ Documentation project.

---

# 📖 Overview

BusZ Documentation được tổ chức theo mô hình **Domain-Oriented Documentation**.

Mỗi thư mục đại diện cho một **domain** hoặc **giai đoạn** trong Software Development Lifecycle (SDLC), giúp tài liệu dễ tìm kiếm, dễ mở rộng và thuận tiện cho cả lập trình viên lẫn AI Coding Agent.

Repository này được thiết kế theo nguyên tắc:

- Documentation First
- Separation of Concerns
- Single Source of Truth
- Enterprise Documentation
- AI-Friendly Structure

---

# 🗂 Repository Structure

```text
BusZ-Documentation/

├── README.md
├── CHANGELOG.md
├── DOCUMENTATION_INDEX.md
├── PROJECT_STATE.md
├── PROJECT_STRUCTURE.md
├── ROADMAP.md
│
├── 00_Project/
├── 01_Business/
├── 02_UI/
├── 03_Database/
├── 04_Backend/
├── 05_API/
├── 06_Flutter/
├── 07_Admin/
├── 08_Testing/
├── 09_Deployment/
├── 10_Diagrams/
├── 11_Development/
├── 12_Research/
├── 13_Security/
├── 14_DevOps/
├── 15_Assets/
├── 16_AI_Analytics/
└── 17_ADR/
```

---

# 📂 Module Descriptions

## 00_Project

Purpose

Project-level documentation.

Contains

- README
- Changelog
- Documentation Index
- Project State
- Project Structure
- Roadmap

---

## 01_Business

Purpose

Business analysis and business requirements.

Contains

- Business Processes
- Functional Requirements
- Non-functional Requirements
- User Stories
- Business Rules

---

## 02_UI

Purpose

User Interface documentation.

Contains

- Mobile Screens
- Web Screens
- Admin Screens
- Booking Flow
- Payment Flow
- Authentication Flow

---

## 03_Database

Purpose

Database design.

Contains

- ERD
- Tables
- Relationships
- Constraints
- Indexes
- Naming Conventions

---

## 04_Backend

Purpose

Backend architecture.

Contains

- Clean Architecture
- Domain Layer
- Services
- Repositories
- Infrastructure

---

## 05_API

Purpose

REST API documentation.

Contains

- Authentication API
- Booking API
- Payment API
- Notification API
- Admin API
- API Guidelines

---

## 06_Flutter

Purpose

Flutter application architecture.

Contains

- Project Structure
- Navigation
- State Management
- Theme
- Offline Support

---

## 07_Admin

Purpose

Administration Portal.

Contains

- Dashboard
- User Management
- Fleet Management
- Analytics
- Reports

---

## 08_Testing

Purpose

Testing strategy.

Contains

- Unit Testing
- Integration Testing
- API Testing
- Security Testing
- Performance Testing

---

## 09_Deployment

Purpose

Deployment documentation.

Contains

- Docker
- Production
- CI/CD
- Infrastructure
- Backup

---

## 10_Diagrams

Purpose

Visual documentation.

Contains

- Architecture Diagram
- Sequence Diagram
- Activity Diagram
- ER Diagram
- Deployment Diagram

---

## 11_Development

Purpose

Development standards.

Contains

- Coding Standards
- Git Workflow
- Best Practices
- Naming Conventions
- Code Review

---

## 12_Research

Purpose

Research documents.

Contains

- Industry Analysis
- Competitor Analysis
- Payment Research
- GIS Research

---

## 13_Security

Purpose

Security architecture.

Contains

- Authentication
- Authorization
- Encryption
- JWT
- Rate Limiting

---

## 14_DevOps

Purpose

DevOps standards.

Contains

- Docker
- Environment
- Logging
- Monitoring
- Git Strategy

---

## 15_Assets

Purpose

Design System.

Contains

- Color Palette
- Typography
- Icons
- Illustrations

---

## 16_AI_Analytics

Purpose

Artificial Intelligence.

Contains

- Recommendation Engine
- Forecasting
- Fraud Detection
- Dynamic Pricing
- AI Assistant

---

## 17_ADR

Purpose

Architecture Decision Records.

Contains

- Technical Decisions
- Database Decisions
- Security Decisions
- Infrastructure Decisions

---

# 🔄 Documentation Relationships

```text
Business
        │
        ▼
UI
        │
        ▼
Database
        │
        ▼
Backend
        │
        ▼
API
        │
        ▼
Flutter
        │
        ▼
Testing
        │
        ▼
Deployment
```

---

# 📚 Dependency Matrix

| Module | Depends On |
|----------|------------|
| UI | Business |
| Database | Business |
| Backend | Database |
| API | Backend |
| Flutter | API |
| Admin | API |
| Testing | API + Business |
| Deployment | Backend |
| AI | Database + Backend |
| DevOps | Deployment |

---

# 🎯 Design Principles

Repository được xây dựng theo các nguyên tắc:

- High Cohesion
- Low Coupling
- Separation of Concerns
- Scalability
- Maintainability
- Reusability

---

# 🤖 AI-Friendly Structure

Repository được tổ chức để AI Coding Agent có thể:

- Hiểu nghiệp vụ
- Hiểu cơ sở dữ liệu
- Hiểu API
- Hiểu kiến trúc
- Sinh mã nguồn theo từng module
- Giảm mâu thuẫn giữa tài liệu và code

---

# 📈 Future Expansion

Các module có thể bổ sung:

```text
18_Operations
19_Architecture
20_Compliance
21_MLOps
22_Microservices
23_Observability
```

---

# 📌 Summary

BusZ Documentation được tổ chức theo kiến trúc phân lớp, trong đó mỗi module chịu trách nhiệm cho một lĩnh vực riêng biệt của hệ thống. Cấu trúc này giúp tài liệu dễ bảo trì, dễ mở rộng và tạo nền tảng vững chắc cho việc phát triển phần mềm cũng như sử dụng AI Coding Agent trong tương lai.