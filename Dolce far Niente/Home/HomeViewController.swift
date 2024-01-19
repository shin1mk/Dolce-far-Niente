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
    private let homePicture4View = HomePicture4View()
    private let haveAQuestionsView = HaveAQuestionsView()
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
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestureRecognizers()
    }
    // методы
    private func setupUI() {
        view.backgroundColor = .black
        // добавили скролл
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // добавили сверху контент вью
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        // картинка 1 обучение
        contentView.addSubview(homePicture1View)
        homePicture1View.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }
        // картинка 2 магазин
        contentView.addSubview(homePicture2View)
        homePicture2View.snp.makeConstraints { make in
            make.top.equalTo(homePicture1View.snp.bottom)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }
        // картинка 3 книга
        contentView.addSubview(homePicture3View)
        homePicture3View.snp.makeConstraints { make in
            make.top.equalTo(homePicture2View.snp.bottom)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }    
        // картинка 4
        contentView.addSubview(homePicture4View)
        homePicture4View.snp.makeConstraints { make in
            make.top.equalTo(homePicture3View.snp.bottom)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }   
        // блок вопросы
        contentView.addSubview(haveAQuestionsView)
        haveAQuestionsView.snp.makeConstraints { make in
            make.top.equalTo(homePicture4View.snp.bottom).offset(-1)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(70)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-1)
        }
    }
} // end
//MARK: тапы по картинкам
extension HomeViewController {
    // присваиваем тэг
    private func setupGestureRecognizers() {
        setupTapGesture(for: homePicture1View, withTag: 1)
        setupTapGesture(for: homePicture2View, withTag: 2)
        setupTapGesture(for: homePicture3View, withTag: 3)
        setupTapGesture(for: homePicture4View, withTag: 4)
    }

    private func setupTapGesture(for view: UIView, withTag tag: Int) {
        addTapGesture(to: view, with: #selector(homePictureTapped(_:)))
        view.tag = tag
    }
    // добавляем жест нажатия
    private func addTapGesture(to view: UIView, with action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    // функция нажатия
    @objc private func homePictureTapped(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            let tappedViewTag = tappedView.tag

            switch tappedViewTag {
            case 1:
                print("Home picture tapped: \(tappedViewTag) - учеба 1")
                transitionToTab(index: 2) // Индекс таба "study" в массиве таб-бара
            case 2:
                print("Home picture tapped: \(tappedViewTag) - магазин 2")
                transitionToTab(index: 1) // Индекс таба "shop" в массиве таб-бара
            case 3:
                print("Home picture tapped: \(tappedViewTag) - уникальный 3")
                // Ваш код для третьей картинки
            case 4:
                print("Home picture tapped: \(tappedViewTag) - туториал 4")
                // Ваш код для третьей картинки
            default:
                break
            }
        }
    }
    // переход на таб с анимацией
    private func transitionToTab(index: Int) {
        guard let tabBarController = self.tabBarController else { return }

        let fromView = tabBarController.selectedViewController?.view
        let toView = tabBarController.viewControllers?[index].view

        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: .transitionCrossDissolve, completion: nil)
        
        tabBarController.selectedIndex = index
    }
}
