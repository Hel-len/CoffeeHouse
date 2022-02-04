//
//  PizzaTypes.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 05.02.2022.
//

import Foundation

protocol PizzaType: FoodType {
    var name: String { get }
    var description: String { get }
    var image: String { get }

    func start()
    func getResult()
}

final class Margaritha: PizzaType {

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

final class Pepperoni: PizzaType {

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

final class Cheesy: PizzaType {
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

