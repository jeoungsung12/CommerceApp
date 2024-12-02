//
//  DetailMoreView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import SwiftUI

final class DetailMoreViewModel: ObservableObject {
    
}

struct DetailMoreView: View {
    @ObservedObject var viewModel: DetailMoreViewModel
    var onMoreTapped: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text("상품정보 더보기")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.blue)
                Image(.down)
                    .foregroundColor(.black.opacity(0.7))
            }
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            .border(.blue, width: 1)
        }

    }
}

#Preview {
    DetailMoreView(viewModel: .init(), onMoreTapped: {})
}
