# BusZ Backend Flow Requirements

## 1. Kiến trúc backend đề xuất
- REST API hoặc GraphQL API
- Authentication bằng JWT
- Database: PostgreSQL / MySQL / Supabase
- Payment Gateway: Momo, ZaloPay, VNPay hoặc Stripe
- Map API: OpenStreetMap hoặc Google Maps

## 2. Module backend

### Auth Module
API:
- POST /auth/register
- POST /auth/login
- POST /auth/logout
- POST /auth/refresh-token
- POST /auth/forgot-password

Luồng:
1. User nhập email, phone, password.
2. Backend validate dữ liệu.
3. Hash password.
4. Lưu user.
5. Trả về access token.

### Search Trips Module
API:
- GET /trips/search

Input:
- from_location_id
- to_location_id
- departure_date
- return_date
- passengers

Luồng:
1. User chọn tuyến và ngày.
2. Backend tìm route.
3. Backend lấy trips theo route và ngày.
4. Tính số ghế còn trống.
5. Trả về danh sách chuyến xe.

### Trip Detail Module
API:
- GET /trips/{id}

Trả về:
- Thông tin nhà xe
- Tiện ích
- Ảnh gallery
- Lộ trình
- Chính sách
- Ghế trống
- Giá vé

### Seat Module
API:
- GET /trips/{id}/seats
- POST /seats/hold
- POST /seats/release

Luồng giữ ghế:
1. User chọn ghế.
2. Backend kiểm tra ghế còn trống.
3. Backend giữ ghế tạm thời trong 5-10 phút.
4. Nếu user không thanh toán, ghế tự động được mở lại.

### Booking Module
API:
- POST /bookings
- GET /bookings/{id}
- GET /users/me/bookings
- PATCH /bookings/{id}/cancel

Luồng tạo booking:
1. User chọn chuyến.
2. User chọn ghế.
3. User nhập liên hệ.
4. User nhập hành khách.
5. Backend tạo booking trạng thái PENDING.
6. Backend tạo booking_items.
7. Backend khóa ghế.
8. Trả về booking_id và tổng tiền.

### Payment Module
API:
- POST /payments/create
- POST /payments/callback
- GET /payments/{id}

Luồng thanh toán:
1. User bấm thanh toán.
2. Backend tạo payment transaction.
3. Chuyển user sang cổng thanh toán.
4. Cổng thanh toán callback về backend.
5. Nếu thành công:
   - booking = CONFIRMED
   - payment = PAID
   - seat = BOOKED
   - tạo vé điện tử
6. Nếu thất bại:
   - booking = FAILED
   - release ghế

### Ticket Module
API:
- GET /tickets/{booking_code}
- GET /users/me/tickets

Trả về:
- Mã vé
- QR Code
- Tên hành khách
- Ghế
- Tuyến
- Giờ đi
- Nhà xe
- Trạng thái

### Cancellation Module
API:
- POST /bookings/{id}/cancel
- GET /cancellation-policy/{trip_id}

Luồng hủy:
1. User yêu cầu hủy.
2. Backend kiểm tra chính sách.
3. Tính phí hủy.
4. Tạo cancellation request.
5. Nếu hợp lệ, cập nhật booking = CANCELLED.
6. Tạo refund nếu đã thanh toán.

### Refund Module
API:
- POST /refunds
- GET /refunds/{id}

Luồng:
1. Booking bị hủy.
2. Backend tính số tiền hoàn.
3. Gửi yêu cầu hoàn tiền đến payment gateway.
4. Cập nhật trạng thái refund.

### Admin Module
API:
- CRUD nhà xe
- CRUD xe
- CRUD tuyến
- CRUD chuyến
- CRUD giá vé
- CRUD khuyến mãi
- Xem doanh thu
- Xem booking

## 3. Trạng thái hệ thống

### Booking status
- PENDING
- CONFIRMED
- CANCELLED
- FAILED
- REFUNDED

### Payment status
- UNPAID
- PAID
- FAILED
- REFUNDED

### Seat status
- AVAILABLE
- HOLD
- BOOKED
- BLOCKED

## 4. API cần có

| Method | Endpoint | Chức năng |
|---|---|---|
| POST | /auth/register | Đăng ký |
| POST | /auth/login | Đăng nhập |
| GET | /locations | Lấy danh sách điểm |
| GET | /trips/search | Tìm chuyến |
| GET | /trips/{id} | Chi tiết chuyến |
| GET | /trips/{id}/seats | Danh sách ghế |
| POST | /bookings | Tạo booking |
| GET | /bookings/{id} | Chi tiết booking |
| POST | /payments/create | Tạo thanh toán |
| POST | /payments/callback | Callback thanh toán |
| GET | /tickets/{code} | Lấy vé |
| POST | /bookings/{id}/cancel | Hủy vé |