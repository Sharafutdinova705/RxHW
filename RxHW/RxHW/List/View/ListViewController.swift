//
//  ListViewController.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 15/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class ListViewController: UIViewController {

    let contentView = ListView()
    let disposeBag = DisposeBag()
    lazy var dataSource: RxTableViewSectionedAnimatedDataSource<ListSectionModel> = {
        let dataSource = RxTableViewSectionedAnimatedDataSource<ListSectionModel>(configureCell: { [weak self] dataSource, tableView, indexPath, item in
            if let item = item as? ListCellViewModel {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.Constants.cellIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
                cell.configureCell(with: item)
                return cell
            }
            return UITableViewCell()
        })
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = Observable<[ListSectionModel]>.just([ListSectionModel(identity: "1", items: [ListCellViewModel(identity: "2", title: "Hello", description: "Descr"), ListCellViewModel(identity: "3", title: "Hello", description: "Descr")])])
        
        data.bind(to: contentView.tableView.rx.items(dataSource: dataSource))
        .disposed(by: disposeBag)
    }
    
    override func loadView() {
        view = contentView
    }
}
