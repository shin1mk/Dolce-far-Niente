//
//  StoreViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class ShopViewController: UIViewController {
    // добавляем вью с карточками
    private let itemCardView = ItemCardView()
    // массив картинок
    private let images = ["red", "yellow", "orange"]
    // свойства
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 30)
        label.text = "Dolce Store"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 20)
        label.text = "Category"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 20)
        label.text = "Shop by product"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    // таблица
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(storeCustomCell.self, forCellWithReuseIdentifier: "storeCustomCell")
        collectionView.showsHorizontalScrollIndicator = false // Убираем полосу прокрутки
        collectionView.isScrollEnabled = true
        
        return collectionView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    //MARK: - lifecycle
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
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(30)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            //            make.bottom.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.height.equalTo(1000)
        }
        
        scrollView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(25)
        }
        
        scrollView.addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(510)
            make.width.equalTo(view) // Добавлено для горизонтальной прокрутки
        }
        
        scrollView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25) // Установите подходящую высоту
        }
        
        scrollView.addSubview(itemCardView)
        itemCardView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(930)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-15)
        }
    }
    // скролл сразу на первую картинку
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
//MARK: CollectionView settings
extension ShopViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // размер карточки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width - 75
        let cellHeight: CGFloat = 500
        return CGSize(width: cellWidth, height: cellHeight)
    }
    // инсет для секции, добавим отступ слева только для первой секции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftInset: CGFloat = section == 0 ? 15.0 : 0.0
        let rightInset: CGFloat = (section == collectionView.numberOfSections - 1) ? 15.0 : 0.0
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    // количество картинок по количеству картинок в массиве
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    // содержимое
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCustomCell", for: indexPath) as! storeCustomCell
        cell.imageName = self.images[indexPath.item]
        return cell
    }
    // нажатие с присвоением индекса
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Обработка нажатия на ячейку, например, выводим номер нажатой ячейки
        print("Selected item at index: \(indexPath.item)")
        
    }
}
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
