//
//  PeelEffect.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 24/03/23.
//

import SwiftUI

struct PeelEffect<Content: View>: View {
    
    var content: Content
    var onDelete: () -> ()
    @State private var dragProgress: CGFloat = 0
    
    init(@ViewBuilder content: @escaping () -> Content, onDelete: @escaping () -> ()) {
        self.content = content()
        self.onDelete = onDelete
    }
    
    var body: some View {
        content
            .hidden()
            .overlay(content: {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.red.gradient)
                        .overlay(alignment: .trailing) {
                            Button {
                                print("Tapped")
                            } label: {
                                Image(systemName: "trash")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.trailing, 15)
                                    .foregroundColor(.white)
                                    .contentShape(Rectangle())
                            }

                        }
                        .padding(.vertical, 8)
                        content
                        .mask {
                            Rectangle()
                                .padding(.trailing, dragProgress * rect.width)
                        }
                }
            })
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    let size = $0.size
                    let minOpacity = dragProgress / 0.5
                    let opacity = min(1, minOpacity)
                    
                    let dragGesture = DragGesture()
                        .onChanged { value in
                            let transitionX = max(-value.translation.width, 0)
                            dragProgress = min(1, transitionX / size.width)
                        }
                        .onEnded { value in
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                if dragProgress > 0.25 {
                                    dragProgress = 0.6
                                } else {
                                    dragProgress = .zero
                                }
                            }
                        }
                    content
                        .shadow(color: .black.opacity(dragProgress != 0 ? 0.1 : 0), radius: 5, x: 15, y: 0)
                        .overlay(content: {
                            Rectangle()
                                .fill(.white.opacity(0.25))
                                .mask(content)
                        })
                        .overlay(alignment: .trailing) {
                            Rectangle()
                                .fill(
                                    .linearGradient(colors: [
                                        .clear,
                                        .white,
                                        .clear,
                                        .clear
                                    ], startPoint: .leading, endPoint: .trailing)
                                )
                                .frame(width: 60)
                                .offset(x: 40)
                                .offset(x: -30 + (30 * opacity))
                                .offset(x: size.width * -dragProgress)
                        }
                        .scaleEffect(x: -1)
                        .offset(x: size.width - (size.width * dragProgress))
                        .offset(x: size.width * -dragProgress)
                        .mask({
                            Rectangle()
                                .offset(x: size.width * -dragProgress)
                            
                        })
                        .contentShape(Rectangle())
                        .gesture(dragGesture)
                }
            }
            .background {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    
                    Rectangle()
                        .fill(.black)
                        .padding(.trailing, 20)
                        .shadow(color: .black.opacity(0.3), radius: 15, x: 30, y: 0)
                        .padding(.trailing, rect.width * dragProgress)
                }
                .mask(content)
            }
    }
}

struct PeelEffect_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
