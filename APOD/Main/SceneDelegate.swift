//
//  SceneDelegate.swift
//  APOD
//
//  Created by David Molina on 3/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupInitialViewController(windowScene: windowScene)
    }

    private func setupInitialViewController(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let viewController = HomeViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }

}

