//
//  PropertyWrapperSecondView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 22/03/23.
//

import SwiftUI

struct PropertyWrapperSecondView: View {
    
    @EnvironmentObject var account: Account

    var body: some View {
        VStack {
            TextField("Your Account Balance", value: $account.accountBalance, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
            NavigationLink("Navigate To Third View") {
                PropertyWrapperThirdView()
            }
        }
        .padding()
    }
}

struct PropertyWrapperSecondView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperSecondView()
    }
}
