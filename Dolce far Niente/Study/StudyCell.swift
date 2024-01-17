////
////  StudyCell.swift
////  Dolce far Niente
////
////  Created by SHIN MIKHAIL on 14.01.2024.
////
//
/*
//import UIKit
//import SnapKit
//
//final class StudyCell: UITableViewCell, UIScrollViewDelegate {
//    // array and prorperites
//    private var imageArray = ["yellow", "red", "white", "orange"]
//    private var currentPageIndex = 0
//    // scroll view
//    private var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.isPagingEnabled = true
//        scrollView.showsHorizontalScrollIndicator = false
//        return scrollView
//    }()
//    // кружочки под картинкой
//    private lazy var pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
//        pageControl.pageIndicatorTintColor = UIColor.lightGray
//        pageControl.currentPage = 0
//        pageControl.numberOfPages = imageArray.count
//        return pageControl
//    }()
//    // название товара
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.SFUITextRegular(ofSize: 25)
//        label.text = "title"
//        label.textAlignment = .left
//        label.textColor = .white
//        return label
//    }()
//    // второе название
//    private let subtitleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.SFUITextRegular(ofSize: 25)
//        label.text = "subtitle"
//        label.textAlignment = .left
//        label.textColor = .white
//        return label
//    }()
//    // старая цена
//    private let oldPriceLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.SFUITextMedium(ofSize: 15)
//        label.text = "1000 ₴"
//        label.textAlignment = .left
//        label.textColor = .systemRed
//        // Add strikethrough style to the attributed text
//        let attributedString = NSAttributedString(
//            string: label.text ?? "",
//            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
//        )
//        
//        label.attributedText = attributedString
//        return label
//    }()
//    // новая цена
//    private let newPriceLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.SFUITextMedium(ofSize: 20)
//        label.text = "700 ₴"
//        label.textAlignment = .left
//        label.textColor = .white
//        return label
//    }()
//    // цена
//    private let readyLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.SFUITextRegular(ofSize: 13)
//        label.textAlignment = .left
//        label.textColor = .systemGreen
//        
//        let text = "Отправка 2-3 дня "
//        let attachment = NSTextAttachment()
//        attachment.image = UIImage(named: "delivery.png")
//        attachment.bounds = CGRect(x: 0, y: -6, width: 20, height: 20)
//        
//        let attributedText = NSMutableAttributedString(string: text)
//        attributedText.append(NSAttributedString(attachment: attachment))
//        
//        label.attributedText = attributedText
//        return label
//    }()
//    // избранное
//    private let favoritesButton: UIButton = {
//        let button = UIButton()
//        let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
//        let favoritesImage = UIImage(systemName: "heart", withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
//        button.setImage(favoritesImage, for: .normal)
//        return button
//    }()
//    // корзина
//    private let cartButton: UIButton = {
//        let button = UIButton()
//        let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
//        let cartImage = UIImage(systemName: "cart", withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
//        button.setImage(cartImage, for: .normal)
//        return button
//    }()
//    //MARK: Lifecycle
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupConstraints()
//        setupTarget()
//        setupDelegate()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupConstraints()
//    }
//    // methods
//    private func setupConstraints() {
//        contentView.addSubview(scrollView)
//        let squareSize: CGFloat = 130 // Размер квадрата
//        scrollView.contentSize = CGSize(width: squareSize * CGFloat(imageArray.count), height: squareSize)
//        scrollView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(15)
//            make.top.equalToSuperview().offset(15)
//            make.width.equalTo(squareSize)
//            make.height.equalTo(squareSize)
//        }
//        // расположение картинки и смена ее
//        for (index, imageName) in imageArray.enumerated() {
//            let imageView = UIImageView()
//            imageView.image = UIImage(named: imageName)
//            imageView.contentMode = .scaleAspectFill
//            imageView.layer.cornerRadius = 10 // Устанавливаем радиус закругления
//            imageView.clipsToBounds = true
//            
//            scrollView.addSubview(imageView)
//            
//            imageView.snp.makeConstraints { make in
//                make.width.equalTo(squareSize)
//                make.height.equalTo(squareSize)
//                make.leading.equalTo(squareSize * CGFloat(index))
//                make.centerY.equalToSuperview()
//            }
//        }
//        // кругляшки под картинкой
////        contentView.addSubview(pageControl)
////        pageControl.snp.makeConstraints { make in
////            make.centerX.equalTo(scrollView) // центр под scrollView
////            make.bottom.equalTo(scrollView.snp.bottom).offset(5) // под скрол вьюscrollView
////        }
//        
//        addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(15)
//            make.leading.equalTo(scrollView.snp.trailing).offset(15)
//            make.height.equalTo(20)
//        }
//        
//        addSubview(subtitleLabel)
//        subtitleLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom)
//            make.leading.equalTo(scrollView.snp.trailing).offset(15)
//        }
//        
//        addSubview(oldPriceLabel)
//        oldPriceLabel.snp.makeConstraints { make in
//            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
//            make.leading.equalTo(scrollView.snp.trailing).offset(15)
//        }
//        
//        addSubview(newPriceLabel)
//        newPriceLabel.snp.makeConstraints { make in
//            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
//            make.leading.equalTo(scrollView.snp.trailing).offset(15)
//        }
//        
////        addSubview(readyLabel)
////        readyLabel.snp.makeConstraints { make in
////            make.top.equalTo(newPriceLabel.snp.bottom).offset(20)
////            make.leading.equalTo(scrollView.snp.trailing).offset(15)
////        }
//        
//        contentView.addSubview(favoritesButton)
//        favoritesButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(15)
//            make.trailing.equalToSuperview().offset(-15)
//        }
//        
//        contentView.addSubview(cartButton)
//        cartButton.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-25)
//            make.trailing.equalToSuperview().offset(-15)
//        }
//    }
//    // делегат
//    private func setupDelegate() {
//        scrollView.delegate = self
//    }
//    // targets действия
//    private func setupTarget() {
//        favoritesButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
//        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
//    }
//    // Function for Favorites Button action
//    @objc private func favoritesButtonTapped() {
//        // Add your logic for favorites button action here
//        print("Favorites button tapped")
//        
//        let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
//        
//        if favoritesButton.currentImage == UIImage(systemName: "heart", withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal) {
//            // Если текущая иконка - "heart", то меняем на "heart.fill"
//            let filledHeartImage = UIImage(systemName: "heart.fill", withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
//            favoritesButton.setImage(filledHeartImage, for: .normal)
//        } else {
//            // В противном случае, возвращаем иконку к "heart"
//            let heartImage = UIImage(systemName: "heart", withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
//            favoritesButton.setImage(heartImage, for: .normal)
//        }
//    }
//    // Function for Cart Button action
//    @objc private func cartButtonTapped() {
//        // Add your logic for cart button action here
//        print("Cart button tapped")
//        
//        let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
//        
//        if cartButton.currentImage == UIImage(systemName: "cart", withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal) {
//            // Если текущая иконка - "cart", то меняем на "cart.fill"
//            let filledCartImage = UIImage(systemName: "cart.fill", withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
//            cartButton.setImage(filledCartImage, for: .normal)
//        } else {
//            // В противном случае, возвращаем иконку к "cart"
//            let cartImage = UIImage(systemName: "cart", withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
//            cartButton.setImage(cartImage, for: .normal)
//        }
//    }
//} // end
////MARK: - scroll func
//extension StudyCell {
//    // скролл функция1
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
//        // Check if pageIndex is not infinite or NaN
//        guard pageIndex.isFinite, !pageIndex.isNaN else {
//            return
//        }
//        // Convert to Int safely
//        let newIndex = Int(pageIndex)
//        // Check if newIndex is within the valid range
//        guard newIndex >= 0, newIndex < imageArray.count else {
//            return
//        }
//        
//        if newIndex != currentPageIndex {
//            currentPageIndex = newIndex
//            updateImageView()
//        }
//        pageControl.currentPage = newIndex
//    }
//    // скролл функция2
//    func updateImageView() {
//        guard currentPageIndex >= 0, currentPageIndex < imageArray.count else {
//            return
//        }
//        
//        let imageName = imageArray[currentPageIndex]
//        if let image = UIImage(named: imageName) {
//            if let imageView = scrollView.subviews[currentPageIndex] as? UIImageView {
//                imageView.image = image
//            }
//        }
//    }
//}

//
//  ItemCardCell.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//
*/
import UIKit
import SnapKit

final class studyVideoView: UIView {
    // цикл на 10 карточек
    private let data = Array(1...10).map { "Item \($0)" }
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
extension studyVideoView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
