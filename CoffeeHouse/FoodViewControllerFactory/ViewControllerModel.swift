//
//  ViewControllerModel.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//

import UIKit

protocol SelectionViewController {

    var backgroundImage: UIImageView { get }
    var greetingLabel: UILabel { get }
    var tableView: UITableView { get }
    var tableViewModel: TableViewModel { get }
    var cellId: String { get }
    var selectedView: UIImageView { get }
    var selectedLabel: UILabel { get }

    init(image: String, greeting: String, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)

    func setupViews()
    func setConstraints()
    func displayData(viewModel: Selection.Model.ViewModel.ViewModelData)

}

extension SelectionViewController {

    func setConstraints(superView: UIView) {
        backgroundImage.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true

        greetingLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20).isActive = true
        greetingLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20).isActive = true
        greetingLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 60).isActive = true
        greetingLabel.heightAnchor.constraint(equalToConstant: 130).isActive = true

        selectedView.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: 0).isActive = true
        selectedView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        selectedView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -50).isActive = true
        selectedView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        selectedLabel.centerXAnchor.constraint(equalTo: selectedView.centerXAnchor, constant: 0).isActive = true
        selectedLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        selectedLabel.bottomAnchor.constraint(equalTo: selectedView.bottomAnchor, constant: -10).isActive = true
        selectedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}




