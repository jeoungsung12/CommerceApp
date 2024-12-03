//
//  OptionViewController.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/2/24.
//

import UIKit
import SwiftUI

class OptionViewController: UIViewController {
    let viewModel: OptionViewModel = OptionViewModel()
    lazy var rootView: UIHostingController = UIHostingController(rootView: OptionRootView(viewModel: viewModel))

    override func viewDidLoad() {
        super.viewDidLoad()

        addRootView()
    }
    
    private func addRootView() {
        addChild(rootView)
        view.addSubview(rootView.view)
        
        rootView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootView.view.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
