//
//  DetailRootView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import SwiftUI
import Kingfisher

struct DetailRootView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    bannerView
                    rateView
                    titleView
                    optionView
                    priceView
                    mainImageView
                }
            }
            moreView
            bottomCtaView
        }
        .onAppear {
            viewModel.process(action: .loadData)
        }
    }
    @ViewBuilder
    var bannerView: some View {
        if let bannersViewModel = viewModel.state.banner {
            DetailBannerView(viewModel: bannersViewModel)
                .padding(.bottom, 15)
        }
    }
    
    @ViewBuilder
    var rateView: some View {
        if let rateViewModel = viewModel.state.rate {
            HStack(spacing: 0) {
                Spacer()
                DetailRateView(viewModel: rateViewModel)
            }
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    var titleView: some View {
        if let titleViewModel = viewModel.state.title {
            HStack(spacing: 0) {
                Text(titleViewModel)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
    
    @ViewBuilder
    var optionView: some View {
        if let optionViewModel = viewModel.state.option {
            Group {
                DetailOptionView(viewModel: optionViewModel)
                    .padding(.bottom, 32)
                
                HStack(spacing: 0) {
                    Spacer()
                    Button {
                        viewModel.process(action: .didTapChangeOption)
                    } label: {
                        Text("옵션 선택하기")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    var priceView: some View {
        if let priceViewModel = viewModel.state.price {
            HStack(spacing: 0) {
                DetailPriceView(viewModel: priceViewModel)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 32)
        }
    }
    @ViewBuilder
    var mainImageView: some View {
        if let mainImageViewModel = viewModel.state.mainImageUrls {
            LazyVStack(spacing: 0) {
                ForEach(mainImageViewModel, id: \.self) {
                    KFImage.url(URL(string: $0))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .padding(.bottom, 32)
            .frame(maxHeight: viewModel.state.more == nil ? .infinity : 200, alignment: .top)
            .clipped()
        }
    }
    
    @ViewBuilder
    var moreView: some View {
        if let moreViewModel = viewModel.state.more {
            DetailMoreView(viewModel: moreViewModel) {
                viewModel.process(action: .didTapMore)
            }
        }
    }
    
    @ViewBuilder
    var bottomCtaView: some View {
        if let purchaseViewModel = viewModel.state.purchase {
            DetailPurchaseView(viewModel: purchaseViewModel) {
                viewModel.process(action: .didTapFavorite)
            } onPurchaseTapped: {
                viewModel.process(action: .didTapPurchase)
            }
        }
    }
}

#Preview {
    DetailRootView(viewModel: DetailViewModel())
}
