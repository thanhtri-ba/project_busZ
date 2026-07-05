# BusZ Database Requirements

## 1. Tổng quan database
Database dùng để quản lý người dùng, nhà xe, tuyến đường, chuyến xe, ghế, đặt vé, thanh toán, hủy vé và hoàn tiền.

## 2. Danh sách bảng chính

### users
Lưu thông tin tài khoản người dùng.

Trường dữ liệu:
- id
- full_name
- email
- phone
- password_hash
- avatar_url
- role
- status
- created_at
- updated_at

### contacts
Lưu thông tin liên hệ đặt vé.

Trường dữ liệu:
- id
- user_id
- full_name
- email
- phone
- created_at

### passengers
Lưu thông tin hành khách.

Trường dữ liệu:
- id
- user_id
- full_name
- gender
- date_of_birth
- id_card_number
- phone
- created_at

### bus_companies
Lưu thông tin nhà xe.

Trường dữ liệu:
- id
- name
- logo_url
- description
- rating
- review_count
- status
- created_at

### buses
Lưu thông tin xe.

Trường dữ liệu:
- id
- company_id
- bus_name
- license_plate
- bus_type
- total_seats
- facilities
- status

### seats
Lưu danh sách ghế trên xe.

Trường dữ liệu:
- id
- bus_id
- seat_code
- seat_type
- floor
- status

### locations
Lưu điểm đi, điểm đến, bến xe.

Trường dữ liệu:
- id
- name
- address
- province
- latitude
- longitude
- type

### routes
Lưu tuyến đường.

Trường dữ liệu:
- id
- from_location_id
- to_location_id
- distance_km
- estimated_duration
- status

### trips
Lưu chuyến xe cụ thể.

Trường dữ liệu:
- id
- route_id
- bus_id
- company_id
- departure_time
- arrival_time
- base_price
- reward_points
- status

### trip_prices
Lưu giá theo ngày.

Trường dữ liệu:
- id
- trip_id
- date
- price
- available_seats

### bookings
Lưu đơn đặt vé.

Trường dữ liệu:
- id
- user_id
- contact_id
- booking_code
- trip_type
- total_amount
- tax_amount
- discount_amount
- final_amount
- status
- created_at

### booking_items
Lưu từng vé trong booking.

Trường dữ liệu:
- id
- booking_id
- trip_id
- passenger_id
- seat_id
- seat_code
- price
- direction
- status

### payments
Lưu thanh toán.

Trường dữ liệu:
- id
- booking_id
- payment_method
- amount
- transaction_code
- payment_status
- paid_at

### cancellations
Lưu yêu cầu hủy vé.

Trường dữ liệu:
- id
- booking_id
- reason
- cancellation_fee
- refund_amount
- status
- created_at

### refunds
Lưu hoàn tiền.

Trường dữ liệu:
- id
- payment_id
- booking_id
- refund_amount
- refund_status
- refunded_at

### reviews
Lưu đánh giá nhà xe.

Trường dữ liệu:
- id
- user_id
- company_id
- booking_id
- rating
- comment
- created_at

## 3. Quan hệ chính
- users 1-n bookings
- users 1-n contacts
- users 1-n passengers
- bus_companies 1-n buses
- bus_companies 1-n trips
- buses 1-n seats
- routes 1-n trips
- trips 1-n booking_items
- bookings 1-n booking_items
- bookings 1-1 payments
- bookings 1-1 cancellations