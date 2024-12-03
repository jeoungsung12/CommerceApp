//
//  PurchaseRootView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/3/24.
//

import UIKit

final class PurchaseRootView: UIView {
    private var scrollViewConstraints: [NSLayoutConstraint]?
    private var titleLabelConstraints: [NSLayoutConstraint]?
    private var purchaseItemStackViewConstraints: [NSLayoutConstraint]?
    private var purchaseButtonConstraints: [NSLayoutConstraint]?
    
    private var scrollView: UIScrollView = {
        let view: UIScrollView = UIScrollView()
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "주문 상품 목록"
        label.font = CPFont.m17
        label.textColor = CPColor.UIKit.bk
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var purchaseItemStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var purchaseButton: UIButton = {
        let btn: UIButton = UIButton()
        btn.setTitle("결제하기", for: .normal)
        btn.titleLabel?.font = CPFont.m16
        btn.layer.backgroundColor = CPColor.UIKit.keyColorBlue.cgColor
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if scrollViewConstraints == nil {
            let constraints = [
                scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: purchaseButton.topAnchor),
                
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ]
            
            NSLayoutConstraint.activate(constraints)
            scrollViewConstraints = constraints
        }
        
        if titleLabelConstraints == nil,
           let superView = titleLabel.superview {
            let constraints = [
                titleLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 33),
                titleLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 33),
                titleLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            titleLabelConstraints = constraints
        }
        
        if purchaseItemStackViewConstraints == nil {
            let constraints = [
                purchaseItemStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19),
                purchaseItemStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20),
                purchaseItemStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),
                purchaseItemStackView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 33)
            ]
            NSLayoutConstraint.activate(constraints)
            purchaseItemStackViewConstraints = constraints
        }
        
        if purchaseButtonConstraints == nil {
            let constraints = [
                purchaseButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
                purchaseButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
                purchaseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
                purchaseButton.heightAnchor.constraint(equalToConstant: 50)
            ]
            NSLayoutConstraint.activate(constraints)
            titleLabelConstraints = constraints
        }
        super.updateConstraints()
    }
    
    private func commonInit() {
        addSubView()
    }
    
    private func addSubView() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(purchaseItemStackView)
        addSubview(purchaseButton)
    }
    
    func setPurchaseItemStack(_ viewModels: [PurchaseSelectedItemViewModel]) {
        purchaseItemStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        viewModels.forEach {
            self.purchaseItemStackView.addArrangedSubview(PurchaseSelectedItemView(viewModel: .init(title: $0.title, description: $0.description)))
        }
        
    }
    
}
