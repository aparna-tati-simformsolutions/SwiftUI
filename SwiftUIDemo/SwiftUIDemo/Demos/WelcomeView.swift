//
//  WelcomeView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 02/03/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var goToLoginView = false
    
    var body: some View {
        welcomeViewDesign
    }
}

struct WelcomeView_PreviewsT: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

extension WelcomeView {
    private var welcomeViewDesign: some View {
        VStack {
            headerDesign
            titlesDesign
            buttonDesign
        }
        .background(Color.white)
    }
    
    private var headerDesign: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(Color("navyBlue"))
                .cornerRadius(radius: 110, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea(.all)
            Image("logo")
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .offset(y: 50)
        }
        .frame(width: UIScreen.main.bounds.width + 5, height: UIScreen.main.bounds.height / 2 - 70)
    }
    
    private var titlesDesign: some View {
        Group {
            Spacer()
            Text("Leafboard")
                .font(.system(size: 56, weight: .medium))
                .bold()
                .padding(5)
            Text("A platform build for a new way of working")
                .font(.subheadline)
            Spacer().frame(height: UIScreen.main.bounds.height / 6)
        }
    }
    
    private var buttonDesign: some View {
        Group {
            Button {
                self.goToLoginView = true
            } label: {
                HStack {
                    Text("Get Started For Free")
                    Image(systemName: "arrow.right")
                }
            }
            .padding(20)
            .frame(height: 50)
            .background(Color("lightGreen"))
            .foregroundColor(.black)
            .clipShape(Capsule())
            Spacer().frame(height: 40)
        }
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
