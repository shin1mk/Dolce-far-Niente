//
//  HomePicture4View.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 19.01.2024.
//

import UIKit
import SnapKit

final class HomePicture4View: UIView {
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 20)
        label.text = "Dolce candle"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pic2")
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
            make.height.equalTo(30)
        }
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview().offset(0)
            make.bottom.lessThanOrEqualToSuperview().offset(-1)
        }
    }
}
