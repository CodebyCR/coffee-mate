//
//  CoffeeTableView.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 27.02.25.
//

import UIKit

class CoffeeTableView: UIViewController {
    private let cellIdentifier = "CoffeeCell"

    var coffeeTable: UITableView = .init()
    let coffees = [
        Coffee(number: 1, title: "Cappuccino", price: 3.50),
        Coffee(number: 2, title: "Espresso", price: 2.50),
        Coffee(number: 3, title: "Latte", price: 4.00),
        Coffee(number: 4, title: "Mocha", price: 4.50),
        Coffee(number: 5, title: "Americano", price: 2.00),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // coffeeTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeTable)
        coffeeTable.rowHeight = 60
        coffeeTable.separatorStyle = .none
        coffeeTable.backgroundColor = .systemGray6

        coffeeTable.delegate = self
        coffeeTable.dataSource = self
        coffeeTable.register(CoffeeTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        coffeeTable.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            coffeeTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coffeeTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coffeeTable.topAnchor.constraint(equalTo: view.topAnchor),
            coffeeTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CoffeeTableView: UITableViewDelegate, UITableViewDataSource {
    /// Number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffees.count
    }

    /// Adds the data to the specific cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CoffeeTableViewCell else {
            print("Could not dequeue cell")
            return UITableViewCell()
        }

        let currentCoffee = coffees[indexPath.row]
        print(currentCoffee)
        cell.configure(with: currentCoffee)

        return cell
    }
}

#Preview("CoffeeTableView") {
    UINavigationController(rootViewController: CoffeeTableView())
}
