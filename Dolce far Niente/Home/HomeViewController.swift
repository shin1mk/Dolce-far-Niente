//
//  HomeViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    // добавляем вью с данными
    private let homePicture1View = HomePicture1View()
    private let homePicture2View = HomePicture2View()
    private let homePicture3View = HomePicture3View()
    //MARK: Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Добавьте обработчики жестов для ваших вью с использованием тегов
        addTapGesture(to: homePicture1View, with: #selector(homePictureTapped(_:)))
        addTapGesture(to: homePicture2View, with: #selector(homePictureTapped(_:)))
        addTapGesture(to: homePicture3View, with: #selector(homePictureTapped(_:)))
        
        // Установите теги для ваших вью
        homePicture1View.tag = 1
        homePicture2View.tag = 2
        homePicture3View.tag = 3
    }
    // методы
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(homePicture1View)
        homePicture1View.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(homePicture2View)
        homePicture2View.snp.makeConstraints { make in
            make.top.equalTo(homePicture1View.snp.bottom)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(homePicture3View)
        homePicture3View.snp.makeConstraints { make in
            make.top.equalTo(homePicture2View.snp.bottom)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }
        // ограничение последней кнопки
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(homePicture3View.snp.bottom).offset(50)
        }
    }
    
    private func addTapGesture(to view: UIView, with action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func homePictureTapped(_ sender: UITapGestureRecognizer) {
        // Получите тег вью, который был нажат
        if let tappedView = sender.view {
            let tappedViewTag = tappedView.tag
            print("Home picture tapped: \(tappedViewTag)")
        }
    }
} // end
