# BUSZ Authentication UI Requirements (Based on Provided Mockups)

> **IMPORTANT**
>
> Các hình ảnh đính kèm là **thiết kế chính thức**. AI/Developer **KHÔNG
> được tự thiết kế lại giao diện**. Mọi khoảng cách, màu sắc, icon,
> font, button, input, illustration và bố cục phải bám sát các ảnh.

## Scope

Chỉ triển khai:

-   Splash
-   Intro / Onboarding
-   Authentication
-   Country Code
-   OTP
-   Login Password
-   Forgot Password
-   Set Password
-   Set New Password

Không triển khai: - Booking - Search Bus - Payment - Ticket - Profile -
Home (chỉ tạo màn hình placeholder sau khi login thành công)

## Mockup Screens

## Screen 1

![Screen 1](busz_mockups/screen_1.png) Splash Screen - Hiển thị logo
BUSZ, tự động chuyển sau 2--3 giây.

## Screen 2

![Screen 2](busz_mockups/screen_2.png) Onboarding Slide 1 - UI phải
giống ảnh, giữ nguyên bố cục, illustration, màu sắc, nút Next/Get
Started.

## Screen 3

![Screen 3](busz_mockups/screen_3.png) Onboarding Slide 2 - UI phải
giống ảnh, giữ nguyên bố cục, illustration, màu sắc, nút Next/Get
Started.

## Screen 4

![Screen 4](busz_mockups/screen_4.png) Onboarding Slide 3 - UI phải
giống ảnh, giữ nguyên bố cục, illustration, màu sắc, nút Next/Get
Started.

## Screen 5

![Screen 5](busz_mockups/screen_5.png) Authentication - Nhập Email hoặc
chọn Phone/Social Login.

## Screen 6

![Screen 6](busz_mockups/screen_6.png) Country Code Picker.

## Screen 7

![Screen 7](busz_mockups/screen_7.png) OTP Verification.

## Screen 8

![Screen 8](busz_mockups/screen_8.png) OTP Verification.

## Screen 9

![Screen 9](busz_mockups/screen_9.png) Set Password.

## Screen 10

![Screen 10](busz_mockups/screen_10.png) Login Password.

## Screen 11

![Screen 11](busz_mockups/screen_11.png) Forgot Password.

## Screen 12

![Screen 12](busz_mockups/screen_12.png) Set New Password.

## Screen 13

![Screen 13](busz_mockups/screen_13.png) Thực hiện đúng UI theo ảnh.

## Screen 14

![Screen 14](busz_mockups/screen_14.png) Thực hiện đúng UI theo ảnh.

## Screen 15

![Screen 15](busz_mockups/screen_15.png) Thực hiện đúng UI theo ảnh.

## Backend Requirements

Frontend phải tích hợp REST API, không hard-code logic.

API:

-   POST /auth/check-email
-   POST /auth/send-email-otp
-   POST /auth/verify-email-otp
-   POST /auth/send-phone-otp
-   POST /auth/verify-phone-otp
-   POST /auth/register
-   POST /auth/login
-   POST /auth/forgot-password
-   POST /auth/reset-password
-   POST /auth/social-login
-   GET /auth/me
-   POST /auth/logout

## Database

users - id - email - phone - password_hash - provider -
is_email_verified - is_phone_verified

otp_codes - id - user_id - otp - type - expires_at - is_used

## Local Storage

shared_preferences

-   onboarding_seen
-   access_token
-   refresh_token

## Acceptance

-   UI giống ảnh gần như pixel-perfect.
-   Không tự thay đổi bố cục.
-   Luồng đúng theo mockup.
-   Code sẵn sàng tích hợp backend thật.
