//
//  OnBoardingView.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 28/2/24.
//

import SwiftUI

struct OnBoardingView: View {
    
    var doneRequest: () -> ()
    
    var body: some View {
        TabView {
            ScaledImgeView(name: "bridge")
                .tag(0)
            ScaledImgeView(name: "boat")
                .tag(1)
            ScaledImgeView(name: "marsh")
                .tag(2)
            Button("Done") {
                doneRequest()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black.ignoresSafeArea(.all))
    }
}

#Preview {
    OnBoardingView(doneRequest:{})
}

