//
//  ViewController.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 27.02.25.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Title
        title = "Coffee Mate"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font: UIFont.systemFont(ofSize: 24, weight: .bold),
        ]

        let scrollView = UIScrollView()
        scrollView.frame = view.frame
        view.addSubview(scrollView)

        let coffeeTable = CoffeeTableView()
        coffeeTable.view.frame = CGRect(x: 0, y: 120, width: view.frame.width, height: view.frame.height - 140)
//        coffeeTable.view.layer.borderColor = UIColor.brown.cgColor
//        coffeeTable.view.layer.borderWidth = 1
        scrollView.addSubview(coffeeTable.view)
    }

    private func getTitle() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = "Coffee Mate"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .brown
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)

        return titleLabel
    }
}

#Preview("MainViewController") {
    UINavigationController(rootViewController: MainViewController())
}
