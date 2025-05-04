//
//  MainTabBarViewController.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 05.03.25.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setupTabBar()

        // Do any additional setup after loading the view.
    }

    fileprivate func setupTabBar() {
        // OrderList Item
        let ordersViewController = OrderListViewController()
        ordersViewController.title = "Orders"
        ordersViewController.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "tray.and.arrow.down.fill"), tag: 0)

        // Menu Item
        let menuViewController = MenuViewController()
        menuViewController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "list.bullet"), tag: 1)

        // Cart Item
        let cartViewController = CartListViewController()
        cartViewController.title = "Cart"
        cartViewController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)

        self.setViewControllers([
            UINavigationController(rootViewController: ordersViewController),
            UINavigationController(rootViewController: menuViewController),
            UINavigationController(rootViewController: cartViewController),
        ], animated: true)

        // title height
        self.viewControllers?.forEach { $0.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8) }

        // color of selected tab
        self.tabBar.tintColor = .brown

        self.selectedIndex = 1
    }
}

#Preview() {
    UINavigationController(rootViewController: MainTabBarViewController())
}
