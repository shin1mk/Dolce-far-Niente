//
//  StoreViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class ShopViewController: UIViewController {
    // добавляем вью с карточками
    private let itemCardView = ItemCardView()
    private let shopCardView = ShopCardView()
    // свойства
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 30)
        label.text = "Dolce Store"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 20)
        label.text = "Category"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextMedium(ofSize: 20)
        label.text = "Shop by product"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
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
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shopCardView.scrollToInitialItem()
    }
    // констрейнты
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
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(30)
        }
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(25)
        }
        
        contentView.addSubview(shopCardView)
        shopCardView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(510)
            make.width.equalTo(view) // Добавлено для горизонтальной прокрутки
        }
        
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(shopCardView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25) // Установите подходящую высоту
        }
        
        contentView.addSubview(itemCardView)
        itemCardView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(930)
//            make.bottom.equalTo(scrollView.snp.bottom).offset(-15)
            make.bottom.equalToSuperview().offset(-5)
        }
        // ограничение последней кнопки
        contentView.snp.makeConstraints { make in
//            make.bottom.equalTo(itemCardView.snp.bottom).offset(5)
        }
    }
}
