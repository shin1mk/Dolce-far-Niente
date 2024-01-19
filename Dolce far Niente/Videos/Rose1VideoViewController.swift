//
//  Rose1VideoViewController.swift.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 20.01.2024.
//

import UIKit
import SnapKit

final class Rose1VideoViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 30)
        label.text = "Rose1 video"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemOrange
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
