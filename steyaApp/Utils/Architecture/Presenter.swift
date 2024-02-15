//
//  Presenter.swift
//  ios-flyday
//
//  Created by Oleh Kulakevych on 07.01.2023.
//

import UIKit

typealias VoidClosure = () -> Void

protocol ViewContainer: AnyObject {
    associatedtype View
    var view: View? { get set }
}

protocol ViewPresenter: AnyObject {
    func appear()
    func loadData(completion: VoidClosure?)
    func refreshData(completion: VoidClosure?)
}

extension ViewPresenter {
        
    var viewFactory: ViewFactory {
        return ViewFactory.shared
    }
    
    /// The method that needs to be implemented and called to update the data
    /// - Parameter completion: completion handler
    func refreshData(completion: VoidClosure? = nil) {
        loadData {
            completion?()
        }
    }
}

/// bind presenter and view controller. Usage in ViewFactory
func bind<View: PresenterContainer & ViewType, Presenter: ViewContainer & ViewPresenter>(view: View, presenter: Presenter) {
    
    // print("--> Presenter \(presenter) View \(view)")
    
    guard let _presenter = presenter as? View.Presenter else {
        fatalError("bad presenter")
    }
        
    guard let _view = view as? Presenter.View else {
        fatalError("bad view")
    }
    
    view.presenter = _presenter
    presenter.view = _view
    
    view.add(viewDidLoadHandler: {
        [weak presenter] in
        
        presenter?.appear()
    })
}



