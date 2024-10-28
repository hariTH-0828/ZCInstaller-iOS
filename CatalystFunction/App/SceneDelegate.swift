//
//  SceneDelegate.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 26/10/24.
//

import UIKit
import ZCatalyst

@available(iOS  13.0,*)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var appViewModel = AppViewModel.shared
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        if window?.windowScene != winScene {
            window = UIWindow(windowScene: winScene)
        } else {
            window?.rootViewController = nil
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let context = URLContexts.first {
            ZCatalystApp.shared.handleLoginRedirection(context.url, sourceApplication: context.options.sourceApplication, annotation: context.options.annotation as Any)
        }
    }
}

