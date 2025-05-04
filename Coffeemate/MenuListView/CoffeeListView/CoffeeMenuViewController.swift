//
//  CoffeeMenuViewController.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 05.03.25.
//

import UIKit

class CoffeeMenuViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let coffeeTableView = CoffeeTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setze Hintergrundfarbe
        view.backgroundColor = .white

        // Setup der View-Hierarchie
        view.addSubview(scrollView)

        // Füge CoffeeTableView als Kindview hinzu
        addChild(coffeeTableView)
        scrollView.addSubview(coffeeTableView.view)
        coffeeTableView.didMove(toParent: self)

        // Auto Layout Constraints
        NSLayoutConstraint.activate([
            // ScrollView Constraints
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            coffeeTableView.view.topAnchor.constraint(equalTo: view.topAnchor),
            coffeeTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            coffeeTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            coffeeTableView.view.heightAnchor.constraint(equalToConstant: 600) // Feste Höhe
        ])

        // Deaktiviere Autoresizing-Maske
        coffeeTableView.view.translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview("CoffeeMenuViewController") {
    UINavigationController(rootViewController: CoffeeMenuViewController())
}
