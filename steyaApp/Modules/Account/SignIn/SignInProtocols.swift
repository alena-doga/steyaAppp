//
//  AccountProtocols.swift
//  steyaApp
//
//  Created by Alena on 07.02.2024.
//

import Foundation

struct SignInViewModel {
    let title: String
}

protocol SignInViewInput: ViewInput {
    func update()
    
    
}

protocol SignInViewOutput: AnyObject {
    var viewModel: SignInViewModel { get }

}
