//
//  DessertSelectionWorker.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DessertSelectionService {
    var dessertList: [FoodType] = []

    func createMenu() -> [FoodType] {
        dessertList.append(DessertFactory().makeDessert(type: .bisquit))

        dessertList.append(DessertFactory().makeDessert(type: .brownie))
        dessertList.append(DessertFactory().makeDessert(type: .cake))
        return dessertList
    }
}
