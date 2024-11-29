//
//  HomeSperateLineCollectionViewCell.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/29/24.
//

import UIKit

struct HomeSperateLineCollectionViewCellViewModel: Hashable {
    
}

final class HomeSperateLineCollectionViewCell: UICollectionViewCell {
    static let reusableId: String = "HomeSperateLineCollectionViewCell"
    
    func setViewModel(_ viewModel: HomeSperateLineCollectionViewCellViewModel) {
        contentView.backgroundColor = CPColor.gray1
    }
}
 
extension HomeSperateLineCollectionViewCell {
    static func separateLineLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(11))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)
        return section
    }
}
