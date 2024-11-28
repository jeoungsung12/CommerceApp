//
//  HomeBannerCollectionViewCell.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import UIKit

struct HomeBannerCollectionViewCellViewModel: Hashable {
    let bannerImage: UIImage
}

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setViewModel(_ viewModel: HomeBannerCollectionViewCellViewModel) {
        imageView.image = viewModel.bannerImage
    }
}
