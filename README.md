# Flutter Business Card Application

This Flutter application serves as a dynamic and interactive business card. It showcases a visually appealing design with animated gradients, a detailed profile, and links to projects, portfolio, and contact information. The app is designed to highlight your professional skills, interests, and achievements in a modern and engaging way.

## Features

- **Animated Backgrounds**: Smooth gradient transitions for a simple, pleasant look.
- **Profile Section**: Shows your name, title, short bio, and skills.
- **Skills Chips**: Small badges for skills and technologies.
- **Projects**: Links to key projects and repositories.
- **Contact**: Tap email, portfolio, or phone. (The phone icon uses a `tel:` link where supported.)
- **Responsive**: Layout adapts and avoids overflow on narrow screens.

## What’s new

- Tests were updated to match the current UI and now pass locally.
- Responsive fixes were added so links and icons don't shift off the card.
- A macOS release build was created and screenshots were captured for verification.

## Getting Started

Follow these instructions to set up and run the application on your local machine.

### Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/flutter-business-card.git
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter-business-card
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Tests

- Run analyzer and tests:
  ```bash
  flutter analyze
  flutter test
  ```
- Note: tests were updated to match the UI and should pass locally.

### Running the Application

1. Connect a physical device, start an emulator, or run on macOS (desktop).
2. Run the app (development):
   ```bash
   flutter run
   ```
3. Build a macOS release (optional):
   ```bash
   flutter build macos
   ```
   The macOS app bundle will be at `build/macos/Build/Products/Release/flutter_application_1.app`.

## Project Structure

- `lib/main.dart`: Contains the main application logic and UI components.
- `assets/`: Stores static assets such as images.
- `pubspec.yaml`: Manages dependencies and assets.

## Customization

You can customize the application by modifying the following:

- **Profile Information**: Update the `about` string and `interests` list in `main.dart`.
- **Projects**: Add or modify the `projects` list in `main.dart`.
- **Skills**: Adjust the skills chips in the `leftColumn` widget.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) for the amazing framework.
- [url_launcher](https://pub.dev/packages/url_launcher) package for handling external links.

---

For any questions or suggestions, feel free to reach out via [email](mailto:nima.mona82@gmail.com) or visit my [portfolio](https://nimajafaricomp.github.io).
