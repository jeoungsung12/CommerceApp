//
//  HomeViewModel.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import Foundation
import Combine

class HomeViewModel {
    enum Action {
        case loadData
        case getDataSuccess(HomeResponse)
        case getDataFailure(Error)
    }
    final class State {
        struct CollectionViewModels {
            var bannerViewModel: [HomeBannerCollectionViewCellViewModel]?
            var horizontalViewModel: [HomeProductCollectionViewCellViewModel]?
            var verticalViewModel: [HomeProductCollectionViewCellViewModel]?
        }
        @Published var collectionViewModels: CollectionViewModels = CollectionViewModels()
    }
    private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    
    func process(action: Action) {
        switch action {
        case .loadData:
            loadData()
        case .getDataSuccess(let response):
            transformResponses(response)
            
        case .getDataFailure(let error):
            print("error: \(error.localizedDescription)")
        }
    }
    
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
    
    deinit {
        loadDataTask?.cancel()
    }
    
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
}
