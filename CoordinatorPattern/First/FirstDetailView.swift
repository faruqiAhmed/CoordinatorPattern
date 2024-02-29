//
//  FirstDetailView.swift
//  CoordinatorPattern
//
//  Created by Md Omar Faruq on 29/2/24.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: FirstTabViewModel
    var body: some View {
        VStack {
            Text("First Details")
            TextField("name", text: $viewModel.name )
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
#Preview {
    FirstDetailView(viewModel: FirstTabViewModel())
}
