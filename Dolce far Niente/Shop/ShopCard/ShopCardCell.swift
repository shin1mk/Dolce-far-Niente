//
//  ShopCardCell.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 18.01.2024.
//

import UIKit
import SnapKit

//MARK: StoreCustomCell
final class storeCustomCell: UICollectionViewCell {
    var imageName: String? {
        didSet {
            guard let imageName = imageName else { return }
            backgroundImage.image = UIImage(named: imageName)
        }
    }
    // свойства
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    // цикл
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    // инит
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // констрейнты
    private func setupUI() {
        contentView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
