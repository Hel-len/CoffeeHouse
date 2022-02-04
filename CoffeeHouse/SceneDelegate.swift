//
//  SceneDelegate.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 03.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController(rootViewController: MainInterfaceViewController())
        navigationController.navigationBar.prefersLargeTitles = false

        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

