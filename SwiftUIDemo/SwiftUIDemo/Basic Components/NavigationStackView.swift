//
//  NavigationStackView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 21/03/23.
//

import SwiftUI

struct NavigationStackView: View {
    
    var platforms: [PlatformModel] = [.init(name: "Xbox", image: "keyboard", color: .green),
                                      .init(name: "PC", image: "tv.music.note", color: .indigo),
                                      .init(name: "Mobile", image: "video", color: .pink),
                                      .init(name: "PlayStation", image: "desktopcomputer", color: .mint)]
    
    var games: [GamesModel] = [.init(name: "Minecraft", rating: "99"),
                               .init(name: "God of War", rating: "90"),
                               .init(name: "Baseball", rating: "80"),
                               .init(name: "ice hockey", rating: "88")]
    
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                Section(header: Text("Platform")) {
                    ForEach(platforms, id: \.self) { platform in
                        Label(platform.name, systemImage: platform.image)
                            .foregroundColor(platform.color)
//                        NavigationLink(value: platform) {
//
//                        }
                    }
                }
                
                Section(header: Text("Games")) {
                    ForEach(games, id: \.self) { game in
                        Text(game.name)

//                        NavigationLink(value: game) {
//                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: PlatformModel.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    VStack {
                        Label(platform.name, systemImage: platform.image)
                            .font(.largeTitle).bold()
                        List {
                            Section(header: Text("Games")) {
                                ForEach(games, id: \.self) { game in
                                    NavigationLink(value: game) {
                                        Text(game.name)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: GamesModel.self) { game in
                VStack(spacing: 20) {
                    Text("\(game.name) - \(game.rating)")
                        .font(.largeTitle).bold()

                    Button("Recommend Another Game") {
                        navigationPath.append(games.randomElement()!)
                    }

                    Button("Go To Another Platform") {
                        navigationPath.append(platforms.randomElement()!)
                    }

                    Button("Go To Home") {
                        navigationPath.removeLast(navigationPath.count)
                    }
                }
            }
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
