//
//  CourseViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

//import UIKit
//import SnapKit
//
//final class CourseViewController: UIViewController {
//    //MARK: Properties
//    //MARK: Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray2
//    }
//
//    private func setupUI() {
//
//    }
//
//}

//
//
//  ScrollCardViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class CourseViewController: UIViewController, UIScrollViewDelegate {
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPage = 0
        pageControl.numberOfPages = imageArray.count
        return pageControl
    }()
    private var imageArray = ["red", "yellow", "orange"]
    //    private var imageArray = ["me", "me", "me", "me"]
    private var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Устанавливаем начальное смещение для показа изображения с индексом 1
        let xOffset = UIScreen.main.bounds.width
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
        
        updateImageView()
        setupDelegate()
    }
    
    private func setupDelegate() {
        scrollView.delegate = self
    }
    
    //    private func setupUI() {
    //        view.backgroundColor = .systemGray5
    //
    //        view.addSubview(scrollView)
    //        let squareSize: CGFloat = UIScreen.main.bounds.width
    //
    //        scrollView.snp.makeConstraints { make in
    //            make.top.equalToSuperview()  // Закрепить верхнюю границу скролл-вью к верхней границе экрана
    //            make.leading.equalToSuperview() // Закрепить левую границу скролл-вью к левой границе экрана
    //            make.trailing.equalToSuperview()// Закрепить правую границу скролл-вью к правой границе экрана
    //            make.height.equalTo(600)     // Установить высоту скролл-вью в 500 пикселей
    //        }
    //
    //        let spacingBetweenImages: CGFloat = 50
    //
    //        for (index, imageName) in imageArray.enumerated() {
    //            let imageView = UIImageView()
    //            imageView.image = UIImage(named: imageName)
    //            imageView.layer.cornerRadius = 15
    //            imageView.clipsToBounds = true
    //            imageView.contentMode = .scaleToFill
    //            scrollView.addSubview(imageView)
    //
    //            imageView.snp.makeConstraints { make in
    //                make.width.equalTo(UIScreen.main.bounds.width - 2 * spacingBetweenImages)
    //                make.height.equalTo(500)
    //                make.leading.equalTo(UIScreen.main.bounds.width * CGFloat(index) + spacingBetweenImages)
    //                make.top.equalToSuperview()
    //            }
    //        }
    //
    //
    //        view.addSubview(pageControl)
    //        pageControl.snp.makeConstraints { make in
    //            make.centerX.equalToSuperview()
    //            make.top.equalTo(scrollView.snp.bottom).offset(0)
    //        }
    //
    //        scrollView.contentSize = CGSize(width: squareSize * CGFloat(imageArray.count), height: squareSize)
    //    }
    private func setupUI() {
        // Устанавливаем цвет фона для контроллера
        view.backgroundColor = .systemGray5
        // Добавляем scrollView на главное представление
        view.addSubview(scrollView)
        let squareSize: CGFloat = UIScreen.main.bounds.width
        // Устанавливаем ограничения для scrollView
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(600) // Уменьшаем высоту scrollView
        }
        // Вычисляем ширину каждого изображения так, чтобы они влезли на экран
        let imageWidth = squareSize - 70 // 20 - промежуток между изображениями
        let spacingBetweenImages: CGFloat = 10 // Уменьшаем промежуток между изображениями
        // Создаем изображения и добавляем их в scrollView
        for (index, imageName) in imageArray.enumerated() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.layer.cornerRadius = 15
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleToFill
            scrollView.addSubview(imageView)
            // Устанавливаем ограничения для каждого изображения внутри scrollView
            imageView.snp.makeConstraints { make in
                make.width.equalTo(imageWidth)
                make.height.equalTo(500) // Уменьшаем высоту изображения
//                make.leading.trailing.equalTo(CGFloat(index) * (imageWidth + spacingBetweenImages) + spacingBetweenImages)

                // Отступы с обеих сторон
                make.leading.equalTo(CGFloat(index) * (imageWidth + spacingBetweenImages) + spacingBetweenImages)

                make.leading.equalTo(CGFloat(index) * (imageWidth + spacingBetweenImages) + spacingBetweenImages)
                make.trailing.equalToSuperview().offset(-(CGFloat(imageArray.count - index - 1) * (imageWidth + spacingBetweenImages) + spacingBetweenImages))
                make.top.equalToSuperview()
            }
        }
        // Добавляем UIPageControl на главное представление
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom).offset(10)
        }
        // Устанавливаем размер контента scrollView
        scrollView.contentSize = CGSize(width: CGFloat(imageArray.count) * (imageWidth + spacingBetweenImages), height: 400)
    }

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
    
    
    private func updateImageView() {
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
