//
//  MainInterfacePresenter.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainInterfacePresentationLogic {
    func presentData(response: MainInterface.Model.Response.ResponseType)
}

class MainInterfacePresenter: MainInterfacePresentationLogic {
    weak var viewController: MainInterfaceDisplayLogic?
    
    func presentData(response: MainInterface.Model.Response.ResponseType) {
        
    }
    
}
