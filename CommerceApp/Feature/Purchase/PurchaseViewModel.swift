//
//  PurchaseViewModel.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import Foundation
import Combine

final class PurchaseViewModel: ObservableObject {
    enum Action {
        case loadData
        case didTapPurchaseButton
    }
    struct State {
        var purchaseItems: [PurchaseSelectedItemViewModel]?
    }
    @Published private(set) var state: State = State()
    private(set) var showPaymentViewController: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    
    func process(_ action: Action) {
        switch action {
        case .loadData:
            Task { await loadData() }
        case .didTapPurchaseButton:
            Task { await didTapPurchaseButton() }
        }
    }
    
}

extension PurchaseViewModel {
    @MainActor
    private func loadData() async {
        
    }
    @MainActor
    private func didTapPurchaseButton() async {
        showPaymentViewController.send()
    }
}
