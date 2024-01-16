//
//  CartViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class CartViewController: UIViewController, UIScrollViewDelegate {
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
//    private var imageArray = ["red", "yellow", "orange", "white"]
    private var imageArray = ["me", "me", "me", "me"]
    private var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateImageView()
        setupDelegate()
    }
    
    private func setupDelegate() {
        scrollView.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        let squareSize: CGFloat = 300 // Размер квадрата
        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(squareSize)
            make.height.equalTo(squareSize)
        }
        
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
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom).offset(20)
        }
        
        scrollView.contentSize = CGSize(width: squareSize * CGFloat(imageArray.count), height: squareSize)
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
