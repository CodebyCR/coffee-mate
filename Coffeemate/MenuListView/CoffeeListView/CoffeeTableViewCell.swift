//
//  CoffeeTableViewCell.swift
//  Coffeemate
//
//  Created by Christoph Rohde on 01.03.25.
//

import UIKit

struct Coffee {
    let number: Int
    let title: String
    let price: Double
}

final class CoffeeTableViewCell: UITableViewCell {
    private let numberLabel = UILabel()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let separatorView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Hintergrundfarbe und Stil
        backgroundColor = .white
        selectionStyle = .none

        // Number Label
        numberLabel.font = UIFont.systemFont(ofSize: 16)
        numberLabel.textColor = .black
        contentView.addSubview(numberLabel)

        // Title Label
        titleLabel.font = UIFont.italicSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)

        // Price Label
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .right
        contentView.addSubview(priceLabel)

        // Separator
        separatorView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        contentView.addSubview(separatorView)

        setupConstraints()
    }

    private func setupConstraints() {
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Number Label
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            // Title Label
            titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            // Price Label
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 20),

            // Separator
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }

    func configure(with coffee: Coffee) {
        numberLabel.text = String(coffee.number)
        titleLabel.text = coffee.title
        priceLabel.text = String(format: "%.2f €", coffee.price)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Zellhöhe anpassen
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
}

#Preview("CoffeeTableViewCell") {
    let demoCoffee = Coffee(number: 1, title: "Capuccino", price: 3.60)
    let demoCell = CoffeeTableViewCell(style: .default, reuseIdentifier: "cell")
    demoCell.frame = CGRect(x: 0, y: 150, width: 320, height: 100)
    demoCell.configure(with: demoCoffee)

    return demoCell
}

#Preview("CoffeeTableView") {
    UINavigationController(rootViewController: CoffeeTableView())
}
