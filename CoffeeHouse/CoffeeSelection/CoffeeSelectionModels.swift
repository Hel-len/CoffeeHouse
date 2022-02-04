//
//  CoffeeSelectionModels.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit



enum CoffeeSelection {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getFeed
                case getCoffee(index: IndexPath)
            }
        }
        struct Response {
            enum ResponseType {
                case presentFeed(feed: [CoffeeType])
                case presentCoffee(type: CoffeeType)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayFeed(viewModel: TableViewModel)
                case makeCoffee(viewModel: CoffeeViewModel)
            }
        }
    }
}

struct CoffeeMenu {
    let name: CoffeeTypes.RawValue
    let description: String
    let image: String
}

struct CoffeeViewModel {
    let name: String
    let description: String
    let image: String
}
