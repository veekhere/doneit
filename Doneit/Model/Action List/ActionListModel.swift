//
//  ActionListModel.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import Foundation
import SwiftData

@Model
class ActionListModel: Identifiable {
    @Attribute(.unique)
    var id = UUID().uuidString
    
    @Relationship(deleteRule: .cascade)
    var actions = [ActionModel]()
    
    var title: String
    var icon: String
    var createdAt: Date = Date.now
    var editedAt: Date = Date.distantPast
    
    init(
        title: String,
        icon: String = "list.bullet",
        actions: [ActionModel] = [ActionModel]()
    ) {
        self.title = title
        self.icon = icon
        self.actions = actions
    }
}
