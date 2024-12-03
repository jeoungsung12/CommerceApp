//
//  FavoriteViewController.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/30/24.
//

import UIKit
import Combine
class FavoriteViewController: UIViewController {
    private typealias DataSource = UITableViewDiffableDataSource<Section, AnyHashable>
    private typealias SnapShot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    @IBOutlet weak var tableView: UITableView!
    private lazy var dataSource: DataSource = setDataSource()
    private enum Section: Int {
        case favorite
    }
    private var currentSection: [Section] {
        dataSource.snapshot().sectionIdentifiers as [Section]
    }
    
    private var viewModel: FavoriteViewModel = FavoriteViewModel()
    private var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.process(.getFavoriteFromAPI)
    }
    
    private func bindViewModel() {
        viewModel.state.$tableViewModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapShot()
            }.store(in: &self.subscriptions)
    }
    
    private func setDataSource() -> DataSource {
        let dataSource: DataSource = UITableViewDiffableDataSource(tableView: tableView) { [weak self] tableView, indexPath, viewModel in
            switch self?.currentSection[indexPath.section] {
            case .favorite:
                return self?.favoriteCell(tableView, indexPath, viewModel)
            case .none: return .init()
            }
        }
        return dataSource
    }
    
    private func favoriteCell(_ tableView: UITableView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UITableViewCell? {
        guard let viewModel = viewModel as? FavoriteTableViewCellViewModel,
              let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.reuseableId, for: indexPath) as? FavoriteTableViewCell else { return nil }
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func applySnapShot() {
        var snapShot: SnapShot = SnapShot()
        if let favoritesViewModel = viewModel.state.tableViewModel {
            snapShot.appendSections([.favorite])
            snapShot.appendItems(favoritesViewModel, toSection: .favorite)
        }
        dataSource.apply(snapShot)
    }
}
