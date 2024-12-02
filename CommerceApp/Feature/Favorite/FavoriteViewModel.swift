//
//  FavoriteViewModel.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/30/24.
//

import Foundation
import Combine

final class FavoriteViewModel {
    enum Action {
        case getFavoriteFromAPI
        case getFavoriteSuccess(FavoriteResponse)
        case getFavoriteFailure(Error)
        case didTapPurchaseButton
    }
    final class State {
        @Published var tableViewModel: [FavoriteTableViewCellViewModel]?
    }
    
    private(set) var state: State = State()
    
    func process(_ action: Action) {
        switch action {
        case .getFavoriteFromAPI:
            self.getFavoriteFromAPI()
        case .getFavoriteSuccess(let favoriteResponse):
            translateFavoriteItemViewModel(favoriteResponse)
        case .getFavoriteFailure(let error):
            print(error)
        case .didTapPurchaseButton:
            return
        }
    }
}

extension FavoriteViewModel {
    private func getFavoriteFromAPI() {
        Task {
            do {
                let response = try await NetworkService.shared.getFavoriteData()
                process(.getFavoriteSuccess(response))
            } catch {
                process(.getFavoriteFailure(error))
            }
        }
    }
    
    private func translateFavoriteItemViewModel(_ response: FavoriteResponse) {
        state.tableViewModel = response.favorites.map {
            FavoriteTableViewCellViewModel(imageUrl: $0.imageUrl, productName: $0.title, productPrice: $0.discountPrice.moneyString)
        }
    }
}
