# RetroAPIPackage

A fully fledged Swift 5 wrapper for the [RetroAchievements](https://retroachievements.org/APIDemo.php) PHP API. Two sets of functions are included, one utilizing publisbers and Combine, the other using non-reactive URLSessions with escaping completion handlers.

## Reactive Example

0. Import the Package in relevant files.
```swift
import RetroAPI
import Combine
```
1. Initialize the API.

Somewhere in your code, preferably somewhere that loads earliest, include the following function call with your RetroAchievements API username and key.
```swift
RetroAPI.setUserAndKey("your-username-here", "your-key-here")
```
For instance, you could include it in your App struct as follows:
```swift
@main
struct RetroAPIExample: App {

    @Environment(\.scenePhase) private var scenePhase
    let viewModel = RetroAPIViewModel() //A possible view model instance
    
    init() {
        //Option #1:
        RetroAPI.setUserAndKey("your-username-here", "your-key-here") //replace your username and key
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                //Option #2:
                RetroAPI.setUserAndKey("your-username-here", "your-key-here") //replace your username and key
                break
            case .inactive:
                break
            default:
                break
            }
        }
    }
}
```

2. Call the provided function that returns the topTenUsers `Publisher` and `.sink` the value as you see fit
```swift

@Published var topUsers = [TopUser_DTO]()
private var cancellables = [AnyCancellable]()

func getTopTenUsers() {
    RetroAPI.getTopTenUsers()
        .sink(receiveCompletion: {_ in}) { topUsers in
            
            self.topUsers = topUsers
            
        }.store(in: &cancellables)
}
```
Notice that `topUsers` is of type `[TopUser_DTO]`. This is to distinguish this struct as result from the API so that you can be flexible with your naming.

## Non-Reactive Example

Steps 0. and 1. are the same. You do not need to `import Combine`.

2. Call the provided function that returns topUsers of type `[TopUser_DTO]`.
```swift

@Published var topUsers = [TopUser_DTO]()

func getTopTenUsers() {
    RetroAPI.getTopTenUsers { (topUsers) in
        self.topUsers = topUsers
    }
}
```
Notice that `topUsers` is of type `[TopUser_DTO]`. This is to distinguish this struct as result from the API so that you can be flexible with your naming.
