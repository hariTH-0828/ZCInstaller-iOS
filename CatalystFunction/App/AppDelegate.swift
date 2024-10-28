//
//  AppDelegate.swift
//  CatalystFunction
//
//  Created by Hariharan R S on 26/10/24.
//

import Foundation
import UIKit
import ZCatalyst

class AppDelegate: UIResponder, UIApplicationDelegate {
    let appViewModel = AppViewModel.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
          let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
          sceneConfig.delegateClass = SceneDelegate.self
          return sceneConfig
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let sourceApp = options[.sourceApplication] as? String
        let annotation = options[.annotation] as Any
        
        ZCatalystApp.shared.handleLoginRedirection(url, sourceApplication: sourceApp, annotation: annotation)
        return true
    }
    
    public func discardSelfContainedWindows() {
        let scenes = UIApplication.shared.connectedScenes
        scenes.forEach({
            dismissWindow(with: .standard,session: $0.session)
        })
    }
    
    func dismissWindow(with windowDismissalAnimation: UIWindowScene.DismissalAnimation,session : UISceneSession){
        let options = UIWindowSceneDestructionRequestOptions()
        options.windowDismissalAnimation = windowDismissalAnimation
        UIApplication.shared.requestSceneSessionDestruction(session, options: options) { (error) in
            print("Error: \(error)")
        }
    }
}
