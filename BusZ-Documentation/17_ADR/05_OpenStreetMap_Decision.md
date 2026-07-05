# ADR-005 OpenStreetMap Decision

Project

BusZ - Intercity Bus Ticket Booking Platform

Module

Architecture Decision Record

Document ID

ADR-005

Status

Accepted

Decision Date

2026-07-05

Version

1.0

---

# 1. Context

BusZ cần hệ thống bản đồ để:

- Search Routes
- Bus Stations
- ETA
- GPS Tracking
- Driver Navigation

---

# 2. Problem Statement

Lựa chọn nền tảng bản đồ.

---

# 3. Considered Options

OpenStreetMap

Google Maps

Mapbox

Here Maps

---

# 4. Evaluation

| Provider | Free | GIS | Offline | Cost |
|-----------|:----:|:---:|:-------:|:----:|
| OpenStreetMap | ✅ | ⭐⭐⭐⭐⭐ | ✅ | Free |
| Google Maps | ❌ | ⭐⭐⭐⭐⭐ | ❌ | Paid |
| Mapbox | ⚠️ | ⭐⭐⭐⭐⭐ | ✅ | Paid |
| Here | ⚠️ | ⭐⭐⭐⭐ | ✅ | Paid |

---

# 5. Decision

BusZ sử dụng

OpenStreetMap

PostGIS

OSRM

Nominatim

---

# 6. Rationale

- Open Source
- Không mất phí
- Hỗ trợ Routing
- Hỗ trợ AI
- Dễ mở rộng

---

# 7. Consequences

Ưu điểm

- Free
- Full GIS
- Community Driven

Nhược điểm

- Không có Traffic mặc định
- Cần tự triển khai một số dịch vụ

---

# 8. Related ADR

ADR-001 PostgreSQL

ADR-009 AI

---

# 9. Review

Review khi:

- Chi phí thay đổi
- Nhu cầu Traffic thời gian thực