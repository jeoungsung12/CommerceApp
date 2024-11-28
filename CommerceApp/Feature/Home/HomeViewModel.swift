//
//  HomeViewModel.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import Foundation
import Combine

class HomeViewModel {
    @Published var bannerViewModel: [HomeBannerCollectionViewCellViewModel]?
    @Published var horizontalViewModel: [HomeProductCollectionViewCellViewModel]?
    @Published var verticalViewModel: [HomeProductCollectionViewCellViewModel]?
    
    private var loadDataTask: Task<Void, Never>?
    func loadData() {
        loadDataTask = Task {
            do {
                let response = try await NetworkService.shared.getHomeData()
                Task { await transforBanner(response) }
                Task { await transforHorizontal(response) }
                Task { await transforVertical(response) }
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
    
    @MainActor
    private func transforBanner(_ response: HomeResponse) async {
        bannerViewModel = response.banners.map {
            HomeBannerCollectionViewCellViewModel(bannerImage: $0.imageUrl)
        }
    }
    
    @MainActor
    private func transforHorizontal(_ response: HomeResponse) async {
        horizontalViewModel = response.horizontalProducts.map {
            HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl, title: $0.title, reasonDiscountString: $0.discount, originalPrice: "\($0.originalPrice)", discountPrice: "\($0.discountPrice)")
        }
    }
    
    @MainActor
    private func transforVertical(_ response: HomeResponse) async {
        verticalViewModel = response.verticalProducts.map {
            HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl, title: $0.title, reasonDiscountString: $0.discount, originalPrice: "\($0.originalPrice)", discountPrice: "\($0.discountPrice)")
        }
    }
    
}
