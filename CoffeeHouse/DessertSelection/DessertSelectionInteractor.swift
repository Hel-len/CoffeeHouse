//
//  DessertSelectionInteractor.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DessertSelectionBusinessLogic {
  func makeRequest(request: DessertSelection.Model.Request.RequestType)
}

class DessertSelectionInteractor: DessertSelectionBusinessLogic {

  var presenter: DessertSelectionPresentationLogic?
  var service: DessertSelectionService?
  
  func makeRequest(request: DessertSelection.Model.Request.RequestType) {
    if service == nil {
      service = DessertSelectionService()
    }
  }
  
}
