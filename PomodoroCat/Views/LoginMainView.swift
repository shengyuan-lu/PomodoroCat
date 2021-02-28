//
//  LoginMainView.swift
//  PomodoroCat
//
//  Created by Jingqi Yao on 2021/2/28.
//

import SwiftUI
import Parse

struct LoginMainView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var showLoginView: Bool = false
    var body: some View {
        VStack {
            if showLoginView {
                MainView()
            } else {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                    TextField("Enter your username...", text: $username)
                        .padding()
                    SecureField("Enter your password...", text: $password)
                        .padding()
                        .padding(.bottom)
                    HStack {
                        Button(" Sign In ") {
                            PFUser.logInWithUsername(inBackground: username, password: password) {
                                (user, error) in
                                if user != nil { // successful login
                                    print("Sign in successed")
                                    self.showLoginView = true
                                } else {
                                    print("Error: \(String(describing: error?.localizedDescription))")
                                }
                            }
                        }
                        .padding(5)
                        .background(Color("themeGreen"))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        Button(" Sign Up ") {
                            let user = PFUser()
                            user.username = username
                            user.password = password
                            
                            user.signUpInBackground { (success, error) in
                                if success {
                                    print("Sign in successed")
                                    self.showLoginView = true
                                } else {
                                    print("Error: \(String(describing: error?.localizedDescription))")
                                }
                            }
                        }
                        .padding(5)
                        .background(Color("themeRed"))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                    }
                    .padding(.trailing, 50)
                    .padding(.leading, 50)
                    .padding(.bottom, 80)
                }
            }
        }
    }
}


struct LoginMainView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMainView()
    }
}
