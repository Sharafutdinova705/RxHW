//
//  LoginViewController.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    private let contentView = LoginView()
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    public var isFirestLoad = false

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = contentView.emailTextField.inputTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText).disposed(by: disposeBag)
        _ = contentView.passwordTextField.inputTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText).disposed(by: disposeBag)
        
        contentView.submitButton.rx.tap.bind { [weak self] in
            self?.loginViewModel.isValid.subscribe(onNext: { [weak self] isValid in
                if isValid {
                    guard let self = self else { return }
                    UserDefaults.standard.set(self.contentView.passwordTextField.inputTextField.text, forKey: "User")
                    NotificationCenter.default.post(name: NSNotification.Name("reloadTableView"), object: nil)
                    if self.isFirestLoad {
                        let navigationController = UINavigationController()
                        let listViewController = ListViewController()
                        navigationController.viewControllers = [listViewController]
                        self.present(navigationController, animated: true, completion: nil)
                    } else {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }).disposed(by: self?.disposeBag ?? DisposeBag())
        }.disposed(by: disposeBag)
    }
}
