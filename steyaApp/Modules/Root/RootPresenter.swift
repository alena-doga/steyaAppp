//
//  RootPresenter.swift
//  projectMVP
//
//  Created by Alena on 27.10.2023.
//

import Foundation


class RootPresenter: ViewPresenter, ViewContainer, RootViewOutput {
                
    weak var view: RootViewInput?
    
    let viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
    
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    
    func onClick() {
    
        view?.login()
    }

    func didTapSignIn() {
        view?.push(viewController: viewFactory.createSignInScreen(title: "" , complition: { _, _ in
            
        }))
    }
        
    func didTapSignUp() {
        view?.push(viewController: viewFactory.createSignUpScreen(title: ""))
    }
       
        
    
    
    func checkLogin(name: String, password: String) -> Bool {
        return name == "String" && password == "string"
    }
    
    
    func onLogin() {
        view?.push(viewController: viewFactory.createProfileScreen(title: "Cat"))
    }
}
