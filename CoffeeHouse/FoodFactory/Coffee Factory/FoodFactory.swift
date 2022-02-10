//
//  FoodFactory.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//

import Foundation

protocol Factory {
    func makeFood(type: FoodTypes) -> FoodFactory
}

enum FoodTypes: String {
    case coffee = "Coffee"
    case dessert = "Desserts"
    case pizza = "Pizza"

    var image: String {
        switch self {
        case .coffee: return self.rawValue.lowercased()
        case .dessert: return self.rawValue.lowercased()
        case .pizza: return self.rawValue.lowercased()
        }
    }
}

protocol FoodType {
    var name: String { get }
    var description: String { get }
    var image: String { get }

    func start()
    func getResult()
}

class FoodFactory: Factory {
    func makeFood(type: FoodTypes) -> FoodFactory {
        switch type {

        case .coffee: return CoffeeFactory()
        case .dessert: return DessertFactory()
        case .pizza: return PizzaFactory() 
        }
    }
}
