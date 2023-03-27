//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 01/03/23.
//

import SwiftUI

struct Contents: Identifiable {
    var id = UUID()
    let text: String
}

struct ContentsRow: View {
    
    var text: String
    
    var body: some View {
        Text(text)
    }
}

enum MenuContents: String {
    case text = "Text"
    case label = "Label"
    case textField = "TextField"
    case form = "Form"
    case modalAndSheet = "Modal & Sheet"
    case search = "Search Bar"
    case sideMenu = "Side Menu"
    case propertyWrapper = "Property Wrapper"
    case navigationView = "Navigation View"
    case navigationStack = "Navigation Stack"
    case login = "Login Demo & API Calling"
    
    static let uiSection: [MenuContents] = [.text, .label, .textField, .form, .modalAndSheet, .search, .sideMenu]
    static let loginAndAPICallingSection: [MenuContents] =  [.login]
    static let navigationSection: [MenuContents] = [.navigationView, .navigationStack]
    static let propertyWrapperSection: [MenuContents] = [.propertyWrapper]
}

struct ContentView: View {
    
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationView {
            List {
                makeSection(title: "UI Components", items: MenuContents.uiSection)
                makeSection(title: "Navigation", items: MenuContents.navigationSection)
                makeSection(title: "Property Wrapper", items: MenuContents.propertyWrapperSection)
                makeSection(title: "Login & API Calling", items: MenuContents.loginAndAPICallingSection)
            }
        }
    }
    
    private func makeSection(title: String, items: [MenuContents]) -> some View {
        Section(header: Text(title)
            .bold()
            .font(.system(size: 18))
            .foregroundColor(.black)) {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: self.destination(forItem: item)) {
                        Text(item.rawValue)
                    }
                }
            }
    }
    
    private func destination(forItem item: MenuContents) -> some View {
        switch item {
        case .text: return AnyView(SwiftUIText())
        case .label: return AnyView(SwiftUILabel())
        case .textField: return AnyView(SwiftUITextField())
        case .form: return AnyView(FormView())
        case .modalAndSheet: return AnyView(ModalWithSheetView())
        case .search: return AnyView(SearchView())
        case .sideMenu: return AnyView(SideMenu())
        case .propertyWrapper: return AnyView(PropertyWrapperFirstView())
        case .navigationView: return AnyView(FirstNavigationView())
        case .navigationStack: return AnyView(NavigationStackView())
        case .login: return AnyView(WelcomeView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextStyle: View {
    var text: String
    
    var body: some View {
        Label(text, image: "")
            .frame(width: 170, height: 60)
            .padding(5)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(40)
            .font(.title3)
    }
}
