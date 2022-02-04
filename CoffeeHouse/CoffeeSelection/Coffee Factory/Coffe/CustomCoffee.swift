//
//  CustomCoffee.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//

import Foundation

final class CustomCoffee: CoffeeType {
    var description = CoffeeTypes.custom.description
    var name = CoffeeTypes.custom.rawValue
    var image = CoffeeTypes.custom.image

    init() {}

    init(_ name: String, description: String, like image: String) {
        self.name = name
        self .description = description
        self.image = image
    }

    func start() {
        print("Start")
    }

    func getResult() {
        print("Your \(name) is ready! Enjoy!")
    }
}
