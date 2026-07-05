# BUSZ Authentication & Onboarding

## Revised Implementation Plan (BA + Functional Requirements)

> Version: 1.1\
> Status: Ready for Development

------------------------------------------------------------------------

# 1. Objective

Implement a complete Authentication and Onboarding module for BUSZ
following the approved BA requirements and UI mockups.

------------------------------------------------------------------------

# 2. Navigation Flow

``` text
Splash (2–3 seconds)
│
├── If first launch
│     └── Onboarding (3 Slides)
│            └── Get Started
│                   └── Authentication
│
└── Otherwise
      ├── User logged in
      │      └── Home
      │
      └── User not logged in
             └── Authentication
```

## Authentication

``` text
Authentication
│
├── Email
│      ├── New Email
│      │      ├── Send OTP
│      │      ├── Verify OTP
│      │      ├── Set Password
│      │      └── Home
│      │
│      └── Existing Email
│             ├── Enter Password
│             ├── Forgot Password
│             │      ├── Enter Email
│             │      ├── Send Reset OTP
│             │      ├── Verify OTP
│             │      ├── Set New Password
│             │      └── Login
│             │
│             └── Home
│
├── Phone
│      ├── Country Code
│      ├── Send OTP
│      ├── Verify OTP
│      └── Home
│
└── Social Login
       ├── Google
       ├── Apple
       ├── Facebook
       └── Home
```

------------------------------------------------------------------------

# 3. Required Screens

  Screen             Status
  ------------------ ----------
  Splash             Modify
  Onboarding         Modify
  Authentication     New
  Country Code       New
  OTP Verification   New
  Set Password       New
  Login Password     New
  Forgot Password    New
  Set New Password   New
  Home               Existing

------------------------------------------------------------------------

# 4. Functional Requirements

## Splash

-   Display BUSZ logo.
-   Auto redirect after 2--3 seconds.
-   Check onboarding status.
-   Check login token.

## Onboarding

-   Three slides.
-   Page indicator.
-   Next button.
-   Skip button.
-   Get Started button.
-   Save onboarding status.

## Authentication

Support: - Email - Phone Number - Google - Apple - Facebook

### Email Flow

-   Validate email format.
-   Check whether account exists.
-   Existing account → Password screen.
-   New account → Email OTP.

### Phone Flow

-   Select country code.
-   Validate phone number.
-   Send OTP.

------------------------------------------------------------------------

# 5. OTP Requirements

-   6-digit code.
-   Auto focus.
-   Numeric keyboard.
-   Auto submit when complete (optional).
-   Countdown timer.
-   Resend OTP.
-   Change email.
-   Change phone number.
-   Get Help.
-   Invalid OTP error.
-   Expired OTP error.

------------------------------------------------------------------------

# 6. Password Requirements

Rules: - Minimum 8 characters. - At least 1 uppercase letter. - At least
1 number. - At least 1 special character.

Features: - Show / Hide password. - Live validation checklist. - Confirm
password must match. - Disable button until valid.

------------------------------------------------------------------------

# 7. Forgot Password

Flow

``` text
Forgot Password
↓
Enter Email
↓
Send Reset OTP
↓
Verify OTP
↓
Set New Password
↓
Login
```

------------------------------------------------------------------------

# 8. Validation Rules

  Field              Validation
  ------------------ ----------------------------------------
  Email              Required + Valid Format
  Phone              Required + Numbers Only
  OTP                Exactly 6 digits
  Password           8 chars + Uppercase + Number + Special
  Confirm Password   Must match Password

------------------------------------------------------------------------

# 9. Error Handling

Authentication - Invalid email format - Email already exists - Email not
found - Wrong password

OTP - Invalid OTP - OTP expired - OTP resend limit reached

Password - Weak password - Password mismatch

Network - Internet unavailable - Server error - Timeout

------------------------------------------------------------------------

# 10. Remember User State

## Remember Intro

Store locally

``` text
onboarding_seen = true
```

If true: - Skip onboarding.

## Remember Login

Store: - JWT Access Token - Refresh Token

If token valid: - Open Home directly.

If expired: - Return Login.

------------------------------------------------------------------------

# 11. Logout

Requirements - Clear access token. - Clear refresh token. - Return Login
screen. - Keep onboarding_seen = true.

------------------------------------------------------------------------

# 12. Social Login

Supported

-   Google
-   Apple
-   Facebook

Flow

``` text
OAuth Login
↓
Check Existing User
↓
Create User if Needed
↓
Login
↓
Home
```

------------------------------------------------------------------------

# 13. Backend APIs

``` http
POST /auth/check-email
POST /auth/send-email-otp
POST /auth/verify-email-otp

POST /auth/send-phone-otp
POST /auth/verify-phone-otp

POST /auth/register
POST /auth/login

POST /auth/forgot-password
POST /auth/reset-password

POST /auth/social-login

GET  /auth/me
POST /auth/logout
```

------------------------------------------------------------------------

# 14. Route Registration

``` dart
/auth
/country_code
/otp
/set_password
/login_password
/forgot_password
/set_new_password
/home
```

------------------------------------------------------------------------

# 15. Manual Verification Checklist

## Splash

-   Splash shown for 2--3 seconds.
-   Redirect works.

## Onboarding

-   Next.
-   Skip.
-   Get Started.
-   Not shown after first launch.

## Email

-   New email.
-   Existing email.
-   Invalid email.

## Phone

-   Search country.
-   Select code.
-   Receive OTP.

## OTP

-   Correct OTP.
-   Wrong OTP.
-   Expired OTP.
-   Resend.

## Password

-   Strength validation.
-   Confirm password.

## Forgot Password

-   Reset successfully.

## Social Login

-   Google.
-   Apple.
-   Facebook.

## Session

-   Remember login.
-   Logout.
-   Reopen app.

------------------------------------------------------------------------

# 16. Acceptance Criteria

The feature is accepted when:

-   Splash works correctly.
-   Onboarding only appears on first launch.
-   Email registration works.
-   Phone registration works.
-   OTP verification works.
-   Password rules are enforced.
-   Forgot Password works.
-   Social Login works.
-   Login session is remembered.
-   Logout works.
-   Navigation matches BA flow.
