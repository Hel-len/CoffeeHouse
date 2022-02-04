//
//  DessertSelectionViewController.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DessertSelectionDisplayLogic: AnyObject {
    func displayData(viewModel: DessertSelection.Model.ViewModel.ViewModelData)
}

final class DessertSelectionViewController: UIViewController, DessertSelectionDisplayLogic, SelectionViewController {

    var interactor: DessertSelectionBusinessLogic?
    var router: (NSObjectProtocol & DessertSelectionRoutingLogic)?

    let views = SelectionView()
    var backgroundImage: UIImageView
    var greetingLabel: UILabel
    var tableViewModel = TableViewModel.init(sections: [])
    var tableView = UITableView()
    var cellId = "DessertCell"
    var selectedView: UIImageView
    var selectedLabel: UILabel

    // MARK: Object lifecycle
    init(image: String, greeting: String, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        self.backgroundImage = views.background
        self.backgroundImage.image = UIImage(named: image)
        self.greetingLabel = views.greeting
        self.greetingLabel.text = greeting
        self.selectedView = views.coffeeView
        self.selectedLabel = views.coffeeLabel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        self.backgroundImage = views.background
        self.greetingLabel = views.greeting
        self.selectedView = views.coffeeView
        self.selectedLabel = views.coffeeLabel
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    func setup() {
        let viewController        = self
        let interactor            = DessertSelectionInteractor()
        let presenter             = DessertSelectionPresenter()
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func displayData(viewModel: DessertSelection.Model.ViewModel.ViewModelData) {

    }

    func setupViews() {

    }

    func setConstraints() {
    }

}
