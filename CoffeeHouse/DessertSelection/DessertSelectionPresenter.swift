//
//  DessertSelectionPresenter.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DessertSelectionPresentationLogic {
    func presentData(response: Selection.Model.Response.ResponseType)
}

class DessertSelectionPresenter: DessertSelectionPresentationLogic {
    weak var viewController: DessertSelectionDisplayLogic?

    func presentData(response: Selection.Model.Response.ResponseType) {
        switch response {

        case .presentFeed(feed: let feed):
            let sections: [TableViewModel.Section] = [TableViewModel.Section.init(name: "Dessert of the day:", cells: [])]
            var tableViewModel = TableViewModel.init(sections: sections)

            let cells: [TableViewModel.Section.Cell] = feed.map { (dessert) in
                cellViewModel(from: dessert)
            }
            tableViewModel.sections[0].cells = cells
            viewController?.displayData(viewModel: Selection.Model.ViewModel.ViewModelData.displayFeed(viewModel: tableViewModel))
        case .presentCurrentFeed(type: let type):
            let currentFeed: FeedViewModel = dessertView(from: type)

            viewController?.displayData(viewModel: Selection.Model.ViewModel.ViewModelData.currentFeed(viewModel: currentFeed))
        }

    }
    private func cellViewModel(from dessert: FoodType) -> TableViewModel.Section.Cell {
        return TableViewModel.Section.Cell(
            content: dessert.name,
            secondaryContent: dessert.description,
            image: dessert.image)
    }

    private func dessertView(from feed: FoodType) -> FeedViewModel {
        return FeedViewModel.init(
            name: feed.name,
            description: feed.description,
            image: feed.image)
    }

}
