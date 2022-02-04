//
//  CoffeeSelectionViewController.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CoffeeView {
    var name: String { get }
    var description: String { get }
    var image: String { get }
}

protocol CoffeeSelectionDisplayLogic: AnyObject {
    func displayData(viewModel: CoffeeSelection.Model.ViewModel.ViewModelData)
}

final class CoffeeSelectionViewController: UIViewController, CoffeeSelectionDisplayLogic, TableManager, SelectionViewController {

    var cellId = "coffeeCell"
    var interactor: CoffeeSelectionBusinessLogic?
    var coffeeType: CoffeeType? = nil

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
        let interactor            = CoffeeSelectionInteractor()
        let presenter             = CoffeeSelectionPresenter()
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.makeRequest(request: CoffeeSelection.Model.Request.RequestType.getFeed)
    }
    
    func displayData(viewModel: CoffeeSelection.Model.ViewModel.ViewModelData) {
        switch viewModel {

        case .displayFeed(let viewModel):
            self.tableViewModel = viewModel
            setupTableView()
            tableView.reloadData()
        case .makeCoffee(let viewModel):
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
        interactor?.makeRequest(request: CoffeeSelection.Model.Request.RequestType.getCoffee(index: row))
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
