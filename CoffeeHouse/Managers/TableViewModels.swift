//
//  TableViewModels.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

struct TableViewModel {
    struct Section: TableViewSectionViewModel {
        var name: String

        struct Cell: TableViewCellViewModel {
            var content: String
            var secondaryContent: String
            var image: String
        }
        var cells: [Cell]
    }
    var sections: [Section]

}

protocol TableViewSectionViewModel {
    var name: String { get }
}

protocol TableViewCellViewModel {
    var content: String { get }
    var secondaryContent: String { get }
    var image: String { get }
}
