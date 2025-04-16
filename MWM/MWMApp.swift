
import SwiftUI
import SwiftData

@main
struct MWMApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView().modelContainer(for: User.self)
        }
    }
}

