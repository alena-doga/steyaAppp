//
//  ViewFactory.swift
//  projectMVP
//
//  Created by Alena on 27.10.2023.
//

import Foundation
import UIKit

class ViewFactory: NSObject {
    
    static let shared = ViewFactory()
    
    func createRootScreen(title: String) -> RootViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: RootViewController.self)) as! RootViewController
        let viewModel = RootViewModel(title: title)
        let presenter = RootPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
    
    func createNavigationRootScreen(title: String) -> UINavigationController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = UINavigationController(rootViewController: storyboard.instantiateViewController(withIdentifier: String(describing: RootViewController.self)) as! RootViewController)
        let viewModel = RootViewModel(title: title)
        let presenter = RootPresenter(viewModel: viewModel)
        bind(view: controller.topViewController as! RootViewController, presenter: presenter) 
        return controller
        
    }
    
    func createSignInScreen(title: String, complition: ((String,String)-> Void)?) -> SignInViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: SignInViewController.self)) as! SignInViewController
        let viewModel = SignInViewModel(title: title, complition: complition)
        let presenter = SignInPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
    
    func createProfileScreen(title: String) -> ProfileViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self)) as! ProfileViewController
        let viewModel = ProfileViewModel(title: title)
        let presenter = ProfilePresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
    
    func createSignUpScreen(title: String) -> SignUpViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: SignUpViewController.self)) as! SignUpViewController
        let viewModel = SignUpViewModel(title: title)
        let presenter = SignUpPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
    
    func createOffersScreen(title: String, product: Products) -> OffersViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: OffersViewController.self)) as! OffersViewController
        
        let viewModel = OffersViewModel(title: title, product: product)
        let presenter = OffersPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createOrderScreen(title: String) -> OrderViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: OrderViewController.self)) as! OrderViewController
        let viewModel = OrderViewModel(title: title)
        let presenter = OrderPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createCartScreen(title: String) -> CartViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CartViewController.self)) as! CartViewController
        let viewModel = CartViewModel(title: title)
        let presenter = CartPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createRootCatalog(title: String) -> UINavigationController {
        let storyboard = UIStoryboard(storyboard: .main)
        
        let catalog = storyboard.instantiateViewController(withIdentifier: String(describing:  CatalogViewController.self)) as!  CatalogViewController
        
        let controller = UINavigationController(rootViewController: catalog)
        
        let viewModel =  CatalogViewModel(title: title)
        let presenter = CatalogPresenter(viewModel: viewModel)
        bind(view: controller.topViewController as! CatalogViewController, presenter: presenter)
        return controller
    }
    
    func createRootProfile(title: String) -> UINavigationController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = UINavigationController(rootViewController: storyboard.instantiateViewController(withIdentifier: String(describing:  ProfileViewController.self)) as!  ProfileViewController)
        let viewModel =  ProfileViewModel(title: title)
        let presenter = ProfilePresenter(viewModel: viewModel)
        bind(view: controller.topViewController as! ProfileViewController, presenter: presenter)
        return controller
    }
    
    
    func createTabBarScreen(title: String) -> UITabBarController {
        let profile = createRootProfile(title: "")
        let catalog = createRootCatalog(title: "")
        
        let controller = UITabBarController()
        controller.setViewControllers([
             profile, catalog
        ], animated: true)
        let tabBar = controller.tabBar
        tabBar.tintColor = .red
        let profileItem = tabBar.items?[0]
        profileItem?.title = "Profile"
        let catalogItem = tabBar.items?[1]
        catalogItem?.title = "Catalog"
        
        
        return controller
        
    }
    
}


