//
//  MainTabBarController.swift
//  Dolce far Niente
//
//  Created by SHIN MIKHAIL on 14.01.2024.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        tabBar.backgroundColor = UIColor.systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
     }
    //MARK: Create TabBar
    private func generateTabBar() {
        
        viewControllers = [
            generateVC(
                viewController: ShopViewController(),
                title: "Shop",
                image: UIImage(systemName: "bag")),
            generateVC(
                viewController: StudyViewController(),
                title: "Study",
                image: UIImage(systemName: "video")),
            generateVC(
                viewController: CourseViewController(),
                title: "Bag",
                image: UIImage(systemName: "house")),
            generateVC(
                viewController: MoreViewController(),
                title: "Еще",
                image: UIImage(systemName: "person.fill.badge.plus"))
        ]
    }
    // Generate View Controllers
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
