//
//  SettingsViewController.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 07/12/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SettingsViewController: UIViewController {
    
    let dataStore = DataStore()
    let contentView = SettingsView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationController()
        collectEvent()
    }
    
    func initNavigationController() {
        let settingsButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(close)
        )
        navigationItem.rightBarButtonItem = settingsButton
        navigationController?.navigationBar.tintColor = .darkText
    }
    
    @objc
    private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectEvent() {
        var arrayOfSettingsCellModel: [SettingsCellModel] = []
        for user in dataStore.users {
            arrayOfSettingsCellModel.append(SettingsCellModel(title: user.login, description: user.urlRequest.path))
        }
        Observable<[SettingsCellModel]>
            .just(arrayOfSettingsCellModel)
            .bind(to: self.contentView.tableView.rx.items(cellIdentifier: SettingsTableViewCell.Constants.cellIdentifier)) { row, model, cell in
            guard let cell = cell as? SettingsTableViewCell else { return }
            cell.configureCell(with: model)
            }.disposed(by: self.disposeBag)
        
        contentView.tableView
            .rx
            .modelSelected(SettingsCellModel.self)
            .flatMap { (anyCellRepesentable) -> Observable<SettingsCellModel> in
                .just(anyCellRepesentable)
            }
            .bind { [weak self] viewModel in
                guard let currentUserPassword = self?.dataStore.users.first(where: { user in
                    user.login == viewModel.title
                })?.password else { return }
                UserDefaults.standard.set(currentUserPassword, forKey: "User")
                self?.show(LoginViewController(), sender: nil)
            }
            .disposed(by: disposeBag)
    }
}
