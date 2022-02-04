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

class CoffeeSelectionViewController: UIViewController, CoffeeSelectionDisplayLogic, TableManager {

    var cellId = "coffeeCell"
    var interactor: CoffeeSelectionBusinessLogic?
    var coffeeType: CoffeeType? = nil

    private var feedViewModel = TableViewModel.init(sections: [])
    private var coffeeTableView = UITableView()

    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "coffee")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "What kind of coffee do you prefer?"
        label.textColor = .white
        label.font = UIFont(name: "Nasalization", size: 30)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var coffeeView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()

    private var coffeeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(white: 1, alpha: 0.5)
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
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
        view.backgroundColor = #colorLiteral(red: 0.3047590256, green: 0.1710596979, blue: 0, alpha: 1)
        setupViews()
        interactor?.makeRequest(request: CoffeeSelection.Model.Request.RequestType.getFeed)
    }
    
    func displayData(viewModel: CoffeeSelection.Model.ViewModel.ViewModelData) {
        switch viewModel {

        case .displayFeed(let viewModel):
            self.feedViewModel = viewModel
            setupTableView()
            coffeeTableView.reloadData()
        case .makeCoffee(let viewModel):
            self.coffeeView.image = UIImage(named: viewModel.image)
            self.coffeeLabel.text = "\(viewModel.name)"
            coffeeView.isHidden = false
            coffeeLabel.isHidden = false
        }
    }

    func setupTableView() {
        coffeeTableView = TableViewManager(view: view, viewModel: feedViewModel, cellId: cellId, invoking: self)
    }

    func rowTapped(row: IndexPath) {
        interactor?.makeRequest(request: CoffeeSelection.Model.Request.RequestType.getCoffee(index: row))
    }


    private func setupViews() {
        view.addSubview(backgroundImage)
        view.addSubview(greetingLabel)
        view.addSubview(coffeeTableView)
        view.addSubview(coffeeView)
        coffeeView.addSubview(coffeeLabel)
        setConstraints()
    }

    func createCoffee(_ type: CoffeeTypes) {
        let coffee = StandardCoffeeFactory.standardCoffeeFactory.makeCoffee(type: type)
    }
}

extension CoffeeSelectionViewController {
    private func setConstraints() {
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        greetingLabel.heightAnchor.constraint(equalToConstant: 130).isActive = true

        coffeeView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        coffeeView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        coffeeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        coffeeView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        coffeeLabel.centerXAnchor.constraint(equalTo: coffeeView.centerXAnchor, constant: 0).isActive = true
        coffeeLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        coffeeLabel.bottomAnchor.constraint(equalTo: coffeeView.bottomAnchor, constant: -10).isActive = true
        coffeeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
