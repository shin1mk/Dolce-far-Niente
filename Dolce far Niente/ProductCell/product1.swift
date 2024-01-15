//
//  product1.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class product1_cell: UITableViewCell {
    private let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "tree.png")
        return imageView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 25)
        label.text = "titleLabel"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 14)
        label.text = "subtitleLabel"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundColor = .white
        // изображение
        addSubview(customImageView)
        customImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-35)
            make.leading.equalToSuperview().offset(0)
            make.width.equalTo(customImageView.snp.height)
        }
        // titleLabel справа
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(customImageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25)
        }
        // subtitleLabel снизу
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.leading.equalTo(customImageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25)
        }
    }
}
