//
//  RootScreenModel.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/17/25.
//

import Foundation
import Combine

final class RootScreenModel: ObservableObject {
    @Published private(set) var authState = AuthState.pending
    private var cancallable: AnyCancellable?
    
    init() {
        cancallable = AuthManager.shared.authState.receive(on: DispatchQueue.main)
            .sink {[weak self] latestAuthState in
                self?.authState = latestAuthState
            }
        
        // creating mock accounts
//        AuthManager.testAccounts.forEach { email in
//            registerTestAccount(with: email)
//        }
    }
    
//    private func registerTestAccount(with email: String) {
//        Task {
//            let username = email.replacingOccurrences(of: "@test.com", with: "")
//            try? await AuthManager.shared.createAccount(for: username, with: email, and: "12345678")
//        }
//    }
}
