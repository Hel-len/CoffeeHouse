//
//  ViewControllerViewModel.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 05.02.2022.
//

import Foundation

protocol ViewControllerViewModel {
    var name: String { get }
    var description: String { get }
    var image: String { get }
}

enum Selection {

    enum Model {
        struct Request {
            enum RequestType {
                case getFeed
                case getCurrentFeed(index: IndexPath)
            }
        }
        struct Response {
            enum ResponseType {
                case presentFeed(feed: [FoodType])
                case presentCurrentFeed(type: FoodType)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayFeed(viewModel: TableViewModel)
                case currentFeed(viewModel: FeedViewModel)
            }
        }
    }
}

struct Menu {
    let name: String
    let description: String
    let image: String
}

struct FeedViewModel {
    let name: String
    let description: String
    let image: String
}


