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
    let listViewController = ListViewController()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = contentView.emailTextField.inputTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        _ = contentView.passwordTextField.inputTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText)
        contentView.submitButton.rx.tap.bind { [weak self] in
            self?.loginViewModel.isValid.subscribe(onNext: { [weak self] isValid in
                if isValid {
                    guard let self = self else { return }
                    self.show(self.listViewController, sender: nil)
                }
            })
        }.disposed(by: disposeBag)
    }
}
