//
//  ViewController.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 27.02.25.
//

import UIKit

class MainViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let coffeeTableView = CoffeeTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setze Hintergrundfarbe
        view.backgroundColor = .white

        // NavigationsBar-Titel
        title = "Coffee Mate"
        setUpHeaderLabel(for: navigationController?.navigationBar)

        // Setup der View-Hierarchie
        view.addSubview(scrollView)

        // Füge CoffeeTableView als Kindview hinzu
        addChild(coffeeTableView)
        scrollView.addSubview(coffeeTableView.view)
        coffeeTableView.didMove(toParent: self)

        // Auto Layout Constraints
        NSLayoutConstraint.activate([
            // ScrollView Constraints
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // CoffeeTableView Constraints
//            coffeeTableView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            coffeeTableView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            coffeeTableView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            coffeeTableView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            coffeeTableView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            coffeeTableView.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            coffeeTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            coffeeTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            coffeeTableView.view.heightAnchor.constraint(equalToConstant: 500) // Feste Höhe
        ])

        // Deaktiviere Autoresizing-Maske
        coffeeTableView.view.translatesAutoresizingMaskIntoConstraints = false
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

#Preview("MainViewController") {
    UINavigationController(rootViewController: MainViewController())
}
