//
//  OnboardingCoordinator.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 28/2/24.
//

import Foundation
import SwiftUI
import Combine
class OnboardingCoordinator: Coordinator {
    
    var rootViewController = UIViewController()
    let hasSeencOnboarding: CurrentValueSubject<Bool,Never>
    init(hasSeencOnboarding:  CurrentValueSubject<Bool,Never>) {
        self.hasSeencOnboarding = hasSeencOnboarding
    }
    
    func start() {
        let view = OnBoardingView { [weak self] in
            self?.hasSeencOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
    
    
}
