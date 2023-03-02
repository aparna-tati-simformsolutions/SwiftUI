//
//  WelcomeView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 02/03/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("navyBlue"))
                    .frame(height: 400)
                    .cornerRadius(radius: 90, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea(.all)
                Image("logo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            }
            Spacer()
            Text("Leafboard")
                .font(.system(size: 56, weight: .medium))
                .bold()
                .padding()
            Text("A platform build for a new way of working")
                .font(.subheadline)
            Spacer()
            Button("Get Started for free") {
                
            }
            .padding(20)
            .frame(height: 50)
            .background(.yellow)
            .foregroundColor(.black)
            .clipShape(Capsule())
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
