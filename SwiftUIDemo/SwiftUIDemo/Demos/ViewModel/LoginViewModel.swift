//
//  LoginViewModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 06/03/23.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoginValid = false
    
    private var publishers = Set<AnyCancellable>()

    init() {
        isLoginFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoginValid, on: self)
            .store(in: &publishers)
    }
}

private extension LoginViewModel {
    
    var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email.map { email in
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
            return emailPredicate.evaluate(with: email)
        }
        .eraseToAnyPublisher()
    }
    
    var isPasswordPublisher: AnyPublisher<Bool, Never> {
        $password.map { password in
            return password.count >= 8
        }
        .eraseToAnyPublisher()
    }
    
    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordPublisher)
            .map { isEmailValid, isPasswordValid in
                return isEmailValid && isPasswordValid
            }
            .eraseToAnyPublisher()
    }
}
