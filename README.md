# Loopi Admin Application

The **Loopi Admin Application** is a management platform designed for admins to efficiently manage bus routes, driver assignments, bookings, payments, and monitor system performance. Built with **Flutter**, the app provides an intuitive interface for admins to handle all administrative tasks related to the bus booking system.

## Features

- **Manage Drivers**: Add, update, or remove drivers from the system.
- **Route Management**: View, add, or update bus routes, including route schedules and availability.
- **Booking Management**: View and manage all user bookings, including ride status and payment tracking.
- **Payment Management**: Monitor payments, track earnings, and view transaction history.
- **Real-Time Monitoring**: Real-time updates on bookings, driver status, and ongoing routes.
- **User Management**: Admin can manage user accounts and their associated bookings.
- **Push Notifications**: Send notifications to drivers or users about important updates.

## Technologies Used

- **Flutter**: The mobile framework used to build the app.
- **Dart**: The programming language used for development.
- **Firebase**: For backend services, including authentication, Firestore, and real-time updates.
- **BLoC**: For efficient state management.
- **Firestore**: For storing and retrieving booking data, driver profiles, and transactions.
- **Firebase Cloud Messaging (FCM)**: For push notifications.

## Installation

### Prerequisites

Before running the project, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE like **Android Studio** or **VSCode** for Flutter development.

### Firebase Setup

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project and link it to your Flutter project (for both Android and iOS).
   - Add your **google-services.json** (for Android) and **GoogleService-Info.plist** (for iOS) to your project.

2. **Enable Firebase Authentication**:
   - In Firebase, enable **Email/Password Authentication** or **Google Sign-In** for admin login.

3. **Enable Firestore**:
   - Set up Firestore to store and manage routes, bookings, drivers, and payment details.

4. **Enable Firebase Cloud Messaging (FCM)**:
   - Set up **FCM** for sending push notifications to drivers and users.

### Steps to Run the Project Locally

1. **Clone the repository**:
    ```bash
    git clone https://github.com/HossamAhmed954074/Loopi_Admin.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd Loopi_Admin
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Set up Firebase**:
    - Ensure that you've followed the Firebase setup instructions above and added the necessary configuration files.

5. **Run the app**:
    - For **Android**:
      ```bash
      flutter run
      ```
    - For **iOS** (on macOS):
      ```bash
      flutter run
      ```

## Usage

Once the app is running:

- **Manage Drivers**: View a list of all drivers, update their profiles, or assign routes.
- **Route Management**: Add or modify bus routes, update schedules, and monitor route status.
- **Booking Management**: Monitor and manage all user bookings, including payment status.
- **Payment Management**: View transaction details, monitor payments, and manage earnings.
- **Push Notifications**: Send notifications to inform users or drivers about important events.

### Admin Dashboard

The admin can access an overview of:

- Active routes and their status.
- Current driver assignments and their availability.
- Total bookings, earnings, and completed trips.
- Pending actions or alerts.

## BLoC Architecture

The app uses **BLoC** (Business Logic Component) pattern for managing app state efficiently. This pattern helps separate the app’s UI from its business logic, ensuring scalability and maintainability.

### Key BLoC Components:

- **Authentication Bloc**: Manages login and authentication states for admins.
- **Driver Bloc**: Manages driver data and operations like adding, updating, and removing drivers.
- **Route Bloc**: Manages bus routes, schedules, and availability.
- **Booking Bloc**: Handles all booking operations, including viewing and managing bookings.
- **Payment Bloc**: Manages payment tracking and payment history.

## Contributing

We welcome contributions to improve this app! If you would like to help out, please fork the repository, make your changes, and submit a pull request.

### How to Contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push to your fork (`git push origin feature-name`).
5. Open a pull request.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or feedback, feel free to contact me:

- Email: eltohamehossam@gmail.com
- LinkedIn: www.linkedin.com/in/hossam-ahmed-ab4987248


---

Thank you for checking out the **Loopi Admin Application**! We hope this platform helps admins efficiently manage and monitor their bus booking system.

