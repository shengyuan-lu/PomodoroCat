import Foundation
import SwiftUI

struct ProfileView: View {
    
    // MARK: - Variable
    let cornerRadius:CGFloat = 10
    let profileHeight:CGFloat = 120
    
    let genius:Genius
    
    // MARK: - View
    var body: some View {
        
        GeometryReader(content: { geometry in
            HStack {
                
                Image(genius.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width/3 - 20, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                
                VStack(alignment: .leading) {
                    
                    Text(genius.role)
                        .foregroundColor(.pink)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    
                    Text(genius.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    
                    Spacer()
                    
                    Text(genius.bio)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .minimumScaleFactor(0.1)
                }
                .padding(.leading, 10)
            }
            .padding(.horizontal, 10)
            .cornerRadius(cornerRadius)
        })
        .frame(height: profileHeight)
        
    }
    
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(genius: geniusArray[0])
            .previewLayout(.fixed(width: 375, height: 150))
            .padding()
    }
}
