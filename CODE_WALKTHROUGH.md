# Code Walkthrough (plain English)

You said you don't know Flutter yet — this doc is so you can actually understand what was built and talk about it confidently (the task explicitly asks you to understand the code you submit, even if AI helped write it). Read this once, run the app once, and you'll be able to answer most interview-style questions about it.

## The big idea: how data flows through the app

```
mock_products.dart  (the "database" — just a Dart list of Product objects)
        │
        ▼
CartProvider  (holds the cart in memory + saves it to the phone's storage)
        │
        ▼
Screens & widgets  (just *display* whatever the provider currently has,
                     and call provider methods like addToCart() when you tap a button)
```

Nothing in this app calls a real server. "Adding to cart" just means: put this product into a `Map` inside `CartProvider`, then tell every widget that's listening "hey, I changed, redraw yourself." That's what `notifyListeners()` does.

## What is "Provider", really?

Think of `CartProvider` as a box that holds the cart, sitting *above* the whole app (it's set up once in `main.dart`). Any screen can:
- **Read from it without listening** — `context.read<CartProvider>().addToCart(product)` — "do this thing, I don't care to rebuild"
- **Watch it and rebuild automatically** — `context.watch<CartProvider>()` — "give me the current cart, and rebuild this widget every time it changes"

That's the entire pattern. `ThemeProvider` works exactly the same way, just for dark/light mode instead of the cart.

## File-by-file, in the order you'd actually read them

1. **`models/product.dart`** — what a "Product" *is*: id, name, category, price, rating, image url, description. Just a data shape, no logic.
2. **`models/cart_item.dart`** — a product plus a quantity. This is what actually lives in the cart (you can have 2 of the same product).
3. **`data/mock_products.dart`** — the 15 fake products. This is your "database." If you ever connect a real backend, this is the file you'd delete and replace with an API call.
4. **`data/mock_orders.dart`** — fake past orders shown on the Profile screen. Completely separate from the live cart — it's just static text for display.
5. **`providers/cart_provider.dart`** — all the cart *logic*: add, remove, increase/decrease quantity, total price. Also saves/loads the cart to the phone using `shared_preferences` (so it survives closing the app).
6. **`providers/theme_provider.dart`** — same idea, but just a boolean (`isDarkMode`) and a save/load.
7. **`utils/app_theme.dart`** — colors and button/input styles, once, in one place, so every screen looks consistent.
8. **`widgets/*`** — small reusable UI pieces used by more than one screen (a product card, a star rating row, the +/- quantity control, etc.). Splitting these out means the screen files stay shorter and you don't repeat yourself.
9. **`screens/*`** — the actual pages. Each one is mostly just **layout** (`Column`, `Row`, `Padding`, `GridView`...) plus calls into the providers when something is tapped.

## Walking through the user journey

- **`splash_screen.dart`** — shows the logo for ~2 seconds with a fade/scale animation, then auto-navigates to `login_screen.dart`.
- **`login_screen.dart`** — a form with email/password. There's no real authentication; pressing "Login" with non-empty fields (or tapping "Continue as Guest") just navigates to `main_navigation.dart`.
- **`main_navigation.dart`** — holds the bottom nav bar and swaps between `HomeScreen`, `CartScreen`, and `ProfileScreen`. It uses an `IndexedStack` instead of just rebuilding screens, which means switching tabs doesn't lose your scroll position or search text.
- **`home_screen.dart`** — search box + category chips filter a local `List<Product>` (`mockProducts.where(...)`), then the results go into a `GridView`. Tapping a product pushes `product_details_screen.dart`.
- **`product_details_screen.dart`** — shows everything about one product. The quantity stepper is just local state (`_quantity`) on this screen; tapping "Add to Cart" calls `context.read<CartProvider>().addToCart(product, quantity: _quantity)`.
- **`cart_screen.dart`** — reads the live cart with `context.watch<CartProvider>()`, so it automatically updates whenever you add/remove/change quantity anywhere in the app. Swiping a row left removes it (`Dismissible`). "Checkout" just shows a thank-you dialog and clears the cart — there's no payment.
- **`profile_screen.dart`** — static profile card + the dark mode switch + the static orders list + a "Logout" button that sends you back to the login screen.

## Things you should be ready to explain in an interview

- **"Why Provider and not setState everywhere?"** — Because the cart needs to be visible/editable from three different screens (Home's "Add to Cart" snackbar, the Cart tab, and the bottom-nav badge count). `setState` only affects one widget's own subtree; `Provider` lets any widget anywhere read or react to the same shared cart state.
- **"How does the cart total get calculated?"** — `CartProvider.totalPrice` sums `quantity * price` across every item in the cart map, recalculated live every time it's read.
- **"How does dark mode persist?"** — `ThemeProvider` saves a single boolean to `shared_preferences` (simple key-value storage on the device) every time it's toggled, and reads it back on app startup.
- **"Why is there no backend?"** — The task explicitly said backend integration wasn't required; all products and orders are hard-coded Dart lists in `data/`.

## If something doesn't run

Most first-time Flutter errors are version-related. If `flutter pub get` or `flutter run` shows an error, copy the exact error message — it's almost always one of: a missing platform folder (run `flutter create .` in the project root once), a Flutter SDK version mismatch (run `flutter upgrade`), or a typo from manual copy-pasting. Happy to help you debug if you paste the error.
