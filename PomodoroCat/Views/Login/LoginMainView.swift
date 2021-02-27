//
//  LoginMainView.swift
//  PomodoroCat
//
//  Created by Jingqi Yao on 2021/2/28.
//

import SwiftUI
import Firebase

// Main view where user can login in using Email Link Authentication.
struct LoginMainView: View {
    @State private var email: String = ""
    @State private var isPresentingSheet = false
    
    // This property will cause an alert view to display when it has a non-null value.
    @State private var alertItem: AlertItem? = nil
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                CustomStyledTextField(
                    text: $email, placeholder: "Email", symbolName: "person.circle.fill"
                )
                
                CustomStyledButton(title: "Send Sign In Link", action: sendSignInLink)
                    .disabled(email.isEmpty)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Login To PomodoroCat")
        }
        .onOpenURL { url in
            let link = url.absoluteString
            if Auth.auth().isSignIn(withEmailLink: link) {
                passwordlessSignIn(email: email, link: link) { result in
                    switch result {
                    case let .success(user):
                        isPresentingSheet = user?.isEmailVerified ?? false
                    case let .failure(error):
                        isPresentingSheet = false
                        alertItem = AlertItem(
                            title: "An authentication error occurred.",
                            message: error.localizedDescription
                        )
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentingSheet) {
            SuccessView(email: email)
        }
        .alert(item: $alertItem) { alert -> Alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message)
            )
        }
    }
    
    // MARK: Firebase
    private func sendSignInLink() {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://pomodorocat.page.link/zXbp")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        
        Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings) { error in
            if let error = error {
                alertItem = AlertItem(
                    title: "The sign in link could not be sent.",
                    message: error.localizedDescription
                )
            }
        }
    }
    
    private func passwordlessSignIn(email: String, link: String,
                                    completion: @escaping (Result<User?, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, link: link) { result, error in
            if let error = error {
                print("Authentication error: \(error.localizedDescription).")
                completion(.failure(error))
            } else {
                print("Authentication was successful.")
                completion(.success(result?.user))
            }
        }
    }
}

// Model object for an `Alert` view.
struct AlertItem: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}

// A custom styled TextField with an SF symbol icon.
struct CustomStyledTextField: View {
    @Binding var text: String
    let placeholder: String
    let symbolName: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .imageScale(.large)
                .padding(.leading)
            
            TextField(placeholder, text: $text)
                .padding(.vertical)
                .autocapitalization(.none)
        }
        .background(
            RoundedRectangle(cornerRadius: 16.0, style: .circular)
                .foregroundColor(Color(.secondarySystemFill))
        )
    }
}

// A custom styled button with a custom title and action.
struct CustomStyledButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            // Embed in an HStack to display a wide button with centered text.
            HStack {
                Spacer()
                Text(title)
                    .padding()
                    .accentColor(.white)
                Spacer()
            }
        }
        .background(Color("themeGreen"))
        .cornerRadius(16.0)
    }
}

// Displayed when a user successfuly logs in.
struct SuccessView: View {
    let email: String
    
    var body: some View {
        TabView {
            TimerMainView()
                .tabItem {
                    Label("Pomodoro", systemImage: "timer")
                }
                .tag(1)
            
            CatMainView()
                .tabItem {
                    Label("Cat", systemImage: "hare.fill")
                }
                .tag(2)
        }
    }
}

struct LoginMainView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMainView()
    }
}
