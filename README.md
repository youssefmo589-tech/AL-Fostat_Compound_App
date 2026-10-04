# AL-Fostat Compound App

AL-Fostat is a Flutter application for residents of the AL-Fostat compound. It provides account
access, resident profile details, and community areas for viewing and managing achievements and
complaints. The app uses Firebase Authentication and Cloud Firestore for account and application
data.

**Repository:
** [AL-Fostat_Compound_App](https://github.com/youssefmo589-tech/AL-Fostat_Compound_App)  
**Developer:** Youssef Mohamed  
**GitHub:** [youssefmo589-tech](https://github.com/youssefmo589-tech)

## Features

- First-run onboarding, followed by sign-in or the signed-in app, based on local onboarding state
  and Firebase Authentication state.
- Resident registration and profile fields for name, email, phone, building, apartment, and owner or
  tenant status.
- Email and password registration and sign-in, Google sign-in, email verification, and password
  reset.
- Home, population, and profile areas in a bottom navigation layout.
- Achievement and complaint lists with create, view, edit, and delete flows backed by Firestore.
- Profile editing, sign-out, and account deletion flows.
- English and Arabic localization, with the selected language stored locally.
- Light and dark themes, with the selected theme stored locally.
- Firebase Cloud Messaging permission request, subscription to the `all_users` topic, and FCM token
  retrieval/storage in resident records in the implemented sign-in flows.
- Achievement and complaint creation can call a configured HTTP notification endpoint. Delivery
  depends on that external endpoint.

## Technologies and packages

- Flutter and Dart (Dart SDK constraint: `^3.12.2`)
- Firebase Core, Firebase Authentication, Cloud Firestore, and Firebase Cloud Messaging
- Provider for app-wide settings state
- Shared Preferences for onboarding, language, and theme preferences
- Flutter localization tooling and `intl`
- Google Sign-In
- `http` for the notification request
- `flutter_svg`, `lottie`, `skeletonizer`, `flutter_easyloading`, and `bot_toast` for UI assets,
  loading states, and feedback
- `animated_custom_dropdown`, `flutter_switch`, and `flutter_bounceable` for interface controls

## Authentication

Firebase Authentication handles email/password and Google credentials. Email/password sign-up sends
a verification email; the app includes a verification screen. A password reset screen requests
Firebase's password reset email. The registration flow gathers resident and apartment details and
writes a corresponding profile to Firestore. The sign-in flows also retrieve an FCM token and
attempt to save it to that profile.

## Firebase and data

Firebase is initialized using the platform options in `lib/firebase_options.dart`. Android and iOS
Firebase configuration files are also present in the repository.

The Firestore service layer uses typed converters and these collections:

| Collection       | Purpose                                                                                  |
|------------------|------------------------------------------------------------------------------------------|
| `UserCollection` | Resident profile fields, including building/apartment identifiers and an FCM token field |
| `Achievements`   | Achievement records, with live collection snapshots and create/update/delete operations  |
| `Complaints`     | Complaint records, with live collection snapshots and create/update/delete operations    |

The app requests notification permission during startup and subscribes the device to `all_users`. A
small HTTP notification client is called from achievement and complaint creation. FCM
foreground/background message presentation handlers are not configured in `main.dart`; the client
request alone does not establish notification delivery or presentation.

## State management

Provider supplies a `SettingProvider` `ChangeNotifier` for the current theme and locale. Screens
read and update these values through Provider. The setting values are restored from Shared
Preferences when the splash screen initializes.

Most page-level form and navigation state is managed locally by Flutter widgets. Firestore services
expose streams for achievement, complaint, and user data where live snapshots are used.

## Localization and appearance

Flutter's generated localization setup supports English (`en`) and Arabic (`ar`), with message
resources under `lib/core/l10n/` and `l10n.yaml` at the project root. Poppins and Cairo font assets
are declared in `pubspec.yaml`. Light and dark `ThemeData` definitions are centralized in
`lib/core/AppTheme/`.

## Project structure

```text
lib/
|-- main.dart                  # Firebase initialization and root MaterialApp
|-- Models/                    # Screens, feature data models, and onboarding
|-- Widgets/                   # Shared form and UI components
|-- Services/                  # Loading, toast, and notification helpers
|-- core/
|   |-- AppeRoutes/            # Named route definitions and route generation
|   |-- AppTheme/              # Theme data and colors
|   |-- Classes/               # Shared data models
|   |-- FirebaseServices/      # Authentication and Firestore service wrappers
|   |-- l10n/                  # English and Arabic localization resources
|   `-- provider/              # Settings ChangeNotifier
`-- firebase_options.dart      # FlutterFire platform configuration
```

## Getting started

### Prerequisites

- Flutter SDK compatible with the SDK constraint in `pubspec.yaml`
- Dart SDK compatible with that Flutter release
- Android Studio or Xcode for the platform you intend to run
- Access to a Firebase project configured for this app

### Run locally

1. Clone the repository:

   ```bash
   git clone https://github.com/youssefmo589-tech/AL-Fostat_Compound_App.git
   cd AL-Fostat_Compound_App
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Confirm Firebase and Google sign-in configuration for your development environment (see below).

4. Run on a configured device or emulator:

   ```bash
   flutter run
   ```

## Configuration notes

- The checked-in Firebase options and native configuration refer to the existing `al-fostat-compund`
  Firebase project. Configure your own Firebase project before using a fork; FlutterFire CLI can
  generate platform options and native configuration files.
- Google sign-in needs valid OAuth client configuration for the Android application ID/signing
  certificate and iOS bundle identifier. Current native files use `com.example.alfostat`; update
  identifiers and Firebase registrations together if you change them.
- Firestore collections and security rules must match the data shapes and operations used by the
  app. Security rules are not included in this repository.
- The notification helper posts to a project-specific HTTP endpoint. Review or replace that endpoint
  and configure its server-side behavior for your own deployment; its implementation is a client
  HTTP call.
- Firebase setup currently supports Android and iOS in `firebase_options.dart`; Web, macOS, Windows,
  and Linux options are not configured there.
- Localization resources are maintained in `lib/core/l10n/`; generated localization files are
  checked in. After changing ARB resources, use Flutter's localization generation workflow.

## APK and releases

No published release or downloadable APK is linked from this repository. An APK may be built locally
with:

```bash
flutter build apk --release
```

The project version currently declared in `pubspec.yaml` is `1.0.0+1`. Build outputs are local
artifacts and are not presented here as a GitHub release.

## Developer

**Youssef Mohamed**  
[GitHub profile](https://github.com/youssefmo589-tech) | [Project repository](https://github.com/youssefmo589-tech/AL-Fostat_Compound_App)
