//
//  PurchaseViewController.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import UIKit
import Combine

final class PurchaseViewController: UIViewController {
    private var viewModel: PurchaseViewModel = PurchaseViewModel()
    private var subscriptions = Set<AnyCancellable>()
    private var rootView: PurchaseRootView = PurchaseRootView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bindViewModel()
        viewModel.process(.loadData)
    }

    private func bindViewModel() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let viewModels = self?.viewModel.state.purchaseItems else { return }
                self?.rootView.setPurchaseItemStack(viewModels)
            }
            .store(in: &subscriptions)
    }
}

#Preview {
    PurchaseViewController()
}
