# Block - Flutter Mobile Developer Assessment

A clean and structured Flutter mobile app built as part of a mobile developer assessment. The task involved implementing a pixel-perfect onboarding and authentication flow from Figma, integrating API authentication, and managing session state with secure PIN login.

## 🚀 Features

- Onboarding screens
- Registration & login via API
- PIN setup
- Secret message screen post-login
- Animation-enhanced transitions
- Splash screen

## 🔧 Tech Stack

- **Flutter** (UI Framework)
- **BLoC** (State management)
- **get_it** (Dependency Injection)
- **go_router** (Navigation)
- **dio** with token interceptor
- **flutter_secure_storage** (Secure storage)
- **feature-based folder structure**

## 📦 Project Structure

```
lib/
├── core/
├── di/
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── get_started/
│   ├── onboarding/
│   └── shared/
├── navigation/
└── main.dart
```

## 📲 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/blackorbs-dev/block.git
cd block
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Generate code (for `freezed`, `json_serializable`, etc.)
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Run the app
```bash
flutter run
```

> Use a real or emulated device with internet access

## 📷 Figma & API Docs

- **Figma Design:** _[Provided with task]_
- **API Docs:** _[Provided with task]_

## 🎁 Bonus

- Creative, animated transitions and feedback
- Thoughtfully handled edge cases (network, invalid states)
- Secure and persistent session handling

## 📌 Hosting

- App hosted via [Google Drive link](https://drive.google.com/file/d/1P6ZjbpVGA4p-orzU4f680H78eOy_UJW1/view?usp=drivesdk)

## 🧑‍💻 Author

**BlackOrbs**  
GitHub: [@blackorbs-dev](https://github.com/blackorbs-dev)

## 🪪 License

This project is licensed for assessment purposes only.
