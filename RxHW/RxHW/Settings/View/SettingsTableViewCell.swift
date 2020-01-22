//
//  SettingsTableViewCell.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 21/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    private let appearance = Appearance()
    
    lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = appearance.xxxsSpace
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func makeConstraints() {
        labelsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

extension SettingsTableViewCell {
    
    public struct Constants {
        static let cellIdentifier = "SettingsTableViewCell"
    }
    
    struct Appearance {
        let shadowOpacity: Float = 0.2
        let shadowRadius: CGFloat = 10
        let xxxsSpace: CGFloat = 4
    }
}

extension SettingsTableViewCell {
    func configureCell(with viewModel: SettingsCellModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
