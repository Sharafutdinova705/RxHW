//
//  LoginView.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
import RxSwift
import RxCocoa

final class LoginView: UIView {
    struct Constants {
        let email = "Email"
        let password = "Password"
        let submit = "Submit"
        let stackSpacing: CGFloat = 16
        let containerInset: CGFloat = 20
        let buttonHeigh: CGFloat = 50
        let buttonWidth: CGFloat = 100
    }
    
    private let constants = Constants()
    
    private lazy var containterView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = constants.stackSpacing
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var emailTextField: TextFieldView = {
        let view = TextFieldView(name: constants.email)
        return view
    }()
    
    lazy var passwordTextField: TextFieldView = {
        let view = TextFieldView(name: constants.password)
        return view
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(constants.submit, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constants.buttonHeigh / 2
        button.addShadow()
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(containterView)
        addSubview(submitButton)
        containterView.addArrangedSubview(emailTextField)
        containterView.addArrangedSubview(passwordTextField)
    }
    
    private func makeConstraints() {
        containterView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(constants.containerInset)
        }
        submitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(containterView.snp.bottom).offset(constants.stackSpacing)
            make.height.equalTo(constants.buttonHeigh)
            make.width.equalTo(constants.buttonWidth)
        }
    }
    
    private func setupStyle() {
        backgroundColor = .white
    }
}
