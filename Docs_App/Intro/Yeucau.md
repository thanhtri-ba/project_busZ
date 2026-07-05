Before writing any code, stop and understand the project first.

## Step 1 - Read Documentation

Read these files in the following order:

1. Docs_App/AI_INSTRUCTIONS.md
2. Docs_App/implementation_plan.md
3. Docs_App/BUSZ_Authentication_Onboarding_Implementation_Plan_v1.1.md
4. Docs_App/BUSZ_AUTH_UI_REQUIREMENTS_FROM_SCREENSHOTS.md

Do not start coding until all documents have been read and understood.

--------------------------------------------------

## Step 2 - Read UI Mockups

Open every image inside:

Docs_App/busz_mockups/

These screenshots are the OFFICIAL UI DESIGN.

Treat them as the SINGLE SOURCE OF TRUTH.

Do NOT redesign the interface.

Do NOT simplify the layout.

Do NOT change colors.

Do NOT change spacing.

Do NOT change typography.

Do NOT replace components.

The final Flutter UI should match the screenshots as closely as possible (pixel-perfect).

--------------------------------------------------

## Step 3 - Project Scope

Implement ONLY the following module:

✔ Splash
✔ Intro / Onboarding
✔ Authentication
✔ Country Code Picker
✔ Email Verification OTP
✔ Phone Verification OTP
✔ Login Password
✔ Forgot Password
✔ Set Password
✔ Set New Password

Do NOT implement:

✘ Home business logic
✘ Bus Search
✘ Booking
✘ Payment
✘ Ticket
✘ Wallet
✘ Notification
✘ Profile
✘ Other BUSZ features

If Home is required after login, create only a simple placeholder screen.

--------------------------------------------------

## Step 4 - Architecture

Follow the architecture described in the implementation plan.

Business logic must NOT exist inside Widgets.

Create:

- models
- services
- shared
- screens

Authentication logic must go inside auth_service.dart.

Local storage must go inside pref_helper.dart.

UI must remain clean and reusable.

--------------------------------------------------

## Step 5 - Backend Integration

Do NOT hard-code login.

Prepare frontend for real backend integration.

Use REST API architecture.

Required APIs:

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
GET /auth/me
POST /auth/logout

If backend is unavailable, create service methods only.

Do NOT fake authentication inside UI.

--------------------------------------------------

## Step 6 - Local Storage

Use shared_preferences.

Store:

- onboarding_seen
- access_token
- refresh_token

--------------------------------------------------

## Step 7 - UI Requirements

The UI must follow every screenshot.

Pay attention to:

- spacing
- padding
- margin
- typography
- colors
- border radius
- shadows
- icon size
- text style
- button size
- input style
- OTP boxes
- onboarding animation
- splash animation

Match the screenshots as closely as possible.

--------------------------------------------------

## Step 8 - Before Every Screen

Before implementing a screen:

1. Find the corresponding screenshot.
2. Analyze the layout.
3. Build the Flutter widget tree based on the screenshot.
4. Keep reusable widgets reusable.

--------------------------------------------------

## Step 9 - Code Quality

Write production-ready code.

Use:

- Clean Architecture
- Reusable Widgets
- Null Safety
- Responsive Layout
- Proper Folder Structure

Avoid duplicate code.

--------------------------------------------------

## Step 10 - Important

Never redesign the UI.

Never ignore the mockups.

Never invent new layouts.

If documentation and screenshots conflict, ALWAYS follow the screenshots.

Do not begin implementing Booking, Payment, Ticket, or any other BUSZ module until Authentication & Onboarding are fully completed.