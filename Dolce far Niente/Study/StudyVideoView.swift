////
////  studyVideoView.swift
////  Dolce far Niente
////
////  Created by SHIN MIKHAIL on 14.01.2024.
////

import UIKit
import SnapKit

final class StudyVideoView: UIView {
    // цикл на 10 карточек
    private let data = Array(1...10).map { "study \($0)" }
    // колекция
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.register(studyVideoCell.self, forCellWithReuseIdentifier: studyVideoCell.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
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
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    // делегат
    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - UICollectionViewDataSource
extension StudyVideoView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // количество карточек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    // содержимое карточек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: studyVideoCell.reuseIdentifier, for: indexPath) as! studyVideoCell
        cell.configure(with: data[indexPath.item])
        return cell
    }
    // размер карточек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 2
        let spacingBetweenCells: CGFloat = 10
        let totalSpacing = (numberOfColumns - 1) * spacingBetweenCells
        let width = (collectionView.bounds.width - totalSpacing) / numberOfColumns
        return CGSize(width: width, height: width)
    }
    // нажатие карточек
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item at index: \(indexPath.item)")
        // Здесь вы можете выполнить дополнительные действия при нажатии на ячейку
    }
}
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
