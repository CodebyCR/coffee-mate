//
//  ViewController.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 27.02.25.
//

import UIKit

class MenuViewController: UIViewController {
    private let coffeeMenuViewController = CoffeeMenuViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setze Hintergrundfarbe
        view.backgroundColor = .white

        // NavigationsBar-Titel
        title = "Menu"
        setUpHeaderLabel(for: navigationController?.navigationBar)

        // Füge CoffeeMenuViewController als Kindview hinzu
        addChild(coffeeMenuViewController)
        view.addSubview(coffeeMenuViewController.view)
        coffeeMenuViewController.didMove(toParent: self)

        // Auto Layout Constraints für CoffeeMenuViewController
        coffeeMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coffeeMenuViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coffeeMenuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coffeeMenuViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coffeeMenuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    fileprivate func setUpHeaderLabel(for navigationBar: UINavigationBar?) {
        guard let navigationBar else {
            #if DEBUG
                print("NavigationBar is nil")
            #endif
            return
        }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .brown
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 24, weight: .bold)
        ]

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.prefersLargeTitles = false
    }
}

#Preview("MenuViewController") {
    UINavigationController(rootViewController: MenuViewController())
}
