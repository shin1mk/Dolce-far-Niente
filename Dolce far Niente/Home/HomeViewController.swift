//
//  HomeViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    //MARK: Properties
    // свойства
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 30)
        label.text = "Dolce candle"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let image0View: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home_bg0")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let image1View: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home_bg1")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(0) // Отступ слева
            make.trailing.equalToSuperview().offset(0) // Отступ справа
            make.bottom.equalToSuperview() // Если есть отступ снизу
        }
        
        scrollView.addSubview(titleLabel)
        titleLabel.layer.zPosition = 100
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(15) // Спускаем на 15 поинтов
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(30)
        }
        scrollView.addSubview(image0View)
        image0View.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(0) // Спускаем на 15 поинтов
            
            //            make.top.equalTo(titleLabel.snp.bottom).offset(-30)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview().offset(0) // Ширина минус двойной отступ (15 с обеих сторон)
            make.bottom.lessThanOrEqualToSuperview().offset(-15)
        }   
        
        scrollView.addSubview(image1View)
        image1View.snp.makeConstraints { make in
            make.top.equalTo(image0View.snp.bottom).offset(0)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview().offset(0) // Ширина минус двойной отступ (15 с обеих сторон)
            make.bottom.lessThanOrEqualToSuperview().offset(-15)
        }
    }
    
} //end
