//
//  ModalWithSheetView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 23/03/23.
//

import SwiftUI

enum Sheet: Identifiable {
    case info
    case setting
    
    var id: Int {
        hashValue
    }
}

struct ModalWithSheetView: View {
    
    @State private var activeSheet: Sheet?
    @State private var viewName = ""
    @State private var showingOptions = false
    @State private var selection = "None"
    
    var body: some View {
        Form {
            Section(header: Text("Modal")) {
                Text("Your Main View has presented \(viewName)")
                Text("Main View")
                    .font(.largeTitle)
                    .bold()
                
                Button {
                    activeSheet = .info
                } label: {
                    Label("Information View", systemImage: "info.circle")
                }
                
                Button {
                    activeSheet = .setting
                } label: {
                    Label("Setting", systemImage: "gear")
                }
            }
            
            Section(header: Text("Action Sheet")) {
                Text(selection)
                Button("Image Picker") {
                    showingOptions = true
                }
                .confirmationDialog("Choose Photo", isPresented: $showingOptions) {
                    Button("Open Camera") {
                        selection = "Open Camera"
                    }
                    
                    Button("Open Gallery") {
                        selection = "Open Gallery"
                    }
                }
            }
        }
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .info:
                InformationView(data: "Hello", information: $viewName)
            case .setting:
                SettingsView(setting: $viewName)
            }
        }
    }
}

struct InformationView: View {
    
    @State var data = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var information: String
    var onDismiss: ((String) -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(data) Information View")
                .font(.largeTitle)
                .bold()
            Button(action: {
                information = "Information"
                onDismiss?(information)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Label("Close", systemImage: "xmark.circle")
            })
        }
    }
}

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var setting: String
    var onDismiss: ((String) -> Void)?

    var body: some View {
        VStack(spacing: 20) {
            Text("Setting View")
                .font(.largeTitle)
                .bold()
            Button(action: {
                setting = "Setting"
                onDismiss?(setting)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Label("Close", systemImage: "xmark.circle")
            })
        }
    }
}

struct ModalWithSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ModalWithSheetView()
    }
}

