//
//  Espresso.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

final class Espresso: CoffeeType {
    var description = CoffeeTypes.espresso.description
    var name = CoffeeTypes.espresso.rawValue
    var image = CoffeeTypes.espresso.image

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
        print("Your espresso is ready! Enjoy!")
    }
}
