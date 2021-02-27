import SwiftUI

struct SettingsIcon: View {
    
    // MARK: - Variable
    var iconName: String
    var iconColor: Color
    
    // MARK: - View
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(iconColor)
            Image(systemName: iconName)
                .foregroundColor(.white)
        }
        .frame(width: 36, height: 36, alignment: .center)
        
    }
}

// MARK: - Preview
struct SettingsIcon_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIcon(iconName: "globe", iconColor: Color.blue)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
