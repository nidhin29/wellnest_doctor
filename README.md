# WellNest Doctor - Healthcare Management App

**A comprehensive doctor-side healthcare management application built with Flutter**

## 📱 About WellNest Doctor

WellNest Doctor is the physician-side companion app for the WellNest healthcare ecosystem. Built with Flutter and following clean architecture principles, this application enables healthcare providers to efficiently manage patient appointments, communicate securely with patients, and maintain their professional profiles.

### ✨ Key Features

#### 🏥 **Appointment Management**
- **Real-time Appointment Viewing**: Interactive calendar interface showing daily appointments
- **Patient Information**: Detailed view of patient names and appointment times
- **Time-based Access Control**: Chat functionality available only during scheduled appointment times
- **Appointment Status Tracking**: Monitor appointment statuses and patient interactions

#### 👩‍⚕️ **Doctor Profile Management**
- **Professional Profile**: Comprehensive doctor information including:
  - Name and specialization
  - Years of experience
  - Number of patients treated
  - Educational background
  - Professional bio
- **Profile Editing**: Real-time profile updates with instant synchronization
- **Secure Authentication**: Email/password-based login system

#### 💬 **Patient Communication System**
- **Secure Messaging**: HIPAA-compliant chat system with patients
- **Appointment-based Chat**: Communication restricted to appointment windows
- **Real-time Messaging**: Instant message delivery with emoji support
- **Message History**: Complete conversation logs for reference
- **Auto-refresh**: Real-time message updates every 3 seconds

#### 🔐 **Security & Authentication**
- **Secure Login**: Token-based authentication system
- **Session Management**: Automatic login state persistence
- **Data Protection**: Secure API communications with proper error handling

## 🏗️ Architecture & Design

### **Clean Architecture Implementation**

```
lib/
├── Application/              # Business Logic Layer (BLoCs & Cubits)
│   ├── edit_profile/         # Profile editing state management
│   ├── home/                 # Dashboard and appointment logic
│   ├── loggedin/             # Authentication state management
│   ├── message/              # Messaging system logic
│   ├── profile/              # User profile management
│   ├── signin/               # Authentication logic
│   └── signup/               # Registration logic
│
├── Domain/                   # Business Models & Interfaces
│   ├── Failure/              # Error handling models
│   ├── Home/                 # Home page models and services
│   │   ├── StartChat/        # Chat initiation models
│   │   └── ViewAppointments/ # Appointment viewing models
│   ├── LoggedIn/             # Authentication models
│   ├── Message/              # Messaging system models
│   │   ├── SendMessage/      # Message sending models
│   │   └── ViewMessage/      # Message viewing models
│   ├── Profile/              # User profile models
│   ├── SignIn/               # Authentication models
│   ├── SignUp/               # Registration models
│   └── TokenManager/         # Session management
│
├── Infrastructure/           # Data Layer & External Services
│   ├── Home/                 # Home data repositories
│   │   ├── StartChat/        # Chat API integration
│   │   └── ViewAppointments/ # Appointment API integration
│   ├── LoggedIn/             # Authentication repositories
│   ├── Message/              # Messaging repositories
│   │   ├── SendMessage/      # Message sending API
│   │   └── ViewMessage/      # Message retrieval API
│   ├── Profile/              # Profile data management
│   ├── SignIn/               # Authentication repositories
│   ├── SignUp/               # Registration repositories
│   └── TokenManager/         # Token management
│
├── Presentation/             # UI Layer
│   ├── Auth/                 # Authentication screens
│   ├── common_widgets/       # Reusable UI components
│   ├── constants/            # UI constants and themes
│   ├── Home/                 # Dashboard and appointment views
│   ├── Messages/             # Chat and messaging interface
│   ├── Profile/              # Profile management screens
│   └── Splash/               # App launch and intro screens
│
├── Constant/
│   └── injectable/           # Dependency injection setup
│
└── main.dart                 # App entry point
```

### **Key Design Patterns**

#### **BLoC/Cubit Pattern**
- **State Management**: Predictable state management using BLoC pattern
- **Event-Driven Architecture**: Reactive programming with clear separation of concerns
- **Real-time Updates**: Automatic UI updates based on state changes

#### **Dependency Injection**
- **GetIt**: Service locator pattern for dependency management
- **Injectable**: Code generation for automatic dependency registration
- **Modular Architecture**: Clean separation between layers

#### **Repository Pattern**
- **Data Abstraction**: Clean separation between data sources and business logic
- **Error Handling**: Consistent error handling with Either types from Dartz
- **API Integration**: RESTful API communication with proper error management

## 🛠️ Technology Stack

### **Frontend Framework**
- **Flutter SDK**: >=3.4.4 - Cross-platform mobile development
- **Dart**: Primary programming language
- **Material Design**: Google's design system for consistent UI

### **State Management**
- **Flutter BLoC**: Business Logic Component pattern for complex state
- **Cubit**: Simplified BLoC for straightforward state management
- **Freezed**: Immutable data classes with code generation

### **Backend Integration**
- **Dio**: HTTP client for API communications
- **Base URL**: `https://vishnuanil.pythonanywhere.com/`
- **RESTful APIs**: Standard REST endpoints for all operations

### **Data Persistence**
- **Shared Preferences**: Local storage for user sessions and preferences
- **Token Management**: Secure token storage and management

### **UI & User Experience**
- **Google Fonts**: Custom typography with Poppins font family
- **Shimmer**: Loading state animations for better UX
- **Table Calendar**: Interactive calendar widget for appointment viewing
- **Emoji Picker**: Enhanced messaging experience with emoji support
- **Custom Widgets**: Reusable components for consistent design

### **Functional Programming**
- **Dartz**: Functional programming utilities
- **Either**: Type-safe error handling
- **Option**: Null-safety with functional approach

## 📱 Core Features Deep Dive

### **Appointment Dashboard**
- **Calendar View**: Interactive calendar showing appointments by date
- **Real-time Updates**: Automatic refresh of appointment data
- **Patient Information**: Quick access to patient names and appointment details
- **Time Validation**: Ensures chat access only during appointment times

### **Messaging System**
- **Secure Communication**: Direct messaging with patients
- **Emoji Support**: Rich text communication with emoji picker
- **Message Threading**: Organized conversation history
- **Real-time Delivery**: Instant message synchronization

### **Profile Management**
- **Comprehensive Profiles**: Complete doctor information management
- **Real-time Editing**: Instant profile updates
- **Professional Information**: Specialization, experience, and credentials

## 📱 User Interface

### **Modern Design**
- **Material Design 3**: Latest design guidelines implementation
- **Responsive Layout**: Adaptive UI for different screen sizes
- **Loading States**: Shimmer effects for better perceived performance
- **Error Handling**: User-friendly error messages and recovery options

### **User Experience**
- **Intuitive Navigation**: Clear and consistent navigation patterns
- **Accessibility**: Screen reader support and accessibility features
- **Performance**: Optimized loading and smooth animations
- **Offline Handling**: Graceful degradation when network is unavailable

## 🚀 Getting Started

### **Prerequisites**
```bash
Flutter SDK >=3.4.4
Dart SDK >=3.4.4
Android Studio / VS Code with Flutter extensions
```

### **Installation**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd wellnest_doctor
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (for freezed and injectable)**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

### **Build for Production**

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🤝 Contributing

Contributions are welcomed! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Code Standards**
- Follow Dart/Flutter style guidelines
- Use meaningful commit messages
- Ensure all tests pass
- Update documentation as needed
- Follow the established architecture patterns

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team

<div align="center">

**Built with ❤️ for better healthcare accessibility**

*Empowering doctors to provide better patient care through technology*

</div>
