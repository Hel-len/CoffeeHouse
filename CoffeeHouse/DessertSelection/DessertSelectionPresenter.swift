//
//  DessertSelectionPresenter.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DessertSelectionPresentationLogic {
  func presentData(response: DessertSelection.Model.Response.ResponseType)
}

class DessertSelectionPresenter: DessertSelectionPresentationLogic {
  weak var viewController: DessertSelectionDisplayLogic?
  
  func presentData(response: DessertSelection.Model.Response.ResponseType) {
  
  }
  
}
