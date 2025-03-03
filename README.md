# ✈️ Miles & More Clone

## 📌 Overview
This is a personal practice project that replicates the functionality of the Miles & More app. The app is built using Flutter and Firebase and is currently in test production only.

## 🚀 Features
- Firebase authentication (email/password)
- Firestore database integration
- Google Wallet support (requires API email registration)
- QR code generation
- Theming with Google Fonts
- Routing using `go_router`

## 🛠 Technologies Used
- Flutter
- Firebase Authentication
- Cloud Firestore
- Riverpod state management
- JSON serialization with Freezed
- Google Wallet integration (pending API email registration)

## 📖 Setup Instructions
1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd miles_and_more_clone
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Configure Firebase:
   - Ensure Firebase is set up for the project.
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS, if implemented in the future).
4. ▶Run the project:
   ```sh
   flutter run
   ```

## ⚠️ Notes
- The project is only implemented for Android at the moment.
- Google Wallet features require API email registration.
- The app is not intended for production use; it is for personal practice only.

## 📌 Dependencies
Here are some key dependencies used in the project:
- `flutter_riverpod` for state management
- `firebase_core`, `firebase_auth`, and `cloud_firestore` for Firebase services
- `go_router` for navigation
- `google_fon` for custom fonts
- `qr_flutr` for QR code generation


---
This project is strictly for educational and personal use. It is not affiliated with or endorsed by Miles & More.

