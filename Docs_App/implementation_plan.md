# Master Implementation Plan: BUSZ Authentication & Onboarding (v1.1 + Strict UI)

# IMPORTANT

This task is NOT to design a new Authentication module.

The UI design has already been completed.

All screenshots inside:

Docs_App/busz_mockups/

are the FINAL APPROVED DESIGN.

They are the ONLY source of truth.

The implementation MUST follow those screenshots.

Do NOT redesign.

Do NOT improve the UI.

Do NOT simplify the UI.

Do NOT replace components.

Do NOT change spacing.

Do NOT change colors.

Do NOT change typography.

Do NOT change icons.

Do NOT change button style.

Implement the Flutter screens to match the screenshots as closely as possible..

## STRICT UI RULE

> [!IMPORTANT]
> **Before coding, read all mockups in [Docs_App/busz_mockups/](file:///c:/Users/phamt/StudioProjects/BusZ/Docs_App/busz_mockups/).**
> - The UI must match the provided screenshots exactly (colors, spacing, layout, fonts).
> - Do NOT redesign.
> - Do NOT create a new style.
> - Do NOT change the layout.
> - If documentation and screenshots conflict, ALWAYS follow the screenshots.

## Folder Structure

```text
lib/
  models/
    user_model.dart
  screens/
    splash/
      splash_screen.dart
    onboarding/
      onboarding_screen.dart
    auth/
      auth_screen.dart
      login_password_screen.dart
      country_code_screen.dart
    otp/
      otp_screen.dart
    password/
      set_password_screen.dart
      forgot_password_screen.dart
      set_new_password_screen.dart
  services/
    auth_service.dart
  shared/
    pref_helper.dart
```

## Architectural Modules

### 1. Persistent Storage (`shared_preferences`)
- Add `shared_preferences: ^2.2.0` dependency in `pubspec.yaml`.
- Create `pref_helper.dart` to persist:
  - `onboarding_seen` (bool)
  - `access_token` (string)
  - `refresh_token` (string)

### 2. Service Layer (`auth_service.dart`)
Implement HTTP integration logic using a clean API client interface for:
- `POST /auth/check-email`
- `POST /auth/send-email-otp`
- `POST /auth/verify-email-otp`
- `POST /auth/send-phone-otp`
- `POST /auth/verify-phone-otp`
- `POST /auth/register`
- `POST /auth/login`
- `POST /auth/forgot-password`
- `POST /auth/reset-password`
- `POST /auth/social-login`
- `GET /auth/me`
- `POST /auth/logout`

### 3. Screen Routes in `main.dart`
- `/`: Splash Screen (decides whether to direct to `/onboarding`, `/auth`, or `/home`)
- `/onboarding`: Walkthrough Carousel
- `/auth`: Unified Email/Phone and Social options
- `/country_code`: Searchable Dial Prefix picker
- `/otp`: 6-digit verification
- `/login_password`: Password entrance
- `/set_password`: Setup rules (checklist)
- `/forgot_password`: Reset request
- `/set_new_password`: Setup new password
- `/home`: Dashboard mockup

## Verification Plan

### Manual Verification
1. Run application on Chrome.
2. Verify onboarding is shown on first launch and skipped on second launch.
3. Verify Email existing vs. new user path.
4. Verify Phone Country Code selection and OTP entry.
5. Verify Password criteria checklist.
