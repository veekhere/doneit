//
//  Action.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import Foundation
import SwiftData
import SwiftUICore

@Model
class ActionModel: Identifiable {
    @Attribute(.unique)
    var id = UUID().uuidString

    var title: String = ""
    var actionDescription: String = ""
    var isDone: Bool = false
    var isFlagged: Bool = false
    var priority: Int = Priority.none.index
    var createdAt: Date = Date.now
    var editedAt: Date = Date.distantPast
    
    static let `default` = ActionModel(title: "New Action", isFlagged: true, priority: .low)
    
    init() {}
    
    init(from: ActionModel) {
        self.title = from.title
        self.actionDescription = from.actionDescription
        self.isFlagged = from.isFlagged
        self.priority = from.priority
    }
    
    init(
        title: String,
        description: String? = nil
    ) {
        self.title = title
        self.actionDescription = description ?? ""
    }
    
    private init(
        title: String,
        isFlagged: Bool,
        priority: Priority
    ) {
        self.title = title
        self.isFlagged = isFlagged
        self.priority = priority.index
    }
    
    func toggleStatus() {
        isDone.toggle()
    }
    
    func toggleFlag() {
        isFlagged.toggle()
    }
}
