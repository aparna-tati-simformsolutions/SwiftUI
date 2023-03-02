//
//  SwiftUITextField.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 02/03/23.
//

import SwiftUI

struct SecureTextField: View {
    
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("Password", text: $text)
            } else {
                if text.isEmpty {
                    TextField("Password", text: $text)
                } else {
                    TextField(text, text: $text)
                }
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash" : "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}

struct SwiftUITextField: View {
    
    @State private var defaultTF: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Default TextField", text: $defaultTF, onEditingChanged: { (isBegin) in
                    if isBegin {
                        print("Begins Editing")
                    } else {
                        print("Ends Editing")
                    }
                }, onCommit: {
                    print("Commit")
                })
                .padding(10)
            TextField("Rounded TextField", text: $defaultTF)
                .padding(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Oval TextField", text: $defaultTF)
                .foregroundColor(.white)
                .ovalTextField()
                .padding(5)
            HStack {
                Text("Username")
                TextField("Username", text: $defaultTF)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(10)
            VStack(alignment: .leading) {
                Text("Username")
                TextField("Username", text: $defaultTF)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(10)
            TextField("Box TextField", text: $defaultTF)
                .padding(8)
                .textContentType(.emailAddress)
                .border(Color.purple, width: 2)
                .padding(8)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Underline TextField", text: $defaultTF).font(.footnote)
            }.underlineTextField()
            SecureField("Password", text: $defaultTF)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureTextField(text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}


struct SwiftUITextField_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextField()
    }
}

extension View {
    func ovalTextField() -> some View {
        self
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
    
    func underlineTextField() -> some View {
        self
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.indigo)
            .padding(10)
    }
}
