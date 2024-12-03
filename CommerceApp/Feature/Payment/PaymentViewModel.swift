//
//  PaymentViewModel.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/3/24.
//

import Foundation
import Combine

final class PaymentViewModel {
    enum Action {
        case load
    }
    struct State {
        
    }
    
    @Published private(set) var state: State = State()
    
    func process(_ action: Action) {
        switch action {
        case .load:
            break
        }
    }
    
}
