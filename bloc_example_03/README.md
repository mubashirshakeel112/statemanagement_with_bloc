# Flutter BLoC State Management Example

A modern Flutter application demonstrating clean architecture and BLoC (Business Logic Component) pattern for state management with a complete authentication flow.

## 📱 Project Overview

This project showcases a production-ready Flutter application implementing login authentication with the BLoC pattern. It features a beautiful UI with smooth animations, proper error handling, and persistent session management using SharedPreferences.

## ✨ Features

- **User Authentication**: Secure login functionality with API integration
- **State Management**: BLoC pattern for predictable state management
- **Persistent Sessions**: Token-based authentication with local storage
- **Smooth Animations**: Engaging splash screen with fade transitions
- **Modern UI**: Clean, responsive design with Material Design principles
- **Error Handling**: Comprehensive error management with custom exceptions
- **Form Validation**: Input validation with user feedback
- **Custom Widgets**: Reusable UI components for consistency

## 🏗️ Architecture & Key Concepts

### State Management
- **BLoC Pattern**: Separates business logic from UI using streams and events
- **Event-Driven**: User interactions trigger events that update state
- **Reactive UI**: UI rebuilds automatically based on state changes

### Clean Architecture Layers
1. **Presentation Layer**: UI components and BLoC
2. **Domain Layer**: Data models and business entities
3. **Infrastructure Layer**: API exceptions
4. **Repository Layer**: Abstraction between data sources and business logic
5. **Service Layer**: API service

### Design Patterns
- Repository Pattern for data abstraction
- Dependency Injection for loose coupling
- Factory Pattern for model creation
- Observer Pattern via BLoC streams

## 📂 Folder Structure

```
lib/
├── base/
│   └── app_view.dart                 # Root application widget with BLoC provider
├── constants/
│   └── endpoints.dart                # API endpoint configurations
├── domain/
│   └── auth_data_model.dart          # Data models (AuthDataModel, User, Address, etc.)
├── infrastructure/
│   └── api_exception.dart            # Custom API exception handling
├── presentation/
│   ├── home/
│   │   └── home_view.dart           # Home screen with modern UI
│   ├── login/
│   │   ├── bloc/
│   │   │   ├── login_bloc.dart      # BLoC logic for login
│   │   │   ├── login_event.dart     # Login events (UsernameChanged, etc.)
│   │   │   └── login_state.dart     # Login states and validation
│   │   └── login_view.dart          # Login UI screen
│   └── splash/
│       └── splash_view.dart         # Animated splash screen
├── Repository/
│   └── login_repo.dart              # Repository abstraction for login
├── services/
│   ├── base_service.dart            # Base service with common headers
│   ├── login_service.dart           # Login API service implementation
│   └── preferences.dart             # SharedPreferences wrapper
├── widgets/
│   ├── custom_button.dart           # Reusable button component
│   ├── custom_loader.dart           # Loading indicator widget
│   ├── custom_snack_bar.dart        # Custom snackbar notifications
│   └── custom_textfield.dart        # Reusable text field component
├── extension.dart                    # HTTP response extensions
├── route_generator.dart              # Route management (not shown but referenced)
└── main.dart                         # Application entry point
└── route_generator.dart              # Mannage App routing
```

## 🛠️ Tech Stack

### Framework & Language
- **Flutter**: ^3.x.x
- **Dart**: ^3.x.x

### State Management
- **flutter_bloc**: ^8.x.x - BLoC pattern implementation
- **bloc**: ^8.x.x - Core BLoC library

### Networking
- **http**: ^1.x.x - HTTP client for API requests

### Local Storage
- **shared_preferences**: ^2.x.x - Persistent key-value storage

### Utilities
- **equatable**: ^2.x.x - Value equality for BLoC events and states

### API
- **Fake Store API**: [https://fakestoreapi.com](https://fakestoreapi.com)

## 📋 Prerequisites

Before running this project, ensure you have:

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- An Android emulator or iOS simulator / Physical device

## 🚀 Installation & Setup

### 1. Clone the Repository

```bash
git clone <https://github.com/mubashirshakeel112/statemanagement_with_bloc>
cd bloc_example_03
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

```bash
# Run on connected device
flutter run

# Run on specific device
flutter run -d <device-id>

# Run in release mode
flutter run --release
```

### 4. Test Credentials

Use the following test credentials from Fake Store API:

**Username**: `mor_2314`  
**Password**: `83r5^_`

Or refer to [Fake Store API Documentation](https://fakestoreapi.com/docs) for more test users.

## 📱 How to Use

1. **Launch App**: The splash screen appears with a fade animation
2. **Authentication Check**: App automatically navigates to:
    - Login screen (if no token found)
    - Home screen (if valid token exists)
3. **Login**: Enter credentials and tap the LOGIN button
4. **Success**: Upon successful authentication, you're redirected to the home screen
5. **Persistent Session**: Token is saved locally for future sessions

## 🎨 UI Components

### Custom Widgets

- **PrimaryButton**: Configurable button with consistent styling
- **CustomTextField**: Text input with prefix/suffix icons and validation
- **CustomLoader**: Loading indicator for async operations
- **CustomSnackBar**: Toast-style notifications (success, error, warning)

### Screens

- **SplashView**: Animated entry screen with fade transition
- **LoginView**: Form-based authentication with validation
- **HomeView**: Modern dashboard with search, categories, and featured content

## 🔧 Configuration

### API Endpoints

Modify `lib/constants/endpoints.dart` to change API endpoints:

```dart
class Endpoints {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String login = '$baseUrl/auth/login';
}
```

### Theming

Update theme in `lib/base/app_view.dart`:

```dart
theme: ThemeData(
  scaffoldBackgroundColor: Colors.white.withValues(alpha: 0.975)
),
```

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart

# Run integration tests
flutter test integration_test/
```

## 📸 Screenshots

_Add your application screenshots here_

```
[Splash Screen] [Login Screen] [Home Screen]
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Code Quality

This project follows:
- Flutter style guide
- Clean code principles
- SOLID principles
- Separation of concerns

## 🐛 Known Issues

- None at the moment

[//]: # (## 🔮 Future Enhancements)

[//]: # ()
[//]: # (- [ ] Registration functionality)

[//]: # (- [ ] Forgot password feature)

[//]: # (- [ ] Biometric authentication)

[//]: # (- [ ] Dark mode support)

[//]: # (- [ ] Multi-language support)

[//]: # (- [ ] Unit and integration tests)

[//]: # (- [ ] CI/CD pipeline)

## 👨‍💻 Author

**Mubashir Shakeel**
- GitHub: [@mubashirshakeel112](https://github.com/mubashirshakeel112)
- LinkedIn: [Mubashir Shakeel](https://www.linkedin.com/in/mubashir-shakeel-42165a34b/)
- Email: mubashirshakeeldev@gmail.com

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev) for the amazing framework
- [Fake Store API](https://fakestoreapi.com) for the free testing API
- [BLoC Library](https://bloclibrary.dev) for state management solution

## 📞 Support

For support, email mubashirshakeeldev@gmail.com or open an issue in the repository.

---

**Made with ❤️ using Flutter & BLoC**