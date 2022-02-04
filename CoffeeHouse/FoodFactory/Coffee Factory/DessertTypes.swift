//
//  CoffeeTypes.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

protocol DessertType: FoodType {
    var name: String { get }
    var description: String { get }
    var image: String { get }

    func start()
    func getResult()
}

final class Cake: DessertType {

    var description = DessertTypes.cake.description
    var name = DessertTypes.cake.rawValue
    var image = DessertTypes.cake.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your latte is ready! Enjoy!")
    }
}

final class Bisquit: DessertType {

    var description = DessertTypes.bisquit.description
    var name = DessertTypes.bisquit.rawValue
    var image = DessertTypes.bisquit.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your coffee is ready! Enjoy!")
    }
}

final class Brownie: DessertType {
    var description = DessertTypes.brownie.description
    var name = DessertTypes.brownie.rawValue
    var image = DessertTypes.brownie.image

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your espresso is ready! Enjoy!")
    }
}

enum DessertTypes: String {
    case cake = "Piece of cake"
    case bisquit = "Bisquit"
    case brownie = "Brownie"

    var image: String {
        switch self {

        case .cake: return "cake"
        case .bisquit: return "bisq"
        case .brownie: return "brow"
        }
    }

    var description: String {
        switch self {

        case .cake: return "Equal parts espresso, steamed milk and froth"
        case .bisquit: return "Small shot of dark, rich coffee"
        case .brownie: return "Espresso with steamed milk"
        }
    }
}

