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
        self.setupTabBar()

        // Do any additional setup after loading the view.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

    fileprivate func setupTabBar() {
        // OrderList Item
        let ordersViewController = OrderListViewController()
        ordersViewController.title = "Orders"
        ordersViewController.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "tray.and.arrow.down.fill"), tag: 0)

        // Menu Item
        let menuViewController = MenuViewController()
        menuViewController.title = "Menu"
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

        // color of selected tab
        self.tabBar.tintColor = .brown

        self.selectedIndex = 1
    }
}

#Preview() {
    UINavigationController(rootViewController: MainTabBarViewController())
}
