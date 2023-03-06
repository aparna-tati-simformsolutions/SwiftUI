//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 03/03/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        loginView
    }
}

extension LoginView {

    private var loginView: some View {
        VStack {
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            headings
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            textFields
            loginButton
            divider
            socialLoginButtons
            Spacer()
        }
    }

    private var headings: some View {
        Group {
            Label {
                Text("Leafboard")
                    .font(.system(.title))
            } icon: {
                Image("logo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            Text("Work without limits")
        }
    }

    private var textFields: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Your email address")
                TextField("Username", text: $email)
                    .roundedTextField()
                    .keyboardType(.emailAddress)
            }
            .padding(15)
            VStack(alignment: .leading) {
                Text("Choose a password")
                SecureTextField(text: $password)
                    .roundedTextField()
                    .keyboardType(.asciiCapable)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 20)
        }
    }

    private var loginButton: some View {
        Button {
            print("Button Clicked")
        } label: {
            HStack {
                Spacer()
                Text("Continue")
                Spacer()
                Image(systemName: "arrow.right")
            }
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width - 30, height: 50)
        .background(Color("lightGray"))
        .foregroundColor(.gray)
        .clipShape(Capsule())
        .padding(.bottom, 20)
    }
    
    private var divider: some View {
        HStack {
            Rectangle().fill(Color("lightGray")).frame(width: UIScreen.main.bounds.width / 2 - 40, height: 1)
            Text("Or")
                .foregroundColor(Color.gray)
            Rectangle().fill(Color("lightGray")).frame(width: UIScreen.main.bounds.width / 2 - 40, height: 1)
        }
    }
    
    private var socialLoginButtons: some View {
        Group {
            Button {
                print("Sign up with Google")
            } label: {
                HStack {
                    Image("google").resizable().frame(width: 25, height: 25)
                    Text("Sign up with Google")
                }.roundedButton()
            }
            .padding()
            Button {
                print("Sign up with Apple")
            } label: {
                HStack {
                    Image("apple").resizable().frame(width: 25, height: 25)
                    Text("Sign up with Apple")
                }.roundedButton()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func roundedTextField() -> some View {
        self
            .padding(10)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 5))
            .frame(height: 50)
            .accentColor(.gray)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("lightGray"), style: StrokeStyle(lineWidth: 1)))
    }
    
    func roundedButton() -> some View {
        self
            .foregroundColor(Color.black)
            .frame(width: UIScreen.main.bounds.width - 35, height: 50)
            .overlay(RoundedRectangle(cornerRadius: 40)
                .stroke(Color.gray, lineWidth: 1)
            )
            
    }
}
