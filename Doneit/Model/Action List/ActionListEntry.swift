//
//  ActionListModel.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import Foundation
import SwiftData
import SwiftUICore

@Model
class ActionListEntry: Identifiable {
    @Attribute(.unique)
    var id = UUID().uuidString
    
    var title: String
    var icon: String
    var color: AccentColor
    var createdAt: Date = Date.now
    var editedAt: Date = Date.distantPast
    
    init(
        title: String,
        icon: String = "list.bullet",
        color: AccentColor = .defaultColor
    ) {
        self.title = title
        self.icon = icon
        self.color = color
    }
}
