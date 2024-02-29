//
//  SecondTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 29/2/24.
//

import Foundation
import UIKit
class SecondTabCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController ()
        vc.title = "Secound"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: true)
    }
    
    
}
