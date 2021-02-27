import SwiftUI

struct SettingsRowTypeAbout: View {
    
    // MARK: - Variable
    var iconName: String
    var iconColor: Color
    var firstText: LocalizedStringKey
    var secondText: LocalizedStringKey
    
    init(iconName: String, iconColor: Color, firstText: String, secondText: String) {
        self.iconName = iconName
        self.firstText = LocalizedStringKey(firstText)
        self.secondText = LocalizedStringKey(secondText)
        self.iconColor = iconColor
    }

    // MARK: - View
    var body: some View {
        HStack {
            
            SettingsIcon(iconName: iconName, iconColor: iconColor)
            
            Text(firstText)
                .foregroundColor(Color.secondary)
                .padding(.leading, 5)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Spacer()
            
            Text(secondText)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        
    }
}

// MARK: - Preview
struct SettingsRow1_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowTypeAbout(iconName: "gear", iconColor: Color.blue, firstText: "Application", secondText: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

