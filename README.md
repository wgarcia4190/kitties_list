
# Kitties_List

Kitties_List is an iOS application that displays a list of random cats using the Cataas API. The app allows users to save their favorite cats. It is built using the MVVM architecture, SwiftUI for the UI, Alamofire for network requests, Nuke for image loading, and SwiftData for local storage.

## Features

- Display a list of random cats.
- Save and view favorite cats.
- Smooth image loading and caching.

## Technologies Used

- **MVVM (Model-View-ViewModel)**: Architecture pattern to separate concerns.
- **SwiftUI**: Declarative framework for building user interfaces.
- **Alamofire**: HTTP networking library for making network requests.
- **Kingfisher**: Image loading and caching framework.
- **SwiftData**: Framework for local data storage.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## Installation

1. Clone the repository:
   \`\`\`sh
   git clone https://github.com/yourusername/Kitties_List.git
   cd Kitties_List
   \`\`\`

2. Open the project in Xcode:
   \`\`\`sh
   open Kitties_List.xcodeproj
   \`\`\`

3. Install the dependencies using Swift Package Manager (SPM):
   - In Xcode, go to \`File\` > \`Swift Packages\` > \`Add Package Dependency...\`
   - Add the following packages:
     - Alamofire: \`https://github.com/Alamofire/Alamofire.git\`
     - Nuke: \`https://github.com/kean/Nuke.git\`

4. Build and run the project:
   \`\`\`sh
   cmd + R
   \`\`\`

## Usage

- On launching the app, you will see a list of random cats fetched from the Cataas API.
- To save a cat to your favorites, simply tap on the heart icon.
- View your favorite cats by navigating to the Favorites tab.

## Architecture

### MVVM (Model-View-ViewModel)

- **Model**: Represents the data and business logic.
- **View**: Displays the data provided by the ViewModel.
- **ViewModel**: Handles the presentation logic and interacts with the Model to fetch and manipulate data.

### SwiftUI

- Declarative framework to build user interfaces, enabling the creation of responsive and dynamic UIs.

### Alamofire

- Handles network requests to the Cataas API to fetch random cats.

### Kingfisher

- Manages image loading, caching, and displaying.

### SwiftData

- Handles local storage of favorite cats, providing persistence and retrieval functionalities.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License.

## Acknowledgements

- [Cataas API](https://cataas.com/#/)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
- [SwiftData](https://developer.apple.com/documentation/coredata)

---

Feel free to customize this README.md as per your project's specific needs.
