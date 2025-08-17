# Fleet Scheduling Application

This iOS application is designed to manage and schedule a fleet of trucks and their associated chargers. It provides functionalities for viewing and managing chargers and trucks, as well as an assignment algorithm for efficient scheduling.

## Features

*   **Charger Management:** View and manage available chargers.
*   **Truck Management:** View and manage trucks in the fleet.
*   **Assignment Algorithm:** Efficiently assign chargers to trucks based on predefined criteria.

## Project Structure

The project is organized into several modules, each responsible for a specific part of the application:

*   **`AppContainer`**: Contains the main application entry point and overall UI structure.
*   **`ChargerModule`**: Handles all logic and UI related to chargers, including data sources, views, and view models.
*   **`TruckModule`**: Manages truck-related logic and UI, similar to the ChargerModule.
*   **`ScheduleModule`**: Implements the core assignment algorithm and scheduling views.
*   **`Helpers`**: Contains utility functions and helper classes used across the application.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

*   Xcode (version 15.0 or later recommended)
*   macOS (latest version recommended)

### Building and Running

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/deepak111222/FleetScheduling.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd FleetScheduling
    ```
3.  **Open the project in Xcode:**
    ```bash
    open FleetScheduling.xcodeproj
    ```
4.  **Select a simulator or a physical device** from the Xcode scheme dropdown.
5.  **Run the application** using the `Cmd + R` shortcut or by clicking the "Run" button in Xcode.

## Testing

Unit tests are provided for key view models and the assignment algorithm:

*   **`FleetSchedulingTests/AssignmentViewModelTests.swift`**
*   **`FleetSchedulingTests/ChargerListViewModelTests.swift`**
*   **`FleetSchedulingTests/TruckListViewModelTests.swift`**

To run tests:

1.  Open the project in Xcode.
2.  Go to `Product` > `Test` or use the shortcut `Cmd + U`.

## Future Enhancements

*   Implement persistent data storage.
*   Add user authentication.
*   Improve the assignment algorithm with more complex criteria.
*   Develop a more comprehensive reporting system.

## Contributing

If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details (if applicable).
