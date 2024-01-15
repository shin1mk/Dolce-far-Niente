//
//  product1.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class product1_cell: UITableViewCell, UIScrollViewDelegate {
    private let imageArray = ["yellow", "red", "orange", "white"] // Замените на реальные имена ваших изображений
    // картинка товара
    private lazy var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        if let firstImageName = self.imageArray.first,
           let image = UIImage(named: firstImageName) {
            imageView.image = image
        }
        return imageView
    }()
    // название товара
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 25)
        label.text = "titleLabel"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    // второе название
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 14)
        label.text = "subtitleLabel"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    // scroll
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    // кругляшки под фото
    private let numberOfPages = 3 // Замените 3 на реальное количество страниц
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        return pageControl
    }()
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        setupDelegate()
        setupScrollViewContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
    }
    // methods
    private func setupConstraints() {
        backgroundColor = .white
        // изображение
        addSubview(customImageView)
        customImageView.layer.cornerRadius = 15
        customImageView.layer.masksToBounds = true
        customImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-35)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(customImageView.snp.height)
        }
        // добавьте pageControl
        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(customImageView.snp.bottom).offset(0)
            make.centerX.equalTo(customImageView) // Выравнивание по центру относительно customImageView
            make.bottom.equalToSuperview().offset(-10)
        }
        // название товара
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(customImageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25)
        }
        // второе название
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.leading.equalTo(customImageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25)
        }
    }
    // делегат
    private func setupDelegate() {
        scrollView.delegate = self
    }
    // Метод делегата UIScrollView, который будет вызываться при скроллировании
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        pageControl.currentPage = pageIndex
    }
    // Метод делегата UIScrollView, который будет вызываться при скроллировании
    private func setupScrollViewContent() {
        for (index, imageName) in imageArray.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * scrollView.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            scrollView.addSubview(imageView)
        }

        pageControl.numberOfPages = imageArray.count
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(imageArray.count), height: scrollView.frame.height)
    }


} // end
