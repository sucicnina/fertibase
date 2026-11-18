# 🌱 FertiBase

[🇬🇧 English](README.md) | 🇭🇷 Hrvatski

Mobilna aplikacija koja pomaže poljoprivrednicima i proizvođačima da lakše
pronađu i usporede gnojiva prema nazivu, proizvođaču, vrsti i NPK sastavu.

Projekt završnog rada.

🎬 **[Pogledaj demo na YouTubeu](https://youtu.be/dugxvRwSdwE)**

<!-- Dodaj screenshotove: docs/screenshot1.png, docs/screenshot2.png -->

## Značajke

- **Pretraga** prema nazivu gnojiva ili proizvođaču
- **NPK pretraga**: filtriranje prema rasponu dušika (N), fosfora (P₂O₅) i kalija (K₂O)
- **Filtriranje** prema vrsti gnojiva (mineralna, organska, poboljšivači tla) i proizvođaču
- **Filter elemenata**: traženje proizvoda koji sadrže određene elemente (npr. Fe, Mg)
- **Stranica s detaljima** sa sastavom i opisom proizvoda
- **Favoriti** koji se spremaju na uređaju i ostaju sačuvani između pokretanja
- Baza od **855 gnojiva i 92 proizvođača**, s nazivima na hrvatskom, srpskom i bosanskom

## Tehnologije

- **Flutter / Dart**
- **Provider**: upravljanje stanjem (favoriti)
- **SharedPreferences**: lokalna pohrana favorita
- **flutter_html**: prikaz HTML opisa proizvoda
- **JSON**: podaci o gnojivima uključeni u aplikaciju (`assets/fertilizers.json`)

## Arhitektura

```
lib/
├── main.dart
└── src/
    ├── models/      # Fertilizer, ChemicalElement, Translation
    ├── data/        # fertilizer_repository.dart: učitavanje i parsiranje JSON-a
    ├── state/       # favorites_model.dart (Provider / ChangeNotifier)
    ├── utils/       # filters.dart: pretraga, vrsta, proizvođač i NPK filtri
    ├── pages/       # početna, pretraga, detalji, favoriti, o aplikaciji
    ├── widgets/     # fertilizer_card.dart
    └── settings/    # kontroler, servis i prikaz postavki
```

Korisničko sučelje, stanje aplikacije, pristup podacima i logika filtriranja
nalaze se u zasebnim slojevima, pa se svaki može mijenjati bez diranja ostalih.

## Pokretanje

### Preduvjeti
- Flutter SDK (Dart SDK ^3.6.1)
- IDE, npr. Visual Studio Code ili Android Studio
- Android emulator, iOS simulator ili fizički uređaj

### Instalacija
```bash
git clone https://github.com/sucicnina/fertibase.git
cd fertibase
flutter pub get
flutter run
```

## Podaci

Baza gnojiva dolazi uz aplikaciju kao lokalna JSON datoteka.
Izvor: **[ovdje upiši izvor podataka]**.

## Poznata ograničenja

- Unit i widget testovi su još uvijek predlošci iz Fluttera. Logika filtriranja
  u `utils/filters.dart` prirodan je sljedeći kandidat za testiranje.
- Mapa `sample_feature` je ostatak iz Flutter predloška.
- Baza je statična, nema mrežnog osvježavanja podataka.

## Moj doprinos

Samostalni projekt: sama sam osmislila i razvila cijelu aplikaciju, od modela
podataka i logike filtriranja do ekrana i lokalne pohrane favorita.

## Autorica

Nina Sučić
