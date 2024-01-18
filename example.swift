//
//  example.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//
/*
 

 
 
 список таблица
 //import UIKit
 //import SnapKit
 //
 //final class StudyViewController: UIViewController {
 //    //MARK: Properties
 //    private let titleLabel: UILabel = {
 //        let label = UILabel()
 //        label.font = UIFont.SFUITextBold(ofSize: 30)
 //        label.text = "Dolce Study"
 //        label.textAlignment = .left
 //        label.textColor = .white
 //        return label
 //    }()
 //    // таблица
 //    private let tableView: UITableView = {
 //        let tableView = UITableView()
 //        tableView.backgroundView = nil
 //        tableView.register(StudyCell.self, forCellReuseIdentifier: "StudyCell")
 //        return tableView
 //    }()
 //    // обновление пулл ту рефрешь
 //    private let refreshControl = UIRefreshControl()
 //    //MARK: Lifecycle
 //    override func viewDidLoad() {
 //        super.viewDidLoad()
 //        setupConstraints()
 //        setupTableView()
 //        setupTarget()
 //    }
 //    // constraints
 //    private func setupConstraints() {
 //        view.backgroundColor = .black
 //        // title
 //        view.addSubview(titleLabel)
 //        titleLabel.snp.makeConstraints { make in
 //            make.centerX.equalToSuperview()
 //            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
 //            make.leading.equalToSuperview().offset(15)
 //            make.trailing.equalToSuperview().offset(-15)
 //        }
 //        // table view
 //        view.addSubview(tableView)
 //        tableView.snp.makeConstraints { make in
 //            make.top.equalTo(titleLabel.snp.bottom).offset(5)
 //            make.leading.trailing.bottom.equalToSuperview().offset(0)
 //        }
 //    }
 //    // setupTable
 //    private func setupTableView() {
 //        tableView.delegate = self
 //        tableView.dataSource = self
 //        tableView.refreshControl = refreshControl
 //    }
 //    // setupTargets
 //    private func setupTarget() {
 //        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
 //    }
 //    // функция pull to refresh
 //    @objc private func refreshData() {
 //        // Имитация задержки загрузки в течение 1 секунд
 //        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
 //            self.tableView.reloadData()
 //            self.refreshControl.endRefreshing()
 //        }
 //    }
 //}
 ////MARK: Настройки таблицы
 //extension StudyViewController: UITableViewDelegate, UITableViewDataSource {
 //    // количество ячеек
 //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //        return 15
 //    }
 //    // высота ячеек
 //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 //        return 150
 //    }
 //    // при нажатии на ячейки
 //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 //        tableView.deselectRow(at: indexPath, animated: true)
 //        print("didSelect \(indexPath)")
 //    }
 //    // ячейки кастомные
 //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //
 //        switch indexPath.row {
 //        case 0:
 //            let cellIdentifier = "StudyCell"
 //            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StudyCell
 //            return cell
 //
 //        default:
 //            let cellIdentifier = "StudyCell"
 //            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StudyCell
 //            return cell
 //        }
 //    }
 //} // end

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 */
