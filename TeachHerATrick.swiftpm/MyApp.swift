import SwiftUI

@main
struct MyApp: App {
    let viewModel = Model()
    @StateObject var audioManager = AudioManager.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}
