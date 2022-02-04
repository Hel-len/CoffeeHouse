//
//  CoffeeFactory.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

protocol Factory {
    func makeCoffee(type: CoffeeTypes) -> CoffeeType
}

class StandardCoffeeFactory: Factory {
    static let standardCoffeeFactory = StandardCoffeeFactory()

    private init() {}

    func makeCoffee(type: CoffeeTypes) -> CoffeeType {
        switch type {

        case .cappuchino: return Cappuchino()
        case .espresso: return Espresso()
        case .latte: return Latte()
        case .custom: return CustomCoffee()
        }
    }
}
