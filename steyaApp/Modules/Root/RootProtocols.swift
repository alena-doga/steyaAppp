//
//  RootProtocols.swift
//  projectMVP
//
//  Created by Alena on 27.10.2023.
//

import Foundation

struct RootViewModel {
    let title: String
}

protocol RootViewInput: ViewInput {
    func update()
    
    
}

protocol RootViewOutput: AnyObject {
    var viewModel: RootViewModel { get }
    
}


