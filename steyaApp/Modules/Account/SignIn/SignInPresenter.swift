//
//  AccountPresenter.swift
//  steyaApp
//
//  Created by Alena on 07.02.2024.
//

import Foundation

class SignInPresenter: ViewPresenter, ViewContainer, SignInViewOutput {
    
    
    
    
    weak var view: SignInViewInput?
    
    let viewModel: SignInViewModel
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    
}
