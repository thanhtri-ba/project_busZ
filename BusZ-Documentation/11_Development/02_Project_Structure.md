# Project Structure

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Development

Document ID

DEV-002

Priority

Critical

Version

1.0

---

# 1. Purpose

Project Structure định nghĩa cấu trúc thư mục chuẩn của toàn bộ dự án BusZ nhằm đảm bảo khả năng mở rộng, bảo trì và cộng tác hiệu quả.

Mục tiêu

- Chuẩn hóa cấu trúc Project
- Dễ tìm kiếm Source Code
- Dễ mở rộng
- Hỗ trợ CI/CD
- Hỗ trợ AI Code Generation

---

# 2. Repository Overview

```text
BusZ

├── apps
├── backend
├── packages
├── database
├── infrastructure
├── docs
├── scripts
├── tools
└── .github
```

---

# 3. Apps Directory

```text
apps/

├── mobile
├── passenger-web
├── admin-web
├── driver-app
└── operator-web
```

---

# 4. Flutter Structure

```text
mobile/

lib/

assets/

test/

integration_test/

android/

ios/

web/
```

---

# 5. Flutter lib Structure

```text
lib/

core/

config/

features/

shared/

services/

widgets/

routes/

main.dart
```

---

# 6. Feature Structure

```text
features/

authentication/

booking/

payment/

ticket/

trip/

profile/

notification/

review/
```

---

# 7. React Structure

```text
src/

api/

components/

pages/

layouts/

hooks/

contexts/

routes/

services/

utils/

styles/
```

---

# 8. Backend Structure

```text
backend/

src/

controllers/

services/

repositories/

middlewares/

routes/

validators/

config/

utils/

jobs/

events/

prisma/

tests/
```

---

# 9. Controller Layer

```text
auth.controller.ts

booking.controller.ts

trip.controller.ts

payment.controller.ts

ticket.controller.ts
```

---

# 10. Service Layer

```text
auth.service.ts

booking.service.ts

payment.service.ts

trip.service.ts

ticket.service.ts
```

---

# 11. Repository Layer

```text
user.repository.ts

booking.repository.ts

payment.repository.ts

ticket.repository.ts

trip.repository.ts
```

---

# 12. Database Structure

```text
database/

schema/

migrations/

seed/

erd/

dictionary/

backup/
```

---

# 13. Documentation Structure

```text
docs/

01_Requirements/

02_Design/

03_Database/

04_API/

05_AI/

06_UI/

07_Testing/

08_Deployment/

09_Diagrams/

10_Development/
```

---

# 14. Infrastructure Structure

```text
infrastructure/

docker/

kubernetes/

nginx/

terraform/

monitoring/

logging/
```

---

# 15. Shared Packages

```text
packages/

shared-types/

shared-ui/

shared-utils/

shared-config/
```

---

# 16. Configuration Files

```text
.env

.env.development

.env.staging

.env.production
```

---

# 17. Scripts

```text
scripts/

build.sh

deploy.sh

backup.sh

restore.sh

seed.sh

generate-docs.sh
```

---

# 18. GitHub Structure

```text
.github/

workflows/

ISSUE_TEMPLATE/

PULL_REQUEST_TEMPLATE/

CODEOWNERS
```

---

# 19. Naming Rules

Folder

```text
kebab-case
```

File

```text
snake_case
```

Class

```text
PascalCase
```

Variable

```text
camelCase
```

Constant

```text
UPPER_SNAKE_CASE
```

---

# 20. Import Rules

```text
Core

↓

Shared

↓

Feature

↓

Local
```

Không được

```text
Circular Dependency

Deep Relative Import

Duplicate Module
```

---

# 21. Layer Dependency

```text
Presentation

↓

Application

↓

Domain

↓

Infrastructure

↓

Database
```

---

# 22. Scalability

Cho phép mở rộng

```text
New Features

New Modules

New Applications

Microservices

Shared Packages
```

---

# 23. Acceptance Criteria

✓ Folder Structure thống nhất

✓ Layer rõ ràng

✓ Không Circular Dependency

✓ Shared Packages độc lập

✓ Documentation đầy đủ

✓ AI dễ hiểu cấu trúc

---

# 24. Related Documents

Coding Standards

Backend Architecture

Frontend Architecture

Flutter Architecture

Database Guidelines

Git Workflow

---

# 25. Summary

Project Structure định nghĩa cấu trúc thư mục chuẩn của BusZ cho Mobile, Web, Backend, Database, Infrastructure và Documentation. Kiến trúc này giúp dự án dễ mở rộng, dễ bảo trì, hỗ trợ CI/CD và tạo điều kiện để AI cũng như các thành viên phát triển làm việc trên cùng một chuẩn cấu trúc.