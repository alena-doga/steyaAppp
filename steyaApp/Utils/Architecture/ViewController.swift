//
//  ViewController.swift
//  ios-flyday
//
//  Created by Oleh Kulakevych on 07.01.2023.
//

import UIKit


protocol PresenterContainer: AnyObject {
    associatedtype Presenter
    var presenter: Presenter! { get set }
}

protocol ViewRoutig {
    func present(viewController: UIViewController)
    func push(viewController: UIViewController)
    func dismiss(completion: (() -> Void)?)
    func pop()
    func setRootViewController(viewController: UIViewController)
}

protocol ViewInput: AnyObject, ViewRoutig {}

typealias ViewType = UIViewController & DefaultViewActionHandlersConatiner

class ViewController: UIViewController, DefaultViewActionHandlersConatiner {
    
    var viewDidLoadHandler: VoidClosure?
    var viewWillAppearHandler: VoidClosure?
    var viewDidDisappearHandler: VoidClosure?
    var viewWillLayoutSubviewsClosure: VoidClosure?
    var didMoveToParentControllerClosure: ((ViewController, UIViewController?) -> Void)?
        
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .lightContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDidLoadHandler?()
        viewDidLoadHandler = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearHandler?()
    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewWillLayoutSubviewsClosure?()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidDisappearHandler?()
    }
        
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        didMoveToParentControllerClosure?(self, parent)
    }
        
    deinit {
    }
    
    // MARK: Presents
    
    func showAlert(title: String?, message: String?, action: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Готово", style: .cancel, handler: {
            _ in
            
            action?()
        }))
        present(viewController: alert)
    }
    
    func present(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func setRootViewController(viewController: UIViewController) {
        UIApplication.shared.delegate?.window??.rootViewController = viewController
    }
}

