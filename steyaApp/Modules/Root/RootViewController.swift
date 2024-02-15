//
//  RootViewController.swift
//  projectMVP
//
//  Created by Alena on 27.10.2023.
//

import UIKit

final class RootViewController: ViewController, PresenterContainer, RootViewInput {
    
    
    var presenter: RootViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configure() {
        
    }
                
    func update() {
    }
    
    var viewModel: RootViewModel {
        return presenter.viewModel
    }
    
}
