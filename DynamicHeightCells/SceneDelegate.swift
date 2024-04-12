//
//  SceneDelegate.swift
//  DynamicHeightCells
//
//  Created by Aiur Arkhipov on 12.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

