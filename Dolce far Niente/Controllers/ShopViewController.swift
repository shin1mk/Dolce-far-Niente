//
//  StoreViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class ShopViewController: UIViewController {
    // массив картинок
    private let images = ["red", "yellow", "orange"]
    // свойства
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.SFUITextHeavy(ofSize: 30)
        label.text = "Dolce Store"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUITextHeavy", size: 30)
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Where does it come from Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from e Finibus Bonorum et Maloru by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    // таблица
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(storeCustomCell.self, forCellWithReuseIdentifier: "storeCustomCell")
        collectionView.showsHorizontalScrollIndicator = false // Убираем полосу прокрутки
        collectionView.isScrollEnabled = true

        return collectionView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollToInitialItem()
    }
    // констрейнты
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        titleLabel.layer.zPosition = 999
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(30)
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        scrollView.addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(510)
            make.width.equalTo(view) // Добавлено для горизонтальной прокрутки
        }

        scrollView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(0)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(500) // Установите подходящую высоту
        }

        let moreView = MoreView()
        scrollView.addSubview(moreView)
        moreView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1000)
            make.bottom.equalToSuperview()
        }
    }
    // скролл на первую картинку
    private func scrollToInitialItem() {
        let initialIndexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: initialIndexPath, at: .centeredHorizontally, animated: false)
    }
    // делегаты
    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: CollectionView settings
extension ShopViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // размер карточки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width - 70
        let cellHeight: CGFloat = 500
        return CGSize(width: cellWidth, height: cellHeight)
    }
    // количество картинок по количеству картинок в массиве
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    // содержимое
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCustomCell", for: indexPath) as! storeCustomCell
        cell.imageName = self.images[indexPath.item]
        return cell
    }
    // нажатие с присвоением индекса
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Обработка нажатия на ячейку, например, выводим номер нажатой ячейки
        print("Selected item at index: \(indexPath.item)")
        
    }
}
//MARK: StoreCustomCell
final class storeCustomCell: UICollectionViewCell {
    var imageName: String? {
        didSet {
            guard let imageName = imageName else { return }
            backgroundImage.image = UIImage(named: imageName)
        }
    }
    // свойства
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    // цикл
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    // инит
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // констрейнты
    private func setupUI() {
        contentView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
