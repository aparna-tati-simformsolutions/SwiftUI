//
//  TabView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 06/03/23.
//

import SwiftUI

struct LeafBoardTabView: View {
    
    @State private var selection = 0
    
    init() {
        UITabBarItem.appearance().badgeColor = .purple
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            tabView
            HStack {
                Button(action: {
                    if selection > 0 {
                        selection = (selection - 1) % 4
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(.headline, design: .rounded))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("navyBlue"))
                        .cornerRadius(radius: 10.0, corners: .allCorners)
                        .padding()
                }
                Spacer()
                Button(action: {
                    selection = (selection + 1) % 4
                }) {
                    Image(systemName: "arrow.right")
                        .font(.system(.headline, design: .rounded))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("navyBlue"))
                        .cornerRadius(radius: 10.0, corners: .allCorners)
                        .padding()
                }
            }
            
            
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
        TabView(selection: $selection) {
            Text("Home Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                .badge(2)
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Bookmark")
                }
                .tag(1)
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Home")
                }
                .tag(2)
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(Color("navyBlue"))
    }
}
