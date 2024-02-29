//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 28/2/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var rootViewController: UITabBarController
       var childCoordinators = [Coordinator]()
    
    init () {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        let firstCoordinators = FirstTabCoordinator()
        firstCoordinators.start()
        self.childCoordinators.append(firstCoordinators)
        let firstViewController = firstCoordinators.rootViewController
        setup(vc: firstViewController, title: "First", imageName: "paperplane", selectedImageName: "paperplane.fill")
        
        let secondCoordinators = SecondTabCoordinator()
        secondCoordinators.start()
        self.childCoordinators.append(secondCoordinators)
        let secondViewController = secondCoordinators.rootViewController
        setup(vc: secondViewController, title: "second", imageName: "bell", selectedImageName: "bell.fill")
        
        self.rootViewController.viewControllers = [firstViewController, secondViewController]
    }
    func setup (vc: UIViewController, title: String , imageName: String, selectedImageName: String) {
        let defaultImage = UIImage (systemName: imageName )
        let selectedImage = UIImage (systemName: selectedImageName )
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
    
   
}


