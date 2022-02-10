//
//  CoffeeSelectionWorker.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CoffeeSelectionService {
    var coffeeList: [FoodType] = []

    func createMenu() -> [FoodType] {
        coffeeList.append(CoffeeFactory().makeCoffee(type: .cappuchino))
        coffeeList.append(CoffeeFactory().makeCoffee(type: .latte))
        coffeeList.append(CoffeeFactory().makeCoffee(type: .espresso))
        return coffeeList
    }
}
