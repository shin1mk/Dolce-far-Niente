//
//  ShopCardView.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 18.01.2024.
//

import UIKit
import SnapKit

final class ShopCardView: UIView {
    // цикл на 10 карточек
    private let images = ["pic19", "pic16", "pic20"]
    private let titles = ["Бутоны", "На стебле", "Экзотик"]

    // колекция
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
    // цикл
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupDelegate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupDelegate()
    }
    // методы
    private func setupUI() {
        addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    // делегат
    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func scrollToInitialItem() {
        let initialIndexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: initialIndexPath, at: .centeredHorizontally, animated: false)
    }
}
//MARK: CollectionView settings
extension ShopCardView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // размер карточки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = frame.width - 75
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
        cell.title = self.titles[indexPath.item]
        return cell
    }
    // нажатие с присвоением индекса
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Обработка нажатия на ячейку, например, выводим номер нажатой ячейки
        print("shop: \(indexPath.item)")
        
    }
}
