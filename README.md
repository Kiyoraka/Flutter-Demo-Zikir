# Demo Zikir Counter App

![Flutter](https://img.shields.io/badge/Flutter-%5E3.7.0-blue)
![Version](https://img.shields.io/badge/Version-0.1.0-green)

A beautiful and minimalist Islamic zikir (dhikr) counter app built with Flutter. This app helps Muslims keep track of their devotional repetitions with an elegant, modern user interface featuring glassmorphism effects.

## Features

- **Beautiful UI**: Elegant design with glassmorphism effects and gradient background
- **Touch Counter**: Increment counter with a satisfying press animation
- **Reset Function**: Easily reset your count to zero
- **Tasbih Display**: Shows the Arabic phrase "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ" (SubhanAllahi wa bihamdihi - Glory be to Allah and praise Him)
- **Smooth Animations**: Responsive tap animations for a satisfying user experience
- **Minimalist Design**: Clean, distraction-free interface for focused devotional practice

## Screenshots

*[Screenshots to be added]*

## Requirements

- Flutter SDK ^3.7.0
- Compatible with iOS, Android, and web platforms

## Installation

1. Make sure you have Flutter installed on your machine. For installation instructions, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

2. Clone this repository:
   ```
   git clone https://github.com/yourusername/demo_zikir_app.git
   ```

3. Navigate to the project directory:
   ```
   cd demo_zikir_app
   ```

4. Install dependencies:
   ```
   flutter pub get
   ```

5. Run the app:
   ```
   flutter run
   ```

## Usage

1. **Launch the app**: Open the app on your device.
2. **Count dhikr**: Tap the circular button at the bottom of the screen to increment the counter.
3. **Reset count**: Tap the refresh icon in the top-right corner to reset the counter to zero.

The app is designed to be simple and intuitive, allowing you to focus on your devotional practice without distractions.

## How It Works

The app uses Flutter's StatefulWidget to manage the counter state. When you tap the counter button, it triggers an animation that slightly scales down the button, giving visual feedback of your interaction, while simultaneously incrementing the counter value.

Key components:
- **ZikirApp**: The main application widget
- **ZikirCounter**: The StatefulWidget that manages the counter state
- **Glassmorphism Effect**: Achieved using ClipRRect, BackdropFilter, and containers with transparent backgrounds

## Dependencies

This app uses minimal dependencies to ensure lightweight performance:

- `flutter/material.dart`: For Material Design components
- `dart:ui`: For advanced visual effects like BackdropFilter

## Customization

You can easily customize the app by modifying the following:

- Change the Arabic text in the main.dart file to display different dhikr phrases
- Adjust the color gradient in the Container decoration properties
- Modify the animation duration and scale values

## Future Enhancements

Potential features for future versions:
- Multiple dhikr phrases with selection option
- Daily targets and progress tracking
- Vibration feedback on count
- Dark/light theme options
- Count history and statistics

## License

*[Appropriate license to be added by the project owner]*

## Acknowledgements

- Flutter team for the amazing framework
- Contributors and testers

---

Made with ❤️ for the Muslim community