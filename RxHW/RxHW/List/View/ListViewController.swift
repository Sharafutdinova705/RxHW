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
    let dataStore = DataStore()
    let viewModel = ListViewModel()
    var apiManager = APIManager(sessionConfiguration: URLSessionConfiguration.default)
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("reloadTableView"), object: nil)
        fetchResult()
        collectEvent()
        initNavigationController()
    }
    
    @objc
    func reloadTableView() {
        fetchResult()
    }
    
    func initNavigationController() {
        let settingsButton = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(openSettings)
        )
        navigationItem.rightBarButtonItem = settingsButton
        navigationController?.navigationBar.tintColor = .darkText
    }
    
    @objc
    private func openSettings() {
        let navigationController = UINavigationController()
        let listViewController = SettingsViewController()
        navigationController.viewControllers = [listViewController]
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func fetchResult() {
        guard let requestType = dataStore.users.first(where: { user in
            return user.password == UserDefaults.standard.object(forKey: "User") as? String ?? ""
        })?.urlRequest else { return }
        apiManager.fetchResultWith(requestType: requestType) { [weak self] (result) in
            switch result {
            case let .success(foundedItems):
                var arrayOfItems: [ListCellModel] = []
                for item in foundedItems {
                    arrayOfItems.append(ListCellModel(title: item.title, description: item.description))
                }
                self?.viewModel.downloadedItemSubject.accept(arrayOfItems)
                self?.viewModel.foundedItemSubject.accept(arrayOfItems)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func collectEvent() {
        viewModel.foundedItemSubject.bind(to: contentView.tableView.rx.items(cellIdentifier: ListTableViewCell.Constants.cellIdentifier)) { row, model, cell in
            guard let cell = cell as? ListTableViewCell else { return }
            cell.configureCell(with: model)
        }.disposed(by: disposeBag)
        
        contentView.searchBar.rx.text.orEmpty.subscribe(onNext: { text in
            guard text != "" else { self.viewModel.foundedItemSubject.accept(self.viewModel.downloadedItemSubject.value)
                return
            }
            self.viewModel.foundedItemSubject.accept(self.viewModel.downloadedItemSubject.value.filter({ $0.title.lowercased().contains(text.lowercased())}))
        }).disposed(by: disposeBag)
    }
}
