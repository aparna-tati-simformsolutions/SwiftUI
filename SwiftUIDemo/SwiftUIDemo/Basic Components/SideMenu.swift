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
    let image: String
}

struct MenuContent: View {
    
    let items: [MenuItem] = [
        MenuItem(text: "Home", image: "house"),
        MenuItem(text: "Settings", image: "gearshape.fill"),
        MenuItem(text: "Profile", image: "person.crop.circle"),
        MenuItem(text: "Notifications", image: "bell"),
        MenuItem(text: "Flight Mode", image: "airplane"),
        MenuItem(text: "Share", image: "square.and.arrow.up")
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                    .frame(height: 50)
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30, alignment: .center)
                        
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
    @Binding var isBackButtonHide: Bool
    
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
                isBackButtonHide = false
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
    @State private var isBackButtonHide = false
    
    var body: some View {
        ZStack {
            if !isMenuOpened {
                Button {
                    self.isMenuOpened.toggle()
                    isBackButtonHide = true
                } label: {
                    Text("Open Menu")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .cornerRadius(10)
                }
            }
            SideMenuView(width: UIScreen.main.bounds.width / 1.5, menuOpened: isMenuOpened, toggleMenu: toggleMenu, isBackButtonHide: $isBackButtonHide)
        }.edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(isBackButtonHide)
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
