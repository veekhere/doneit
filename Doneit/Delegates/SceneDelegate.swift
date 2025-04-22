//
//  SceneDelegate.swift
//  Doneit
//
//  Created by Vee K on 4/18/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        ShortcutsManager.instance.handleShortcutItem(shortcutItem)
    }
}
