# 🌱 FertiBase

🇬🇧 English | [🇭🇷 Hrvatski](README.hr.md)

A mobile app that helps farmers and agricultural producers find and compare
fertilizers by name, manufacturer, type and NPK composition.

Final thesis project.

🎬 **[Watch the demo on YouTube](https://youtu.be/dugxvRwSdwE)**

<!-- Add screenshots: docs/screenshot1.png, docs/screenshot2.png -->

## Features

- **Search** by fertilizer name or manufacturer
- **NPK search**: filter by nitrogen (N), phosphorus (P₂O₅) and potassium (K₂O) ranges
- **Filtering** by fertilizer type (mineral, organic, soil improvers) and manufacturer
- **Element filter**: require specific elements (e.g. Fe, Mg) in the product
- **Details page** with composition and the product description
- **Favorites**, saved on the device and kept between sessions
- Dataset of **855 fertilizers from 92 manufacturers**, with names in
  Croatian, Serbian and Bosnian

## Tech Stack

- **Flutter / Dart**
- **Provider**: state management (favorites)
- **SharedPreferences**: local storage of favorites
- **flutter_html**: rendering the HTML product descriptions
- **JSON**: fertilizer data bundled with the app (`assets/fertilizers.json`)

## Architecture

```
lib/
├── main.dart
└── src/
    ├── models/      # Fertilizer, ChemicalElement, Translation
    ├── data/        # fertilizer_repository.dart: loads and parses the JSON
    ├── state/       # favorites_model.dart (Provider / ChangeNotifier)
    ├── utils/       # filters.dart: search, type, company and NPK filtering
    ├── pages/       # home, search, detail, favorites, about
    ├── widgets/     # fertilizer_card.dart
    └── settings/    # settings controller, service and view
```

The user interface, application state, data access and filtering logic live in
separate layers, so each can be changed without touching the others.

## Getting Started

### Prerequisites
- Flutter SDK (Dart SDK ^3.6.1)
- An IDE such as Visual Studio Code or Android Studio
- Android emulator, iOS simulator, or a physical device

### Installation
```bash
git clone https://github.com/sucicnina/fertibase.git
cd fertibase
flutter pub get
flutter run
```

## Data

The fertilizer dataset is bundled with the app as a local JSON file.
Source: **[add the source of the dataset here]**.

## Known Limitations

- The unit and widget tests are still Flutter template placeholders. The
  filtering logic in `utils/filters.dart` is the natural next thing to test.
- The `sample_feature` folder is left over from the Flutter project template.
- The dataset is static; there is no online update.

## My Contribution

Solo project: I designed and developed the whole application, from the data
model and the filtering logic to the screens and the local favorites storage.

## Author

Nina Sučić
