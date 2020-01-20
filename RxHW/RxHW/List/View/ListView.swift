//
//  ListView.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 16/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import UIKit

final class ListView: UIView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.Constants.cellIdentifier)
        addSubviews()
        makeConstraints()
        setupStyle()
    }
    
    private func addSubviews() {
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(64)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupStyle() {
        backgroundColor = .white
    }
}
