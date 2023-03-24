//
//  FormView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 23/03/23.
//

import SwiftUI

struct FormView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var noOfArticles = 0
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                DatePicker("Date of Birth", selection: $dob, displayedComponents: .date)
                    .frame(height: 25)
                HStack(spacing: 50) {
                    Text("Gender")
                    RadioButtonGroups { selected in
                        print("SELECTED \(selected)")
                    }
                }
            }
            Section(header: Text("Actions")) {
                Toggle("Dark Mode", isOn: $isDarkMode)
                VStack(alignment: .leading) {
                    Stepper("Published Articles", value: $noOfArticles)
                    Text("You have published \(noOfArticles) Articles")
                }
                RangeSlider()
            }
        }
        .accentColor(.red)
        .navigationTitle("Account")
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

struct RangeSlider: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var width: CGFloat = 0
    @State var circleOffset: CGFloat = 15
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Value")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("\(getValue(value: (self.width / self.totalWidth) * 10)) - \(getValue(value: (self.circleOffset / self.totalWidth) * 10))")
                    .font(.subheadline)
            }
            
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(isDarkMode ? Color.white.opacity(0.20): Color.black.opacity(0.20))
                    .frame(height: 6)
                
                Rectangle()
                    .fill(isDarkMode ? Color.white : Color.black)
                    .frame(width: self.circleOffset - self.width, height: 6)
                    .offset(x: self.width + 18)
                
                HStack(spacing: 0) {
                    let firstCircleGesture = DragGesture()
                        .onChanged { value in
                            if value.location.x >= 0 && value.location.x <= self.circleOffset {
                                self.width = value.location.x
                            }
                        }
                    
                    let secondCircleGesture = DragGesture()
                        .onChanged { value in
                            if value.location.x <= self.totalWidth && value.location.x >= self.width {
                                self.circleOffset = value.location.x
                                
                            }
                        }
                    
                    Circle()
                        .fill(isDarkMode ? Color.white : Color.black)
                        .frame(width: 18, height: 18)
                        .offset(x: self.width)
                        .gesture(firstCircleGesture)
                    
                    Circle()
                        .fill(isDarkMode ? Color.white : Color.black)
                        .frame(width: 18, height: 18)
                        .offset(x: self.circleOffset)
                        .gesture(secondCircleGesture)
                }
            }
        }
    }
    
    func getValue(value: CGFloat) -> String {
        return String(format: "%.2f", value)
    }
}
