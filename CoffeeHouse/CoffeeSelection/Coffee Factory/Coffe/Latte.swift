//
//  Latte.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

final class Latte: CoffeeType {

    var description = CoffeeTypes.latte.description
    var name = CoffeeTypes.latte.rawValue
    var image = CoffeeTypes.latte.image

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
        print("Your latte is ready! Enjoy!")
    }
}
