# Demo Zikir App

A Flutter mobile application for Islamic dhikr (zikir) counting with a modern, minimalist user interface featuring glassmorphism design elements.

## Development Setup

### Requirements
- Dart SDK ^3.7.0
- Flutter SDK ^3.7.0
- Android Studio / VS Code with Flutter extensions (recommended)

### Getting Started

1. Ensure you have Flutter installed and configured properly:
   ```
   flutter doctor
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Run the application:
   ```
   flutter run
   ```

### Build for Production

To build the app for production deployment:

**Android:**
```
flutter build apk --release
```
or for app bundle:
```
flutter build appbundle --release
```

**iOS:**
```
flutter build ios --release
```

## Project Structure

- `lib/main.dart`: Main application entry point and UI implementation
- `android/`: Android-specific configuration and resources
- `ios/`: iOS-specific configuration and resources
- `web/`: Web platform configuration (for web deployment)
- `pubspec.yaml`: Project dependencies and configuration

## Key Components

### ZikirApp
The main application widget that sets up the Material App with theme configuration.

### ZikirCounter
A StatefulWidget that manages the counter's state and UI. It includes:
- A counter value display
- A reset button
- Arabic text display for the dhikr phrase
- An animated tap button

### UI Features
- **Glassmorphism Effect**: Implemented using `BackdropFilter` with `ImageFilter.blur` for a frosted glass appearance
- **Gradient Background**: Uses `LinearGradient` with purple and blue tones
- **Animation**: Scale animation on the counter button for tap feedback
- **Custom Styling**: Carefully designed typography and spacing

## Customization Options

### Changing the Dhikr Text
Modify the Arabic text in `main.dart`:

```dart
Text(
  'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ', // Replace with your desired dhikr
  style: TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    height: 1.5,
  ),
  textAlign: TextAlign.center,
),
```

### Adjusting the UI Colors
The gradient colors can be modified in the Container decoration:

```dart
decoration: BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF667eea), // Change this color
      Color(0xFF764ba2), // Change this color
      Color(0xFFf093fb), // Change this color
    ],
  ),
),
```

## Testing

Run the tests with:
```
flutter test
```

## Performance Considerations

The app is designed to be lightweight and performant. The UI is built with simplicity in mind to ensure smooth performance across different device specifications.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Flutter Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
- [Flutter Pub.dev](https://pub.dev/)