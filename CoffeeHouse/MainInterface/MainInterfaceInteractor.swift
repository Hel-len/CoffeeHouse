//
//  MainInterfaceInteractor.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainInterfaceBusinessLogic {
  func makeRequest(request: MainInterface.Model.Request.RequestType)
}

class MainInterfaceInteractor: MainInterfaceBusinessLogic {

  var presenter: MainInterfacePresentationLogic?
  var service: MainInterfaceService?
  
  func makeRequest(request: MainInterface.Model.Request.RequestType) {
    if service == nil {
      service = MainInterfaceService()
    }
  }
  
}
