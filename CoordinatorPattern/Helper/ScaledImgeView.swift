//
//  ScaledImgeView.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 28/2/24.
//

import SwiftUI

struct ScaledImgeView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 100,height: 100)
    }
}


//#Preview {
//    ScaledImgeView()
//}
