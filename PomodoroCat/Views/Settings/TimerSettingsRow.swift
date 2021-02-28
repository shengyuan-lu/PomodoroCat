import SwiftUI

struct TimerSettingsRow: View {
    
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
                .fontWeight(.regular)
                .foregroundColor(Color.primary)
                .padding(.leading, 5)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Spacer()
            
            Text(secondText)
                .fontWeight(.regular)
                .foregroundColor(Color.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .accentColor(Color(.systemGray2))
            
        }
        
    }
}

// MARK: - Preview
struct TimerSettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        TimerSettingsRow(iconName: "gear", iconColor: Color.blue, firstText: "Application", secondText: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

