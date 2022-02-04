//
//  CoffeeFactory.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

final class CoffeeFactory: FoodFactory {

    func makeCoffee(type: CoffeeTypes) -> CoffeeType {
        switch type {

        case .cappuchino: return Cappuchino()
        case .espresso: return Espresso()
        case .latte: return Latte()
        }
    }
}

final class DessertFactory: FoodFactory {

    func makeDessert(type: DessertTypes) -> DessertType {
        switch type {

        case .cake: return Cake()
        case .bisquit: return Bisquit()
        case .brownie: return Brownie()
        }
    }
}

final class PizzaFactory: FoodFactory {

    func makeDessert(type: PizzaTypes) -> PizzaType {
        switch type {

        case .margaritha: return Margaritha()
        case .pepperoni: return Pepperoni()
        case .cheesy: return Cheesy()
        }
    }
}
