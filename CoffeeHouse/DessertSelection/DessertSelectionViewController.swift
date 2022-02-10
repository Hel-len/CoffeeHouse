//
//  DessertSelectionViewController.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DessertSelectionDisplayLogic: AnyObject {
    func displayData(viewModel: Selection.Model.ViewModel.ViewModelData)
}

final class DessertSelectionViewController: UIViewController, DessertSelectionDisplayLogic, TableManager, SelectionViewController {

    var cellId = "DessertCell"
    var interactor: DessertSelectionBusinessLogic?
    var dessertType: FoodType? = nil

    let views = SelectionView()

    var tableViewModel = TableViewModel.init(sections: [])
    var tableView = UITableView()
    var backgroundImage: UIImageView
    var greetingLabel: UILabel
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
        setupViews()
        interactor?.makeRequest(request: Selection.Model.Request.RequestType.getFeed)
    }

    func displayData(viewModel: Selection.Model.ViewModel.ViewModelData) {
        switch viewModel {

        case .displayFeed(viewModel: let viewModel):
            self.tableViewModel = viewModel
            setupTableView()
            tableView.reloadData()
        case .currentFeed(viewModel: let viewModel):
            self.selectedView.image = UIImage(named: viewModel.image)
            self.selectedLabel.text = "\(viewModel.name)"
            selectedView.isHidden = false
            selectedLabel.isHidden = false
        }
    }

    func setupTableView() {
        tableView = TableViewManager(view: view, viewModel: tableViewModel, cellId: cellId, invoking: self)
    }

    func rowTapped(row: IndexPath) {
        interactor?.makeRequest(request: Selection.Model.Request.RequestType.getCurrentFeed(index: row))
    }

    func setupViews() {
        view.addSubview(backgroundImage)
        view.addSubview(greetingLabel)
        view.addSubview(tableView)
        view.addSubview(selectedView)
        selectedView.addSubview(selectedLabel)
        setConstraints(superView: view)
    }

    func setConstraints() {
    }
}
