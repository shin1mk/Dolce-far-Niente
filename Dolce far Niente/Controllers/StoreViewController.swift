//
//  MainViewController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import UIKit
import SnapKit

final class StoreViewController: UIViewController {
    //MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Dolce Store"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(product1_cell.self, forCellReuseIdentifier: "product1_cell")
        return tableView
    }()
    private let refreshControl = UIRefreshControl()
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    private func setupUI() {
        view.backgroundColor = .white
        // title
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        // table view
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
    }
}
extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    // количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    // высота ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    // при нажатии ничего
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // ячейки кастомные
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cellIdentifier = "product1_cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! product1_cell
            return cell
        case 1:
            let cellIdentifier = "product1_cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! product1_cell
            return cell
//        case 2:
//            let cellIdentifier = "artillery_systems_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! artillery_systems_Cell
//            return cell
//        case 3:
//            let cellIdentifier = "personnel_units_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! personnel_units_Cell
//            return cell
//        case 4:
//            let cellIdentifier = "tanks_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! tanks_Cell
//            return cell
//        case 5:
//            let cellIdentifier = "mlrs_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! mlrs_Cell
//            return cell
//        case 6:
//            let cellIdentifier = "planes_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! planes_Cell
//            return cell
//        case 7:
//            let cellIdentifier = "helicopters_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! helicopters_Cell
//            return cell
//        case 8:
//            let cellIdentifier = "vehicles_fuel_tanks_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! vehicles_fuel_tanks_Cell
//            return cell
//        case 9:
//            let cellIdentifier = "warships_cutters_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! warships_cutters_Cell
//            return cell
//        case 10:
//            let cellIdentifier = "cruise_missiles_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! cruise_missiles_Cell
//            return cell
//        case 11:
//            let cellIdentifier = "uav_systems_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! uav_systems_Cell
//            return cell
//        case 12:
//            let cellIdentifier = "special_military_equip_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! special_military_equip_Cell
//            return cell
//        case 13:
//            let cellIdentifier = "atgm_srbm_systems_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! atgm_srbm_systems_Cell
//            return cell
//        case 14:
//            let cellIdentifier = "submarines_Cell"
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! submarines_Cell
//            return cell
        default:
            let cellIdentifier = "product1_cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! product1_cell
            return cell
        }
    }
}
