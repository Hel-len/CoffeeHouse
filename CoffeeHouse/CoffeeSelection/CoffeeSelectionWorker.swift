//
//  CoffeeSelectionWorker.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CoffeeSelectionService {
    var coffeeList: [CoffeeType] = []

    func createMenu() -> [CoffeeType] {
        coffeeList.append(StandardCoffeeFactory.standardCoffeeFactory.makeCoffee(type: .custom))
        coffeeList.append(StandardCoffeeFactory.standardCoffeeFactory.makeCoffee(type: .cappuchino))
        coffeeList.append(StandardCoffeeFactory.standardCoffeeFactory.makeCoffee(type: .latte))
        coffeeList.append(StandardCoffeeFactory.standardCoffeeFactory.makeCoffee(type: .espresso))
        return coffeeList
    }
}
