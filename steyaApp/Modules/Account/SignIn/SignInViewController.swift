//
//  AccountViewController.swift
//  steyaApp
//
//  Created by Alena on 07.02.2024.
//

import Foundation
import UIKit

final class SignInViewController: ViewController, PresenterContainer, SignInViewInput {
    
    var presenter: SignInViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
      
    }
    
    
        func configure() {
           
        
    }
                
    func update() {
    }
    
    var viewModel: SignInViewModel {
        return presenter.viewModel
    }
    
}
