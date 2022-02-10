//
//  DessertSelectionInteractor.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DessertSelectionBusinessLogic {
    func makeRequest(request: Selection.Model.Request.RequestType)
}

class DessertSelectionInteractor: DessertSelectionBusinessLogic {

    var presenter: DessertSelectionPresentationLogic?
    var service: DessertSelectionService?
    private var menuList: [FoodType] = []

    func makeRequest(request: Selection.Model.Request.RequestType) {
        if service == nil {
            service = DessertSelectionService()
        }
        menuList = service!.createMenu()

        switch request {

        case .getFeed:
            presenter?.presentData(response: Selection.Model.Response.ResponseType.presentFeed(feed: menuList))
        case .getCurrentFeed(index: let index):
            presenter?.presentData(response: Selection.Model.Response.ResponseType.presentCurrentFeed(type: menuList[index.row]))
        }
    }

}
