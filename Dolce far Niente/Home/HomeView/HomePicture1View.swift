//
//  HomePicture1View.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 18.01.2024.
//

import UIKit
import SnapKit

final class HomePicture1View: UIView {
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 20)
        label.text = "Dolce Study"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 16)
        label.text = "Откройте для себя мир творчества\nс курсом свечковой флористики"
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pic13")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    //Methods
    private func setupUI() {
        backgroundColor = .black
        
        addSubview(titleLabel)
        titleLabel.layer.zPosition = 999
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        addSubview(subtitleLabel)
        subtitleLabel.layer.zPosition = 999
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-45)
        }
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(600)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
}
