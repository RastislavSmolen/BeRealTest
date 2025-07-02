# BeRealTest

BeRealTest - Instagram-like Story Feed (Technical Test)

Overview

This project implements a simplified Instagram-style story and post feed using SwiftUI and MVVM architecture.
    • Infinite scrolling for posts and stories.
    • Async loading simulation with delays.
    • Modular and scalable code structure.
    • Basic UI components and navigation.
    • Basic tests of the models 

⸻

How to Run
    1.    Open the project in Xcode 15 or later.
    2.    Build and run the app on the iOS Simulator or a physical device.
    3.    The feed and stories will load automatically with simulated network delay (~1 second).
    4.    Scroll to the bottom of the feed to trigger infinite loading of posts.
    5.    Tap on user images or posts to interact (some UI elements are placeholders).

⸻

What’s Missing
    •    Real Networking: Data is generated locally with dummy URLs and random content, no real API integration.
    •    Story Detail Screen: No detailed story viewer implemented yet.
    •    Persistence: No caching or offline support.
    •    Error Handling: No error states or retry mechanisms for failed loads.
    •    Basic layout without advanced styling or smooth story transitions.
    •    Unit tests cover only ViewModels with simulated delays; UI tests are missing.
    •    Performance Optimization: Currently uses fixed delays; real-world apps should use Combine or async/await for better responsiveness.

⸻

Technical Choices & Justifications
    •    SwiftUI + MVVM: Allows declarative UI and clear separation of UI and logic, facilitating scalability.
    •    @Published + ObservableObject: Simple state management fitting SwiftUI’s reactive updates.
    •    DispatchQueue for delay: Simulates network latency without external dependencies.
    •    Modular Views and ViewModels prepared for extension.

⸻

Future Improvements
    •    Replace simulated delay with real API calls and proper pagination.
    •    Implement Story detail view with swipe navigation.
    •    Add offline caching with Core Data or Realm.
    •    Enhance UI with animations and accessibility.
    •    Introduce dependency injection for easier testing.
    •    Use async/await and Combine for modern concurrency management.

⸻
