//
//  HomeBannerCollectionViewCell.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
