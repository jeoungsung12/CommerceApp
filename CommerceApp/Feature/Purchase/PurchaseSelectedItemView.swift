//
//  PurchaseSelectedItemView.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/3/24.
//

import UIKit

struct PurchaseSelectedItemViewModel {
    var title: String
    var description: String
}

final class PurchaseSelectedItemView: UIView {
    private var stackViewConstraint: [NSLayoutConstraint]?
    
    private var contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = CPFont.r12
        label.textColor = CPColor.UIKit.bk
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = CPFont.r12
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(viewModel: PurchaseSelectedItemViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: PurchaseSelectedItemViewModel
    
    override func updateConstraints() {
        if stackViewConstraint == nil {
            let constraint = [
                contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            ]
            
            NSLayoutConstraint.activate(constraint)
            stackViewConstraint = constraint
        }
        super.updateConstraints()
    }
    
    private func commonInit() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        setBorder()
        setViewModel()
    }
    
    private func setBorder() {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
    
    private func setViewModel() {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
