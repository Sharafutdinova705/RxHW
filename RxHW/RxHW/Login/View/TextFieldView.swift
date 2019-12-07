//
//  TextFieldView.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TextFieldView: UIView {
    struct Constants {
        let xxxsSpace: CGFloat = 4
        let xxsSpace: CGFloat = 8
        let xxlSpace: CGFloat = 48
    }
    
    private let name: String
    private let constants = Constants()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var roundedView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = constants.xxsSpace
        view.backgroundColor = .white
        view.addShadow(
            ofColor: .lightGray,
            radius: 5,
            offset: .zero,
            opacity: 0.5
        )
        return view
    }()
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.clearButtonMode = .whileEditing
        textField.placeholder = name
        textField.backgroundColor = .clear
        textField.textColor = .darkGray
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    init(name: String) {
        self.name = name
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
        addSubview(titleLabel)
        addSubview(roundedView)
        roundedView.addSubview(inputTextField)
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        roundedView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(constants.xxsSpace)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(constants.xxlSpace)
        }
        inputTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(constants.xxxsSpace)
            make.top.bottom.trailing.equalToSuperview()
        }
        
    }
}

extension UIView {
    public func addShadow(ofColor color: UIColor = .lightGray, radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
