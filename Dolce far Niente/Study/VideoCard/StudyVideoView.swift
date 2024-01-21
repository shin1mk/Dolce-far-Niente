//
//  StudyVideoView.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class StudyVideoView: UIView {
    // цикл на 10 карточек
    private let data = Array(1...10).map { "study \($0)" }
    // массив картинок для фона 10 карточек
    private let imageNames = ["pic4", "pic6", "pic7", "pic4", "pic6", "pic7","pic4", "pic6", "pic7", "pic7"]
    // передаем в studyVC номер нажатой ячейки получаем индек при нажатии внизу функция didSelectItemAt
    var didSelectItem: ((Int) -> Void)?
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
    // содержимое карточки 10
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: studyVideoCell.reuseIdentifier, for: indexPath) as! studyVideoCell
        // Установка текста и изображения фона
        let title = data[indexPath.item]
        let imageName = imageNames[indexPath.item % imageNames.count]
        cell.configure(with: title, backgroundImageName: imageName)
        
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
    // нажатие карточек и передача индекс наверх в var didSelectItem: ((Int) -> Void)?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("study video: \(indexPath.item)")
        didSelectItem?(indexPath.item)
    }
}
