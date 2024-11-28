//
//  HomeViewModel.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import Foundation
import Combine

final class HomeViewModel {
    enum Action {
        case loadData
        case loadCoupon
        case getDataSuccess(HomeResponse)
        case getDataFailure(Error)
        case getCouponSuccess(Bool)
        case getCouponFailure(Error)
        case didTapCouponButton
    }
    final class State {
        struct CollectionViewModels {
            var bannerViewModel: [HomeBannerCollectionViewCellViewModel]?
            var horizontalViewModel: [HomeProductCollectionViewCellViewModel]?
            var verticalViewModel: [HomeProductCollectionViewCellViewModel]?
            var couponStste: [HomeCouponButtonCollectionViewCellViewModel]?
        }
        @Published var collectionViewModels: CollectionViewModels = CollectionViewModels()
    }
    private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    private let couponDownloadedKey: String = "CouponDownloaded"
    
    func process(action: Action) {
        switch action {
        case .loadData:
            loadData()
            
        case .loadCoupon:
            loadCoupon()
            
        case .getDataSuccess(let response):
            transformResponses(response)
            
        case .getDataFailure(let error):
            print("error: \(error.localizedDescription)")
            
        case .getCouponSuccess(let isDownloaded):
            Task { await transformCoupon(isDownloaded) }
            
        case .getCouponFailure(let error):
            print("error: \(error.localizedDescription)")
            
        case .didTapCouponButton:
            downloadCoupon()
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}

extension HomeViewModel {
    
    private func loadData() {
        loadDataTask = Task {
            do {
                let response = try await NetworkService.shared.getHomeData()
                process(action: .getDataSuccess(response))
            } catch {
                process(action: .getDataFailure(error))
            }
        }
    }
    
    private func loadCoupon() {
        let couponState: Bool = UserDefaults.standard.bool(forKey: self.couponDownloadedKey)
        process(action: .getCouponSuccess(couponState))
    }
    
}

extension HomeViewModel {
    private func transformResponses(_ response: HomeResponse) {
        Task { await transforBanner(response) }
        Task { await transforHorizontal(response) }
        Task { await transforVertical(response) }
    }
    
    @MainActor
    private func transforBanner(_ response: HomeResponse) async {
        state.collectionViewModels.bannerViewModel = response.banners.map {
            HomeBannerCollectionViewCellViewModel(bannerImage: $0.imageUrl)
        }
    }
    
    @MainActor
    private func transforHorizontal(_ response: HomeResponse) async {
        state.collectionViewModels.horizontalViewModel = productToHomeProductCollectionViewCellViewModel(response.horizontalProducts)
    }
    
    @MainActor
    private func transforVertical(_ response: HomeResponse) async {
        state.collectionViewModels.verticalViewModel = productToHomeProductCollectionViewCellViewModel(response.verticalProducts)
    }
    
    private func productToHomeProductCollectionViewCellViewModel(_ product: [Product]) -> [HomeProductCollectionViewCellViewModel] {
        return product.map {
            HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl, title: $0.title, reasonDiscountString: $0.discount, originalPrice: $0.originalPrice.moneyString, discountPrice: $0.discountPrice.moneyString)
        }
    }
    
    @MainActor
    private func transformCoupon(_ isDownloaded: Bool) async {
        state.collectionViewModels.couponStste = [.init(state: isDownloaded ? .disable : .enable)]
    }
    
    private func downloadCoupon() {
        UserDefaults.standard.setValue(true, forKey: self.couponDownloadedKey)
        process(action: .loadCoupon)
    }
}
