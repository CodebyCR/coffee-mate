//
//  CoffeeTableView.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 27.02.25.
//

import UIKit

class CoffeeTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var coffeeTable: UITableView = .init()
    let coffees = ["Cappucino", "Espresso", "Latte", "Americano", "Mocha", "Macchiato"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // coffeeTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeTable)
        coffeeTable.delegate = self
        coffeeTable.dataSource = self
        coffeeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        coffeeTable.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            coffeeTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coffeeTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coffeeTable.topAnchor.constraint(equalTo: view.topAnchor),
            coffeeTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")

        cell.textLabel?.text = coffees[indexPath.row]
        return cell
    }
}

#Preview("CoffeeTableView") {
    UINavigationController(rootViewController: CoffeeTableView())
}
