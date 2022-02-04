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
        coffeeSelectionButton.addTarget(self, action: #selector(coffeeSelection), for: .touchUpInside)
        setConstraints()
    }

    @objc private func coffeeSelection() {
        let coffeeSelectionViewController = CoffeeSelectionViewController(image: "coffee", greeting: "", nibName: nil, bundle: nil)
        navigationController?.pushViewController(coffeeSelectionViewController, animated: true)
    }

}

extension MainInterfaceViewController {
    private func setConstraints() {
        coffeeSelectionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        coffeeSelectionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        coffeeSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        coffeeSelectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
}
