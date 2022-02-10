//
//  MainInterfaceViewController.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainInterfaceDisplayLogic: AnyObject {
    func displayData(viewModel: MainInterface.Model.ViewModel.ViewModelData)
}

class MainInterfaceViewController: UIViewController, MainInterfaceDisplayLogic {

    var interactor: MainInterfaceBusinessLogic?

    private var coffeeSelectionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Make some coffee", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()

    private var dessertSelectionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Make some dessert", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()

    private var pizzaSelectionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Make some pizza", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
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
        let interactor            = MainInterfaceInteractor()
        let presenter             = MainInterfacePresenter()
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
    }

    // MARK: Routing



    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3748336136, green: 0.269115746, blue: 0.1929725111, alpha: 1)
        setupViews()
    }

    func displayData(viewModel: MainInterface.Model.ViewModel.ViewModelData) {

    }

    private func setupViews() {
        view.addSubview(coffeeSelectionButton)
        view.addSubview(dessertSelectionButton)
        view.addSubview(pizzaSelectionButton)
        coffeeSelectionButton.addTarget(self, action: #selector(coffeeSelection), for: .touchUpInside)
        dessertSelectionButton.addTarget(self, action: #selector(dessertSelection), for: .touchUpInside)
        pizzaSelectionButton.addTarget(self, action: #selector(pizzaSelection), for: .touchUpInside)
        setConstraints()
    }

    @objc private func coffeeSelection() {
        let coffeeSelectionViewController = CoffeeSelectionViewController(
            image: "coffee",
            greeting: "What kind of coffee would you like?",
            nibName: nil,
            bundle: nil
        )
        navigationController?.pushViewController(coffeeSelectionViewController, animated: true)
    }

    @objc private func dessertSelection() {
        let dessertSelectionViewController = DessertSelectionViewController(
            image: "dessert",
            greeting: "What kind of dessert would you like?",
            nibName: nil,
            bundle: nil
            )
        navigationController?.pushViewController(dessertSelectionViewController, animated: true)
    }

    @objc private func pizzaSelection() {
        print("pizza")
    }

}

extension MainInterfaceViewController {
    private func setConstraints() {
        coffeeSelectionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        coffeeSelectionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        coffeeSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        coffeeSelectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true

        dessertSelectionButton.topAnchor.constraint(equalTo: coffeeSelectionButton.bottomAnchor, constant: 20).isActive = true
        dessertSelectionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dessertSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        dessertSelectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true

        pizzaSelectionButton.topAnchor.constraint(equalTo: dessertSelectionButton.bottomAnchor, constant: 20).isActive = true
        pizzaSelectionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pizzaSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pizzaSelectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true




    }
}
