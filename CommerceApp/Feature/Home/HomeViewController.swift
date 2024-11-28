//
//  HomeViewController.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum Section {
        case banner
    }

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, UIImage>?
    private var compositinalLayout: UICollectionViewCompositionalLayout = {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(165 / 393))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as! HomeBannerCollectionViewCell
            cell.setImage(itemIdentifier)
            return cell
        })
        
        var snapShot: NSDiffableDataSourceSnapshot<Section, UIImage> =
        NSDiffableDataSourceSnapshot<
        Section, UIImage>()
        snapShot.appendSections([.banner])
        snapShot.appendItems([UIImage(resource: .slide1), UIImage(resource: .slide2), UIImage(resource: .slide3)], toSection: .banner)
        dataSource?.apply(snapShot)
        
        collectionView.collectionViewLayout = compositinalLayout
    }

}