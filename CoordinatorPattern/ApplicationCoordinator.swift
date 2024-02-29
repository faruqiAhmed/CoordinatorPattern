//
//  ApplicationCoordinator.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 27/2/24.
//

import Foundation
import UIKit
import SwiftUI
import Combine
class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    let hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
   var  subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow){
        self.window = window
    }
    func start() {
        setUpOnboardingValue()
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeencOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeencOnboarding: hasSeencOnboarding)
            onboardingCoordinator.start()
            self?.childCoordinators = [onboardingCoordinator]
            self?.window.rootViewController = onboardingCoordinator.rootViewController
                        
                        
            }
            
        }
        .store(in: &subscriptions)
    }
    
    func setUpOnboardingValue() {
        // storing and loading of state/data
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) //default of false
        hasSeenOnboarding.send (value)
        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
        UserDefaults.standard.setValue(value, forKey: key)
        }.store(in: &subscriptions)
    }
}
