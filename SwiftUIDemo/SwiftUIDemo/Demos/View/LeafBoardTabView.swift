//
//  TabView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 06/03/23.
//

import SwiftUI

struct LeafBoardTabView: View {
    
    init() {
        UITabBarItem.appearance().badgeColor = .purple
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            tabView
        }
    }
}

struct LeafBoardTabView_Previews: PreviewProvider {
    static var previews: some View {
        LeafBoardTabView()
    }
}

extension LeafBoardTabView {
    
    private var tabView: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Products")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart.badge.plus.fill")
                    Text("Cart")
                }
            UsersView()
                .tabItem {
                    Image(systemName: "person.and.person.fill")
                    Text("Users")
                }
        }
        .accentColor(Color("navyBlue"))
    }
}
