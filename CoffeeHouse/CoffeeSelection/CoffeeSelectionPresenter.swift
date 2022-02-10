//
//  CoffeeSelectionPresenter.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CoffeeSelectionPresentationLogic {
    func presentData(response: Selection.Model.Response.ResponseType)
}

class CoffeeSelectionPresenter: CoffeeSelectionPresentationLogic {
    weak var viewController: CoffeeSelectionDisplayLogic?
    
    func presentData(response: Selection.Model.Response.ResponseType) {
        switch response {

        case .presentFeed(let feed):
            let sections: [TableViewModel.Section] = [TableViewModel.Section.init(name: "Coffee of the day:", cells: [])]
            var tableViewModel = TableViewModel.init(sections: sections)

            let cells: [TableViewModel.Section.Cell] = feed.map { (coffee) in
                cellViewModel(from: coffee)
            }
            tableViewModel.sections[0].cells = cells
            viewController?.displayData(viewModel: Selection.Model.ViewModel.ViewModelData.displayFeed(viewModel: tableViewModel))

        case .presentCurrentFeed(let type):

            let currentFeed: FeedViewModel = coffeeView(from: type)

            viewController?.displayData(viewModel: Selection.Model.ViewModel.ViewModelData.currentFeed(viewModel: currentFeed))
        }
    }

    private func cellViewModel(from coffee: FoodType) -> TableViewModel.Section.Cell {
        return TableViewModel.Section.Cell(
            content: coffee.name,
            secondaryContent: coffee.description,
            image: coffee.image)
    }

    private func coffeeView(from feed: FoodType) -> FeedViewModel {
        return FeedViewModel.init(
            name: feed.name,
            description: feed.description,
            image: feed.image)
    }
}
