
//
//  StoreViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class StudyViewController: UIViewController {
    // добавляем вью с карточками
    private let studyVideoView = StudyVideoView()
    private let studyCardView = StudyCardView()
    private let tutorialView = TutorialView()
    private let tutorialPassword = "1111"

    // свойства
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextBold(ofSize: 30)
        label.text = "Dolce Study"
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
        label.text = "Shop by video"
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
        setupGesture()
        configureDidSelectItemCARD()
        configureDidSelectItemVideo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        studyCardView.scrollToInitialItem()
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
        // субтайтл
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(25)
        }
        // стади кард большие
        contentView.addSubview(studyCardView)
        studyCardView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(510)
            make.width.equalTo(view) // Добавлено для горизонтальной прокрутки
        }
        // туториал
        contentView.addSubview(tutorialView)
        tutorialView.snp.makeConstraints { make in
            make.top.equalTo(studyCardView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(200)
        }
        // описание
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(tutorialView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(25) // Установите подходящую высоту
        }
        // карточки с видосами
        contentView.addSubview(studyVideoView)
        studyVideoView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(930)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    // добавим жест для туториал вью потому что он один
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tutorialViewTapped))
        tutorialView.addGestureRecognizer(tapGesture)
        tutorialView.isUserInteractionEnabled = true
    }
    // функция туториал вью открываем его контроллер
//    @objc private func tutorialViewTapped() {
//        print("TutorialView tapped")
//        let tutorialVC = TutorialViewController()
//        navigationController?.pushViewController(tutorialVC, animated: true)
//    }
    @objc private func tutorialViewTapped() {
        presentPasswordAlert()
    }

    private func presentPasswordAlert() {
        let alertController = UIAlertController(title: "Введите пароль", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Пароль"
            textField.isSecureTextEntry = true
        }

        let checkPasswordAction = UIAlertAction(title: "OK", style: .default) { [weak self, weak alertController] _ in
            self?.validatePassword(alertController?.textFields?.first?.text)
        }

        alertController.addAction(checkPasswordAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    private func validatePassword(_ enteredPassword: String?) {
        guard let enteredPassword = enteredPassword, enteredPassword == tutorialPassword else {
            print("Неверный пароль")
            // Здесь вы можете вывести сообщение об ошибке или предпринять другие действия
            return
        }

        print("Верный пароль, открываю TutorialViewController")
        let tutorialVC = TutorialViewController()
        navigationController?.pushViewController(tutorialVC, animated: true)
    }
} // end
//MARK: - нажатая ячейка и выбираем ее кейс и вызываем функцию
extension StudyViewController {
    // обрабатываем что б не было утечек памяти
    private func configureDidSelectItemCARD() {
        studyCardView.didSelectItem = { [weak self] index in
            guard let self = self else { return }
            self.handleCellSelectionCARD(index: index)
        }
    }
    // получаем индекс и вызываем функцию курсы 3 ячейки
    private func handleCellSelectionCARD(index: Int) {
        switch index {
        case 0:
            print("RoseCourseViewController")
            let roseCourseVC = RoseCourseViewController()
            navigationController?.pushViewController(roseCourseVC, animated: true)
        case 1:
            print("ProCourseViewController")
            let proCourseVC = ProCourseViewController()
            navigationController?.pushViewController(proCourseVC, animated: true)
        case 2:
            print("ExoticCourseViewController")
            let exoticCourseVC = ExoticCourseViewController()
            navigationController?.pushViewController(exoticCourseVC, animated: true)
        default:
            break
        }
    }
    // вызываем функцию для 10 ячеек видео
    private func configureDidSelectItemVideo() {
        studyVideoView.didSelectItem = { [weak self] index in
            guard let self = self else { return }
            self.handleCellSelectionVideo(index: index)
        }
    }
    // получаем индекс и вызываем функцию
    private func handleCellSelectionVideo(index: Int) {
        switch index {
        case 0:
            print("RoseCourseViewController")
            let rose1vc = Rose1VideoViewController()
            navigationController?.pushViewController(rose1vc, animated: true)
        case 1:
            print("ProCourseViewController")
            let proCourseVC = ProCourseViewController()
            navigationController?.pushViewController(proCourseVC, animated: true)
        case 2:
            print("ExoticCourseViewController")
            let exoticCourseVC = ExoticCourseViewController()
            navigationController?.pushViewController(exoticCourseVC, animated: true)
        default:
            // Действия для других ячеек, если необходимо
            break
        }
    }
}
