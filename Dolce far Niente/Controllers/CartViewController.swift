//
//  CartViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

//struct CustomData {
//    var title: String
//    var url: String
//    var backgroundImage: UIImage
//}

import UIKit
import SnapKit

final class CartViewController: UIViewController {
    // массив картинок
    private let images = ["red", "yellow", "orange"]
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextHeavy(ofSize: 30)
        label.text = "Dolce Store"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(storeCustomCell.self, forCellWithReuseIdentifier: "storeCustomCell")
        collectionView.showsHorizontalScrollIndicator = false // Убираем полосу прокрутки
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollToInitialItem()
    }
    // констрейнты
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        titleLabel.layer.zPosition = 999
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(15)
        }
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-150)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    // скролл на первую картинку
    private func scrollToInitialItem() {
        let initialIndexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: initialIndexPath, at: .centeredHorizontally, animated: false)
    }
    // делегаты
    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width - 70
        let cellHeight: CGFloat = 500
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCustomCell", for: indexPath) as! storeCustomCell
        cell.imageName = self.images[indexPath.item]
        return cell
    }
}

final class storeCustomCell: UICollectionViewCell {
    var imageName: String? {
        didSet {
            guard let imageName = imageName else { return }
            backgroundImage.image = UIImage(named: imageName)
        }
    }
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
