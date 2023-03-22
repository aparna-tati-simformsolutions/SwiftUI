//
//  PropertyWrapperThirdView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 22/03/23.
//

import SwiftUI

struct PropertyWrapperThirdView: View {
    
    @EnvironmentObject var user: User
    @EnvironmentObject var account: Account
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Username: \(user.username)")
            Text("Account: \(account.accountBalance)")
        }
    }
}

struct PropertyWrapperThirdView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperThirdView()
            .environmentObject(User())
            .environmentObject(Account())
    }
}
