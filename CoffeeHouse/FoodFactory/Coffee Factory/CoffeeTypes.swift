//
//  CoffeeTypes.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

final class Latte: FoodType {

    var description = CoffeeTypes.latte.description
    var name = CoffeeTypes.latte.rawValue
    var image = CoffeeTypes.latte.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your latte is ready! Enjoy!")
    }
}

final class Cappuchino: FoodType {

    var description = CoffeeTypes.cappuchino.description
    var name = CoffeeTypes.cappuchino.rawValue
    var image = CoffeeTypes.cappuchino.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your coffee is ready! Enjoy!")
    }
}

final class Espresso: FoodType {
    var description = CoffeeTypes.espresso.description
    var name = CoffeeTypes.espresso.rawValue
    var image = CoffeeTypes.espresso.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your espresso is ready! Enjoy!")
    }
}

enum CoffeeTypes: String {
    case cappuchino = "Cappuchino"
    case espresso = "Espresso"
    case latte = "Latte"

    var image: String {
        switch self {

        case .cappuchino: return "capp"
        case .espresso: return "esp"
        case .latte: return "lat"
        }
    }

    var description: String {
        switch self {

        case .cappuchino: return "Equal parts espresso, steamed milk and froth"
        case .espresso: return "Small shot of dark, rich coffee"
        case .latte: return "Espresso with steamed milk"
        }
    }
}

