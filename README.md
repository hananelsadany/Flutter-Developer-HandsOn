# Junior Flutter Developer Assessment

A starter Flutter project and written assessment for junior Flutter developer candidates.

## Repository Structure

```
├── lib/
│   ├── main.dart              # App entry point
│   ├── screens/
│   │   └── home_screen.dart   # Home screen (counter example)
│   ├── models/
│   │   └── post.dart          # Post data model
│   ├── services/
│   │   └── api_service.dart   # HTTP service (JSONPlaceholder)
│   └── widgets/
│       └── post_card.dart     # Reusable post card widget
├── test/
│   └── widget_test.dart       # Widget tests
├── ASSESSMENT.md              # Written assessment questions – fill in your answers here
├── analysis_options.yaml      # Dart/Flutter lint rules
└── pubspec.yaml               # Project dependencies
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.0.0
- Dart SDK ≥ 3.0.0 (bundled with Flutter)
- An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Setup

```bash
# 1. Clone the repository
git clone https://github.com/hananelsadany/Junior-Flutter-Developer-Assessment.git
cd Junior-Flutter-Developer-Assessment

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### Running Tests

```bash
flutter test
```

## Assessment Instructions

1. Open `ASSESSMENT.md` and answer every written question in the space provided.
2. Complete the **Practical Task** described in Part 7 of `ASSESSMENT.md`.
3. Commit your changes and open a Pull Request (or submit as directed by the hiring team).

---

*This project was scaffolded as a Flutter starter template. The counter on the home screen is the default Flutter demo; replace or extend it as part of the practical task.*
