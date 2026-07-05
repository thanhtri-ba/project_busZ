# ADR-006 Redis Decision

Project

BusZ

Module

Architecture Decision Record

Document ID

ADR-006

Status

Accepted

---

# 1. Context

BusZ cần

- Cache
- Session
- Queue
- OTP
- Rate Limiting

---

# 2. Decision

Redis

---

# 3. Why

- Fast
- In-memory
- Distributed
- Pub/Sub
- Cache

---

# 4. Use Cases

- JWT Blacklist
- OTP
- Session Cache
- Booking Lock
- Seat Hold
- Rate Limiting

---

# 5. Benefits

- Performance
- Scalability
- Reliability

---

# 6. Related ADR

ADR-004 JWT

ADR-007 Docker

ADR-008 Prisma