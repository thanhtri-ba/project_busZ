# ADR-010 Monolithic vs Microservices

Project

BusZ

Document ID

ADR-010

---

# Context

BusZ giai đoạn đầu chưa cần Microservices.

---

# Options

Monolith

Microservices

---

# Decision

Modular Monolith

---

# Why

- Easier Development
- Faster Delivery
- Lower Cost
- Easier Deployment

---

# Future

When:

- >1M Users
- >20 Developers
- Independent Scaling

Then migrate gradually to Microservices.

---

# Related ADR

ADR-002 NestJS

ADR-006 Redis

ADR-007 Docker