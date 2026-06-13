# 🥗 NutriFit

NutriFit is a cross-platform fitness and nutrition tracking application built with Flutter, Express.js, and MongoDB. The app helps users manage their health goals by tracking personal fitness data, calculating calorie requirements, monitoring progress, and providing intelligent calorie predictions.

---

## 🚀 Features

### Authentication

* User Registration
* User Login
* JWT Authentication
* Secure Token Storage

### User Profile

* Age
* Gender
* Height
* Weight
* Activity Level

### Fitness Tracking

* Daily Calorie Requirement Calculation
* Weight Tracking
* Progress Monitoring
* Fitness Dashboard

### Nutrition Tracking

* Food Logging
* Calorie Tracking
* Nutritional Information

### Planned Features

* AI-powered Calorie Prediction
* Food Image Recognition
* Workout Tracking
* Personalized Recommendations
* Goal-Based Nutrition Planning
* Progress Analytics

---

## 🛠️ Tech Stack

### Frontend

* Flutter
* Dart
* Dio
* Flutter Secure Storage

### Backend

* Node.js
* Express.js
* JWT Authentication
* Bcrypt.js

### Database

* MongoDB Atlas
* Mongoose

---

## 📂 Project Structure

```text
NutriFit/
│
├── mobile/
│   ├── lib/
│   │   ├── models/
│   │   ├── screens/
│   │   ├── services/
│   │   ├── widgets/
│   │   └── main.dart
│   │
│   ├── android/
│   ├── ios/
│   └── pubspec.yaml
│
├── backend/
│   ├── src/
│   │   ├── config/
│   │   ├── controllers/
│   │   ├── middleware/
│   │   ├── models/
│   │   ├── routes/
│   │   └── services/
│   │
│   ├── .env
│   ├── server.js
│   └── package.json
│
└── README.md
```

---

## ⚙️ Installation

### Clone Repository

```bash
git clone https://github.com/yourusername/nutrifit.git
cd nutrifit
```

---

## Backend Setup

Navigate to backend directory:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

Create a `.env` file:

```env
PORT=5000

MONGO_URI=YOUR_MONGODB_CONNECTION_STRING

JWT_SECRET=YOUR_SECRET_KEY
```

Start development server:

```bash
npm run dev
```

---

## Mobile Setup

Navigate to mobile directory:

```bash
cd mobile
```

Install Flutter packages:

```bash
flutter pub get
```

Run application:

```bash
flutter run
```

---

## 🔐 Authentication Flow

```text
Register
    ↓
Login
    ↓
JWT Token Generation
    ↓
Secure Storage
    ↓
Protected APIs
```

---

## 👤 User Profile Flow

```text
Login
    ↓
Profile Setup
    ↓
Age
Height
Weight
Gender
Activity Level
    ↓
Save To MongoDB
```

---

## 📊 Future Roadmap

### Phase 1

* Project Setup
* Backend Setup
* Database Integration

### Phase 2

* Authentication
* JWT Security

### Phase 3

* User Profile Management

### Phase 4

* Calorie Calculator

### Phase 5

* Nutrition Tracking

### Phase 6

* AI Calorie Prediction

### Phase 7

* Workout Tracking

### Phase 8

* Analytics Dashboard

---

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

Developed by Tharani

---

### Vision

NutriFit aims to provide a smart and accessible platform for fitness enthusiasts to monitor their health, track nutrition, and achieve their fitness goals through data-driven insights and AI-powered recommendations.
