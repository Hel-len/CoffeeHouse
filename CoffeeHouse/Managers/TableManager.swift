//
//  TableManager.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import UIKit

protocol TableManager {
    var cellId: String { get }
    func setupTableView()
    func rowTapped(row: IndexPath)
}

final class TableViewManager: UITableView, UITableViewDelegate, UITableViewDataSource {

    let viewModel: TableViewModel
    let view: UIView
    var index = 0
    var invoking: TableManager
    private var cellId = ""

    private var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(white: 1, alpha: 0.5)
        table.rowHeight = 80
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.cornerRadius = 30
        return table
    }()

    init(view: UIView, viewModel: TableViewModel, cellId: String, invoking: TableManager) {
        self.viewModel = viewModel
        self.view = view
        self.cellId = cellId
        self.invoking = invoking
        super.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
        setConstraints(to: view)
        tableView.delegate = self
        tableView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].cells.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = viewModel.sections[section].name
        label.textAlignment = .center
        label.font = UIFont(name: "Nasalization", size: 25)
        return label
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let currentContent = viewModel.sections[indexPath.section].cells[indexPath.row]

        var content = cell.defaultContentConfiguration()
        cell.backgroundColor = .red
        content.text = currentContent.content
        content.secondaryTextProperties.numberOfLines = 3
        content.secondaryText = currentContent.secondaryContent

        content.image = UIImage(named: currentContent.image)

        content.imageProperties.maximumSize = CGSize(width: 70, height: 70)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.backgroundColor = UIColor(white: 1, alpha: 0)

        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        invoking.rowTapped(row: indexPath)
    }

    func setConstraints(to superview: UIView) {
        tableView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 180).isActive = true
        tableView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 40).isActive = true
        tableView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -40).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: tableView.rowHeight * CGFloat(viewModel.sections[0].cells.count + 1)).isActive = true
    }
}
