//
//  PizzaTypes.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 05.02.2022.
//

import Foundation

final class Margaritha: FoodType {

    var description = PizzaTypes.margaritha.description
    var name = PizzaTypes.margaritha.rawValue
    var image = PizzaTypes.margaritha.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your margaritha is ready! Enjoy!")
    }
}

final class Pepperoni: FoodType {

    var description = PizzaTypes.pepperoni.description
    var name = PizzaTypes.pepperoni.rawValue
    var image = PizzaTypes.pepperoni.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your pepperoni is ready! Enjoy!")
    }
}

final class Cheesy: FoodType {
    var description = PizzaTypes.cheesy.description
    var name = PizzaTypes.cheesy.rawValue
    var image = PizzaTypes.cheesy.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your Quatro formagio is ready! Enjoy!")
    }
}

enum PizzaTypes: String {
    case margaritha = "Margaritha"
    case pepperoni = "Pepperoni"
    case cheesy = "Quatro formagio"

    var image: String {
        switch self {

        case .margaritha: return "marg"
        case .pepperoni: return "pepp"
        case .cheesy: return "cheesy"
        }
    }

    var description: String {
        switch self {

        case .margaritha: return "Equal parts espresso, steamed milk and froth"
        case .pepperoni: return "Small shot of dark, rich coffee"
        case .cheesy: return "Espresso with steamed milk"
        }
    }
}

