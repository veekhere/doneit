//
//  QuickActionsManager.swift
//  Doneit
//
//  Created by Vee K on 4/18/25.
//

import Foundation
import UIKit

class ShortcutsManager: ObservableObject {
    @Published
    var shortcut: Shortcut? = nil

    static let instance = ShortcutsManager()

    func handleShortcutItem(_ item: UIApplicationShortcutItem) {
        shortcut = Shortcut.init(rawValue: item.type)
    }
}
