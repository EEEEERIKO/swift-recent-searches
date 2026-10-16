# Swift Recent Searches

A simple iOS application built with **Swift, UIKit, and Storyboard** that stores and displays the five most recent searches using `UserDefaults`.

## Features

- **Save searches:** Store search terms locally using `UserDefaults`.
- **Recent search history:** Display the five most recent searches.
- **Automatic history limit:** Remove the oldest search when a new entry exceeds the five-item limit.
- **Input validation:** Prevent empty or whitespace-only searches.
- **Clear history:** Delete all saved searches.
- **Persistent storage:** Keep search history between app launches.

## Technologies

- Swift
- UIKit
- Storyboard
- `UserDefaults`
- `UITableView`
- Auto Layout

## Project Structure

```text
SwiftRecentSearches/
├── SearchHistoryManager.swift
├── SearchViewController.swift
├── Main.storyboard
└── Assets.xcassets
```

*The exact file organization may vary depending on the Xcode project structure.*

## How It Works

1. The user enters a search term.
2. The app validates the input and removes unnecessary whitespace.
3. `SearchHistoryManager` saves the term in `UserDefaults`.
4. The history is limited to five entries by removing the oldest search when necessary.
5. The table view displays the most recent search first.
6. The user can clear the entire search history.

## Getting Started

1. Clone the repository:

   ```bash
     git clone https://github.com/EEEEERIKO/swift-recent-searches.git
   ```

2. Open the `.xcodeproj` file in Xcode.
3. Select an iOS Simulator or a connected device.
4. Build and run the application using `⌘R`.

## Learning Objectives

This project demonstrates:

- Local data persistence with `UserDefaults`.
- Separation of responsibilities using a dedicated manager class.
- Input validation and string manipulation.
- Updating a `UITableView` with stored data.
- Implementing a bounded collection that retains only the latest five entries.

## Author

Erik Valencia Cardona

## License

This project is intended for educational purposes.
