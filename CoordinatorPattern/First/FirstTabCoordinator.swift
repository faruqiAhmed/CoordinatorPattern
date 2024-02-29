//
//  FirstTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 29/2/24.
//

import Foundation
import UIKit
import SwiftUI

class FirstTabCoordinator: NSObject, Coordinator {
    var rootViewController: UINavigationController
    var viewModel = FirstTabViewModel()
    
 override  init() {
        rootViewController = UINavigationController ()
        rootViewController.navigationBar.prefersLargeTitles = true
     super.init()
     rootViewController.delegate = self
    }
    
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
    
        vc.title = "First"
        return vc
    } ()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    func goToDetail(){
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}
extension FirstTabCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        
        if viewController as? UIHostingController<FirstDetailView> != nil {
            print("detail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("first will be shown")
        }
    }
}
