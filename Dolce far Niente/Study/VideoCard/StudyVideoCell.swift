//
//  StudyVideoCell.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 18.01.2024.
//

import UIKit
import SnapKit

//MARK: - кастомная карточка
final class studyVideoCell: UICollectionViewCell {
    // id карты
    static let reuseIdentifier = "studyVideoCell"
    // текст
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    // цикл
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    // констрейнт фон и скругления
    private func setupUI() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 10.0
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
