# Frontend
This is the repository for the code for the Canopy Frontend App.

*Please contact us through Edwin Lagos if you have issues running the frontend or backend.*

*During judging, we are running the server on our computer. If the app does not work, please run the backend server yourself and change the server URL in `Constants.swift` to use your local server.*
*`static let baseURL = URL(string: "http://localhost:8000")!`*

## Testing
It is not possible to download the app directly on your phone as the App Store review process would have taken too long.

To run the app:
1. Download Xcode 12 from the Mac App Store
2. Download this repository to your computer
3. Open the .xcodeproj file in Xcode
4. Create a new file called `Keys.swift`, which contains API keys that were not uploaded to this repository
```swift
struct Keys {
    static let imgurClientID = "Your Imgur API Client ID"
    static let googleClientID = "Your Google OAuth Client ID"
}
```
5. Build and run the project on an iPhone connected over USB
