//
//  product1.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class product1_cell: UITableViewCell, UIScrollViewDelegate {
    // array and prorperites
    private var imageArray = ["me", "me", "me", "me"]
    private var currentPageIndex = 0
    // scroll view
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    // кружочки под картинкой
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPage = 0
        pageControl.numberOfPages = imageArray.count
        return pageControl
    }()
    // название товара
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextRegular(ofSize: 25)
        label.text = "title"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    // второе название
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextRegular(ofSize: 25)
        label.text = "subtitle"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()    
    // старая цена
    private let oldPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 15)
        label.text = "1000 ₴"
        label.textAlignment = .left
        label.textColor = .systemRed
        // Add strikethrough style to the attributed text
        let attributedString = NSAttributedString(
            string: label.text ?? "",
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )

        label.attributedText = attributedString
        return label
    }()
    // новая цена
    private let newPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 20)
        label.text = "700 ₴"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()    
    // цена
    private let readyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextRegular(ofSize: 13)
        label.textAlignment = .left
        label.textColor = .systemGreen
        
        let text = "Отправка 2-3 дня "
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "delivery.png")
        attachment.bounds = CGRect(x: 0, y: -6, width: 20, height: 20)
        
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        return label
    }()
    // избранное
    private let favoritesButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default)
        let favoritesImage = UIImage(systemName: "heart", withConfiguration: configuration)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        button.setImage(favoritesImage, for: .normal)
        return button
    }()
    // корзина
    private let cartButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default)
        let cartImage = UIImage(systemName: "cart", withConfiguration: configuration)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        button.setImage(cartImage, for: .normal)
        return button
    }()
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        setupTarget()
        setupDelegate()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
    }
    // methods
    private func setupConstraints() {
        contentView.addSubview(scrollView)
        let squareSize: CGFloat = 150 // Размер квадрата
        scrollView.contentSize = CGSize(width: squareSize * CGFloat(imageArray.count), height: squareSize)
        scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(squareSize)
            make.height.equalTo(squareSize)
        }
        // расположение картинки и смена ее
        for (index, imageName) in imageArray.enumerated() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            scrollView.addSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.width.equalTo(squareSize)
                make.height.equalTo(squareSize)
                make.leading.equalTo(squareSize * CGFloat(index))
                make.centerY.equalToSuperview()
            }
        }
        // кругляшки под картинкой
        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView) // центр под scrollView
            make.top.equalTo(scrollView.snp.bottom).offset(5) // под скрол вьюscrollView
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(scrollView.snp.trailing).offset(15)
            make.height.equalTo(20)
        }
        
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(scrollView.snp.trailing).offset(15)
        }
        
        addSubview(oldPriceLabel)
        oldPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.leading.equalTo(scrollView.snp.trailing).offset(15)
        }
        
        addSubview(newPriceLabel)
        newPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            make.leading.equalTo(scrollView.snp.trailing).offset(15)
        }   
        
        addSubview(readyLabel)
        readyLabel.snp.makeConstraints { make in
            make.top.equalTo(newPriceLabel.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.trailing).offset(15)
        }   
        
        contentView.addSubview(favoritesButton)
        favoritesButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        contentView.addSubview(cartButton)
        cartButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-25)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    // делегат
    private func setupDelegate() {
        scrollView.delegate = self
    }
    // targets действия
    private func setupTarget() {
        favoritesButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
    }
    // Function for Favorites Button action
    @objc private func favoritesButtonTapped() {
        // Add your logic for favorites button action here
        print("Favorites button tapped")
    }
    // Function for Cart Button action
    @objc private func cartButtonTapped() {
        // Add your logic for cart button action here
        print("Cart button tapped")
    }
} // end
//MARK: - scroll func
extension product1_cell {
    // скролл функция1
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        // Check if pageIndex is not infinite or NaN
        guard pageIndex.isFinite, !pageIndex.isNaN else {
            return
        }
        // Convert to Int safely
        let newIndex = Int(pageIndex)
        // Check if newIndex is within the valid range
        guard newIndex >= 0, newIndex < imageArray.count else {
            return
        }
        
        if newIndex != currentPageIndex {
            currentPageIndex = newIndex
            updateImageView()
        }
        pageControl.currentPage = newIndex
    }
    // скролл функция2
    func updateImageView() {
        guard currentPageIndex >= 0, currentPageIndex < imageArray.count else {
            return
        }
        
        let imageName = imageArray[currentPageIndex]
        if let image = UIImage(named: imageName) {
            if let imageView = scrollView.subviews[currentPageIndex] as? UIImageView {
                imageView.image = image
            }
        }
    }
}
