//
//  CoffeeSelectionInteractor.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CoffeeSelectionBusinessLogic {
    func makeRequest(request: CoffeeSelection.Model.Request.RequestType)
}

class CoffeeSelectionInteractor: CoffeeSelectionBusinessLogic {

    var presenter: CoffeeSelectionPresentationLogic?
    var service: CoffeeSelectionService?
    private var coffeeList: [CoffeeType] = []

    func makeRequest(request: CoffeeSelection.Model.Request.RequestType) {
        if service == nil {
            service = CoffeeSelectionService()
        }
        coffeeList = service!.createMenu()

        switch request {

        case .getFeed:
            presenter?.presentData(response: CoffeeSelection.Model.Response.ResponseType.presentFeed(feed: coffeeList))
        case .getCoffee(let index):
            presenter?.presentData(response: CoffeeSelection.Model.Response.ResponseType.presentCoffee(type: coffeeList[index.row]))
        }
    }
}
