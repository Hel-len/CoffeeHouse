//
//  Cappuchino.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import Foundation

final class Cappuchino: CoffeeType {

    var description = CoffeeTypes.cappuchino.description
    var name = CoffeeTypes.cappuchino.rawValue
    var image = CoffeeTypes.cappuchino.image

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
        print("Your coffee is ready! Enjoy!")
    }
}
