//
//  DetailPurchaseView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import SwiftUI

final class DetailPurchaseViewModel: ObservableObject {
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
    @Published var isFavorite: Bool
}

struct DetailPurchaseView: View {
    @ObservedObject var viewModel: DetailPurchaseViewModel
    var onFavoriteTapped: () -> Void
    var onPurchaseTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 30) {
            Button(action: onFavoriteTapped, label: {
                viewModel.isFavorite ? Image(.favoriteOn) : Image(.favoriteOff)
            })
            
            Button(action: onPurchaseTapped, label: {
                Text("구매하기")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding(.top, 10)
        .padding(.horizontal, 25)
    }
}

#Preview {
    DetailPurchaseView(viewModel: DetailPurchaseViewModel(isFavorite: true), onFavoriteTapped: {}, onPurchaseTapped: {})
}
