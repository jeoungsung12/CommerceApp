//
//  DetailPriceView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import SwiftUI

final class DetailPriceViewModel: ObservableObject {
    init(discountRate: String, originPrice: String, currentPrice: String, shippingType: String) {
        self.discountRate = discountRate
        self.originPrice = originPrice
        self.currentPrice = currentPrice
        self.shippingType = shippingType
    }
    @Published var discountRate: String
    @Published var originPrice: String
    @Published var currentPrice: String
    @Published var shippingType: String
}

struct DetailPriceView: View {
    @ObservedObject var viewModel: DetailPriceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 21) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing:0) {
                    Text(viewModel.discountRate)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black.opacity(0.7))
                    Text(viewModel.originPrice)
                        .font(.system(size: 16, weight: .bold))
                        .strikethrough()
                        .foregroundColor(.gray)
                }
                Text(viewModel.currentPrice)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.red)
            }
            Text(viewModel.shippingType)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.black.opacity(0.7))
        }
    }
}

#Preview {
    DetailPriceView(viewModel: .init(discountRate: "53%", originPrice: "300,000원", currentPrice: "139,000원", shippingType: "무료배송"))
}
