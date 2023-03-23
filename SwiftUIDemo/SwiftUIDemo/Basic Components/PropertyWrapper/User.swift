//
//  User.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 22/03/23.
//

import Foundation

class User: ObservableObject {
    @Published var username: String = ""
}

class Account: ObservableObject {
    @Published var accountBalance: Double = 0
}
