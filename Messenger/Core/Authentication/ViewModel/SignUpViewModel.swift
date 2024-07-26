//
//  SignUpViewModel.swift
//  Messenger
//
//  Created by Adarsh Begur on 14/07/24.
//

import SwiftUI

class SignUpViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
}
