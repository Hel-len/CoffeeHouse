//
//  CoffeeTypes.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

enum CoffeeTypes: String {
    case cappuchino = "Cappuchino"
    case espresso = "Espresso"
    case latte = "Latte"
    case custom = "Custom coffee"

    var image: String {
        switch self {

        case .cappuchino: return "capp"
        case .espresso: return "esp"
        case .latte: return "lat"
        case .custom: return "custom"
        }
    }

    var description: String {
        switch self {

        case .cappuchino: return "Equal parts espresso, steamed milk and froth"
        case .espresso: return "Small shot of dark, rich coffee"
        case .latte: return "Espresso with steamed milk"
        case .custom: return "Make coffee to your own taste!"
        }
    }
}

protocol CoffeeType {
    var name: String { get }
    var description: String { get }
    var image: String { get }

    init()

    init(_ name: String, description: String, like image: String) 

    func start()
    func getResult()
}

