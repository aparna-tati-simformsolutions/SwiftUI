//
//  SideMenu.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 27/03/23.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    let text: String
    let handler: () -> Void = {
        print("Tapped Item")
    }
}

struct MenuContent: View {
    
    let items: [MenuItem] = [
        MenuItem(text: "Home"),
        MenuItem(text: "Settings"),
        MenuItem(text: "Profile"),
        MenuItem(text: "Activty"),
        MenuItem(text: "Flights"),
        MenuItem(text: "Share")
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    HStack {
                        Text(item.text)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 22))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .onTapGesture {
                        
                    }
                    .padding()
                    Divider()
                }
                Spacer()
            }
            .padding(.top, 25)
        }
    }
}

struct SideMenuView: View {
    
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    
    var body: some View {
        ZStack {
            // Dimmed Background View
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            
            // Menu Content
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                Spacer()
            }
        }
    }
}

struct SideMenu: View {
    
    @State private var isMenuOpened = false
    
    var body: some View {
        ZStack {
            if !isMenuOpened {
                Button {
                    self.isMenuOpened.toggle()
                } label: {
                    Text("Open Menu")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .cornerRadius(10)
                }
            }
            
            SideMenuView(width: UIScreen.main.bounds.width / 1.5, menuOpened: isMenuOpened, toggleMenu: toggleMenu)
        }.edgesIgnoringSafeArea(.all)
    }
    
    func toggleMenu() {
        isMenuOpened.toggle()
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
