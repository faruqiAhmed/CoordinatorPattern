//
//  FirstTabViewModel.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 29/2/24.
//

import Foundation
import Combine
class FirstTabViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    
}
