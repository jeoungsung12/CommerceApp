//
//  FavoriteTableViewCell.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/30/24.
//

import UIKit
import Kingfisher

struct FavoriteTableViewCellViewModel: Hashable {
    let imageUrl: String
    let productName: String
    let productPrice: String
}

class FavoriteTableViewCell: UITableViewCell {
    static let reuseableId: String = "FavoriteTableViewCell"
    
    @IBOutlet weak var productItemImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productPruchaseButton: PurchaseButton!
    
    func setViewModel(_ viewModel: FavoriteTableViewCellViewModel) {
        productItemImageView.kf.setImage(with: URL(string: viewModel.imageUrl))
        productTitleLabel.text = viewModel.productName
        productPriceLabel.text = viewModel.productPrice
    }
}
