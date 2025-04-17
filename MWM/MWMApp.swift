
import SwiftUI
import SwiftData

@main
struct MWMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: User.self)
    }
}

