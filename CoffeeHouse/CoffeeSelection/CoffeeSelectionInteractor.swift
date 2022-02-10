//
//  CoffeeSelectionInteractor.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CoffeeSelectionBusinessLogic {
    func makeRequest(request: Selection.Model.Request.RequestType)
}

class CoffeeSelectionInteractor: CoffeeSelectionBusinessLogic {

    var presenter: CoffeeSelectionPresentationLogic?
    var service: CoffeeSelectionService?
    private var coffeeList: [FoodType] = []

    func makeRequest(request: Selection.Model.Request.RequestType) {
        if service == nil {
            service = CoffeeSelectionService()
        }
        coffeeList = service!.createMenu()

        switch request {

        case .getFeed:
            presenter?.presentData(response: Selection.Model.Response.ResponseType.presentFeed(feed: coffeeList))
        case .getCurrentFeed(let index):
            presenter?.presentData(response: Selection.Model.Response.ResponseType.presentCurrentFeed(type: coffeeList[index.row]))
        }
    }
}
