//
//  DefaultViewActionHandlersContainer.swift
//  ios-flyday
//
//  Created by Oleh Kulakevych on 07.01.2023.
//

import Foundation

protocol DefaultViewActionHandlersConatiner: AnyObject {
    var viewDidLoadHandler: VoidClosure? { get set }
    var viewWillAppearHandler: VoidClosure? { get set }
    var viewDidDisappearHandler: VoidClosure? { get set }
}

extension DefaultViewActionHandlersConatiner {
    func add(viewDidLoadHandler: @escaping VoidClosure) {
        add(handler: viewDidLoadHandler, to: &self.viewDidLoadHandler)
    }
    
    func add(viewWillAppearHandler: @escaping VoidClosure) {
        add(handler: viewWillAppearHandler, to: &self.viewWillAppearHandler)
    }
    
    func add(viewDidDisappearHandler: @escaping VoidClosure) {
        add(handler: viewDidDisappearHandler, to: &self.viewDidDisappearHandler)
    }
    
    private func add(handler: @escaping VoidClosure, to original: inout VoidClosure?) {
        if let originalClosure = original {
            original = {
                originalClosure()
                handler()
            }
        } else {
            original = handler
        }
    }
}



