# BusZ UI Redesign - Phase 2

## Status
Phase 2.1 is prepared: UI foundation + first authentication refactor.

## What changed

### Core UI foundation
- Added `lib/core/widgets/base/base_button.dart`
- Added `lib/core/widgets/base/base_card.dart`
- Added `lib/core/widgets/base/base_input.dart`
- Updated `lib/core/widgets/widgets.dart` exports

### Components
- Refactored `PrimaryButton` and `SecondaryButton` to use `BaseButton`
- Refactored `AppTextField`, `SearchField`, and `OtpField` to use shared input style
- Added real `PromoCard` implementation
- Refactored shared chips and loading indicator

### Theme cleanup
- Replaced deprecated `withOpacity` in `app_shadows.dart` with `withValues(alpha: ...)`

### First screen refactor
- Refactored `lib/screens/auth/auth_screen.dart` to use:
  - `BaseCard`
  - `PrimaryButton`
  - `SecondaryButton`
  - `AppTextField`

## Validation steps
Run in project root:

```bash
flutter clean
flutter pub get
flutter analyze
flutter run
```

Expected result:
- No missing URI error for `cards/promo_card.dart`
- Existing `info` / `warning` messages may remain and will be handled in later phases

## Suggested commit

```bash
git add .
git commit -m "feat(ui): add BusZ UI foundation components"
```
