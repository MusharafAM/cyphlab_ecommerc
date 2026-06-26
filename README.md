# CyphMart — Mini E-commerce Flutter App

A small mock e-commerce app built for the **Flutter Developer Intern** practical task at CyphLab (Private) Limited. It uses 100% local/mock data — there is no backend.

## ✨ Features

**Core (required by the task)**
- Splash screen → mock Login screen (no real auth) → main app
- Product Home screen: responsive grid with image, name, price, rating
- Product Details screen: image, name, price, description, rating, quantity picker, Add to Cart
- Cart screen: quantity +/-, swipe-to-remove, running total, mock checkout
- Profile + Orders screen: static profile card and a list of mock past orders

**Bonus points implemented**
- 🔍 Live product search (Home screen search bar)
- 🏷️ Category filter chips (All / Electronics / Fashion / Home & Living / Beauty / Books)
- 🌙 Dark mode toggle (Home screen icon **and** Profile screen switch)
- 💾 Local storage — cart contents and dark-mode preference are saved with `shared_preferences` and restored when the app restarts
- 🎬 Small animations — splash fade/scale, Hero image transition between the grid and the details screen, smooth list/grid transitions
- 📱 Responsive grid — 2 / 3 / 4 columns depending on screen width (phone vs tablet/web)

**Not implemented (called out honestly)**
- No release APK is included in this repository (see "Building a release APK" below for the exact command — I wasn't able to produce the binary in the environment I built this in, see the AI Tool Usage section).

## 🧱 Tech stack

- **Flutter** (Material 3)
- **State management:** [`provider`](https://pub.dev/packages/provider) — `CartProvider` and `ThemeProvider`, both `ChangeNotifier`s
- **Persistence:** `shared_preferences` (cart + theme)
- **Formatting:** `intl` (currency formatting)

## 📁 Folder structure

```
lib/
├── main.dart                      # App entry point, providers, theming
├── models/
│   ├── product.dart                # Product data model
│   └── cart_item.dart              # Cart line item model
├── data/
│   ├── mock_products.dart          # The product "database" (15 products)
│   └── mock_orders.dart            # Static past-orders list
├── providers/
│   ├── cart_provider.dart          # All cart logic + persistence
│   └── theme_provider.dart         # Dark mode state + persistence
├── utils/
│   ├── app_theme.dart              # Light/dark ThemeData
│   └── formatters.dart             # Currency formatting helper
├── widgets/
│   ├── product_card.dart
│   ├── rating_stars.dart
│   ├── quantity_selector.dart
│   ├── category_chip.dart
│   ├── empty_state.dart
│   └── order_tile.dart
└── screens/
    ├── splash_screen.dart
    ├── login_screen.dart
    ├── main_navigation.dart        # Bottom nav bar wrapper (Home/Cart/Profile)
    ├── home_screen.dart
    ├── product_details_screen.dart
    ├── cart_screen.dart
    └── profile_screen.dart
```

This is a fairly standard **layered Flutter structure**: `models` (plain data classes) → `data` (the mock "database") → `providers` (state/business logic) → `widgets` + `screens` (UI). Nothing talks directly to `data/` except the providers, which makes it easy to swap mock data for a real API later without touching the UI.

## 🚀 Setup & run instructions

You'll need the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and a device/emulator.

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MusharafAM/cyphlab_ecommerc.git
   cd cyphlab_ecommerc
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

> Note: product images load from `picsum.photos` (a free placeholder-image service), so the device running the app needs an internet connection to see images. If there's no connection, the app still works fine — each image just falls back to a small placeholder icon instead of crashing.

### Building a release APK
```bash
flutter build apk --release
```
The APK will be generated at `build/app/outputs/flutter-apk/app-release.apk`.




I'm being upfront about this because the task explicitly says AI tools are allowed as long as usage is disclosed and the candidate understands the code — see `CODE_WALKTHROUGH.md` in this repo, which I used to understand how each part works.

## 📸 Screen recording

*(Add your screen-recording link here before submitting — e.g. a Google Drive / Loom link showing: splash → login → browsing/searching/filtering products → product details → add to cart → cart screen quantity & remove → checkout → profile/orders → dark mode toggle.)*
