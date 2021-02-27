import SwiftUI

struct SettingsView: View {
    
    // MARK: - Variable
    @Environment(\.presentationMode) var presentationMode
    
    // 0 = default, 1 = light, 2 = dark
    @AppStorage("themeIndex") private var themeIndex = 1
    
    // MARK: - View
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            // Form
            Form {
                
                Section(header: Text("Developers")) {
                    
                    NavigationLink(
                        destination: GeniusView(),
                        label: {
                            SettingsRowTypeAbout(iconName: "person.fill", iconColor: Color.pink, firstText: "Creators", secondText: "Stanford Rejects")
                                .padding(.vertical)
                        }).id(UUID())
                    
                }
                
                /*
                 // Language Section
                 Section(header: Text("Language")){
                 Picker(LocalizedStringKey("Language"), selection: $languageIndex) {
                 Text("🌐 Default").tag(0)
                 Text("🇺🇸 English").tag(1)
                 Text("🇨🇳 Chinese").tag(2)
                 
                 }
                 .id(UUID())
                 .pickerStyle(DefaultPickerStyle())
                 .padding()
                 
                 HStack {
                 Spacer()
                 Text("This is an experimental feature")
                 .multilineTextAlignment(.center)
                 .font(.footnote)
                 .foregroundColor(.secondary)
                 Spacer()
                 }
                 }
                 */
                
                // Theme Section
                Section(header: Text("Theme")) {
                    Picker(LocalizedStringKey("Theme"), selection: $themeIndex) {
                        Text("Light").tag(0)
                        Text("Dark").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                }
                
                // About Section
                Section(header: Text("About")) {
                    SettingsRowTypeAbout(iconName: "apps.iphone", iconColor: Color.blue, firstText: "Application", secondText: "PomodoroCat")
                    SettingsRowTypeAbout(iconName: "checkmark.circle.fill", iconColor: Color.green, firstText: "Compatibility", secondText: "iPhone")
                    SettingsRowTypeAbout(iconName: "flag", iconColor: Color.red, firstText: "App Version", secondText: "\(AppVersion.version!)")
                }
                .padding(.vertical, 3)
                
                // Link Section
                Section(header: Text("Links")) {
                    SettingsRowTypeLink(iconName: "globe", iconColor: Color.orange, text: "Developer Website", link: "https://www.google.com")
                    SettingsRowTypeLink(iconName: "hand.raised.fill", iconColor: Color.gray, text: "Privacy Policy", link: "https://www.google.com")
                }
                .padding(.vertical, 3)
                
                // Footer
                HStack {
                    Spacer()
                    Text("Made with ♡ and boba in Irvine, California")
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .edgesIgnoringSafeArea(.all)
            
            
        }
        .statusBar(hidden: true)
        .navigationBarTitle("Settings", displayMode: .inline)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.left.circle.fill")
                                        Text("Back")
                                    }
                                })
        
        
    }
    
}

// MARK: - Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
