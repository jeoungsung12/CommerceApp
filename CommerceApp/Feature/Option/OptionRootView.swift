//
//  OptionRootView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import SwiftUI

struct OptionRootView: View {
    @ObservedObject var viewModel: OptionViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    OptionRootView(viewModel: .init())
}
