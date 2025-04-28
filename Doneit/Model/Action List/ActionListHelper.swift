//
//  ActionListEntry.swift
//  Doneit
//
//  Created by Vee K on 4/26/25.
//

import Foundation

class ActionListHelper {
    static let listEntries: [ActionListType : ActionListEntry] = [
        .all: .init(
            title: "All",
            icon: "tray.fill",
            color: .gray
        ),
        .pending: .init(
            title: "Pending",
            icon: "checklist.unchecked",
            color: .blue
        ),
        .completed: .init(
            title: "Completed",
            icon: "checkmark",
            color: .green
        ),
        .flagged: .init(
            title: "Flagged",
            icon: "flag.fill",
            color: .orange
        ),
    ]
    
    static func getEntry(_ key: ActionListType) -> ActionListEntry {
        listEntries[key]!
    }
}
