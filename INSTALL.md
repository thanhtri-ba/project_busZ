# Installation Guide

Follow these steps to set up the project on your local machine for development and testing.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Ensure you are on the `stable` channel)
- Dart SDK (comes with Flutter)
- A suitable IDE (e.g., [VS Code](https://code.visualstudio.com/), [Android Studio](https://developer.android.com/studio))
- Android Emulator or iOS Simulator (or a physical device)

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone <your-repository-url>
   ```

2. **Navigate to the project directory:**
   ```bash
   cd project_busZ
   ```

3. **Install dependencies:**
   Fetch all required packages by running:
   ```bash
   flutter pub get
   ```

4. **Code Generation (if applicable):**
   If the project uses `build_runner` for code generation (e.g., for Freezed, JSON Serializable), run:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## Running the App

To run the application on your connected device or emulator:
```bash
flutter run
```

## Running Tests

To run the unit and widget tests:
```bash
flutter test
```

## Building for Production

### Android (APK / App Bundle)
```bash
flutter build apk --release
# OR
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```
