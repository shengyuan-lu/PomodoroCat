import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            ScrollView {
                Text("Hello, world!")
                    .padding()
            }
            .navigationBarTitle(Text("TomatoCat"))
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
