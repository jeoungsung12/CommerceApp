//
//  HomeProductCollectionViewCell.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import UIKit

struct HomeProductCollectionViewCellViewModel: Hashable {
    let imageUrlString: String
    let title: String
    let reasonDiscountString: String
    let originalPrice: String
    let discountPrice: String
}

class HomeProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageVIew: UIImageView! {
        didSet {
            productImageVIew.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productReasonDiscountLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    func setViewModel(_ viewModel: HomeProductCollectionViewCellViewModel) {
//        productImageVIew.image = viewModel.imageUrlString
        productTitleLabel.text = viewModel.title
        productReasonDiscountLabel.text = viewModel.reasonDiscountString
        originalPriceLabel.attributedText = NSMutableAttributedString(string: viewModel.originalPrice, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        discountPriceLabel.text = viewModel.discountPrice
    }
    
}
