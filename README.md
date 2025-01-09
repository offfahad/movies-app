# 🎬 Movies App

A Flutter app to browse the latest movies using the IMDb API. The app is built with advanced state management using Riverpod and follows the MVVM architecture. Users can view movie details, add movies to their favorites (stored locally using Shared Preferences), and enjoy smooth pagination for movie lists.

---

## 📱 Features

- **Latest Movies**: Displays a list of the latest movies fetched from the IMDb API.
- **Movie Details**: Detailed information about each movie, including title, synopsis, rating, and more.
- **Favorites**: Users can add/remove movies to/from their favorites, stored locally using Shared Preferences.
- **Pagination**: Smooth pagination for infinite scrolling of movies.
- **Secure API Handling**: The IMDb API key is securely managed using the `flutter_dotenv` package.
- **Cached Images**: Efficient image loading and caching using the `cached_network_image` package.
- **Dependency Injection**: Clean dependency management using the `get_it` package.
- **Clean Architecture**: Implements MVVM architecture for a scalable and maintainable codebase.

---

## 🔧 Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) (Advanced State Management)
- **Dependency Injection**: [Get It](https://pub.dev/packages/get_it)
- **Local Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **API Handling**: [HTTP](https://pub.dev/packages/http)
- **Environment Variables**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- **Image Caching**: [Cached Network Image](https://pub.dev/packages/cached_network_image)

---

## 🚀 Getting Started

### Prerequisites
1. Install [Flutter](https://flutter.dev/docs/get-started/install) on your machine.
2. Get an API key from [IMDb API](https://www.imdb.com/apis).
3. Ensure you have an emulator or a physical device for testing.

---

### Key Changes:
- Added the packages you specified in a separate **Packages Used** section for clarity.
- Updated the **Features** and **Tech Stack** sections to include functionality enabled by these packages.
- Ensure your `.env` file is properly ignored using `.gitignore`.

## 🖼️ Screenshots

![Screenshot_1736423052-imageonline co-merged-imageonline co-merged](https://github.com/user-attachments/assets/71133978-a46a-4346-9c8e-8840fb76c312)


