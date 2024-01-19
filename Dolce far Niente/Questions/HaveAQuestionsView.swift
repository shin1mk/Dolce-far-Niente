//
//  HaveAQuestionsView.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 19.01.2024.
//

import UIKit
import SnapKit

final class HaveAQuestionsView: UIView {
    // Лейбл "ЕСТЬ вопросы?"
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Остались вопросы?\nСвяжитесь с Нами"
        label.textColor = .white
        label.font = UIFont.SFUITextMedium(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    // telegram
    private let telegramButton: UIButton = {
        let button = UIButton()
        if let telegramIcon = UIImage(named: "telegram_app") {
            let resizedIcon = telegramIcon.resized(to: CGSize(width: 35, height: 35))
            button.setImage(resizedIcon, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        return button
    }()
    // instagram
    private let instagramButton: UIButton = {
        let button = UIButton()
        if let telegramIcon = UIImage(named: "instagram_app") {
            let resizedIcon = telegramIcon.resized(to: CGSize(width: 40, height: 40))
            button.setImage(resizedIcon, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        return button
    }()
    // цикл
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTargets()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupTargets()
    }
    // метод
    private func setupUI() {
        backgroundColor = .systemGray6
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        addSubview(instagramButton)
        instagramButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
        }
        addSubview(telegramButton)
        telegramButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(instagramButton.snp.leading).offset(-15)
        }
    }
    
    private func setupTargets() {
        telegramButton.addTarget(self, action: #selector(telegramButtonTapped), for: .touchUpInside)
        instagramButton.addTarget(self, action: #selector(instagramButtonTapped), for: .touchUpInside)
    }
    
    // Обработчик для кнопки "телеграм"
    @objc private func telegramButtonTapped() {
        print("telegram button tapped")
        if let telegramURL = URL(string: "https://t.me/shinmikhail") {
            UIApplication.shared.open(telegramURL, options: [:], completionHandler: nil)
        }
    }
    // Обработчик для кнопки "инстаграм"
    @objc private func instagramButtonTapped() {
        print("instagram button tapped")
 
        if let instagramURL = URL(string: "https://www.instagram.com/dolce.far.niente.candle/") {
            UIApplication.shared.open(instagramURL, options: [:], completionHandler: nil)
        }
    }
}
// расширение для уменьшения размера картинки
extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
