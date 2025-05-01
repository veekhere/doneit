//
//  DoneitApp.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import SwiftUI
import SwiftData

@main
struct DoneitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate

    @Environment(\.scenePhase)
    private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [ActionListEntry.self, ActionModel.self])
        .onChange(of: scenePhase) {
            if scenePhase == .background {
                setupShortcuts()
            }
        }
    }
    
    private func setupShortcuts() {
        let addNewAction = UIApplicationShortcutItem(
            type: Shortcut.newAction.rawValue,
            localizedTitle: "New Action",
            localizedSubtitle: nil,
            icon: UIApplicationShortcutIcon(systemImageName: "plus"),
            userInfo: [:]
        )

        let addNewFlaggedAction = UIApplicationShortcutItem(
            type: Shortcut.newFlaggedAction.rawValue,
            localizedTitle: "New Flagged Action",
            localizedSubtitle: nil,
            icon: UIApplicationShortcutIcon(systemImageName: "flag"),
            userInfo: [:]
        )

        UIApplication.shared.shortcutItems = [addNewAction, addNewFlaggedAction]
    }
}
