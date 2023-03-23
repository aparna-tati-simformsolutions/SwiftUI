//
//  RadioButtonField.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 23/03/23.
//

import SwiftUI

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

struct RadioButtonField: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked: Bool
    let result: (String) -> ()
    
    init(id: String, label: String, size: CGFloat = 20, color: Color = Color.black, textSize: CGFloat = 14, isMarked: Bool, result: @escaping (String) -> Void) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.result = result
    }
    
    var body: some View {
        Button {
            self.result(self.id)
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(isDarkMode ? .white :  .black)
        }
        .foregroundColor(Color.white)
    }
}

struct RadioButtonGroups: View {
    
    let result: (String) -> ()
    @State var selectedId: String = ""
    
    var body: some View {
        HStack {
            radioButtonMale
            radioButtonFemale
        }
    }
    
    var radioButtonMale: some View {
        RadioButtonField(id: Gender.male.rawValue, label: Gender.male.rawValue, isMarked: selectedId == Gender.male.rawValue ? true : false, result: radioGroupCallback)
    }
    
    var radioButtonFemale: some View {
        RadioButtonField(id: Gender.female.rawValue, label: Gender.female.rawValue, isMarked:  selectedId == Gender.female.rawValue ? true : false, result: radioGroupCallback)
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        result(id)
    }
}
