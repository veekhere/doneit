//
//  AppDelegate.swift
//  Doneit
//
//  Created by Vee K on 4/18/25.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let shortcutItem = options.shortcutItem {
            ShortcutsManager.instance.handleShortcutItem(shortcutItem)
        }

        let sceneConfiguration = UISceneConfiguration(name: "custom_cfg", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = SceneDelegate.self

        return sceneConfiguration
    }
}
