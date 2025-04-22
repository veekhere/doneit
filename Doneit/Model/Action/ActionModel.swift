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
    var priority: Priority = Priority.none
    var createdAt: Date = Date.now
    var editedAt: Date = Date.distantPast
    
    static let `default` = ActionModel(title: "New Action", isFlagged: true, priority: .low)
    
    init() {}
    
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
        self.priority = priority
    }
    
    func toggleStatus() {
        isDone.toggle()
    }
    
    func toggleFlag() {
        isFlagged.toggle()
    }
}

enum Priority: String, CaseIterable, Codable, Identifiable {
    var id: String { rawValue }

    case none = "none"
    case low = "low"
    case medium = "medium"
    case high = "high"
    
    var color: Color {
        switch self {
            case .low:
                return .green
            case .medium:
                return .orange
            case .high:
                return .red

            case .none:
                return .clear
        }
    }
    
    var icon: String? {
        switch self {
            case .low:
                return "circle"
            case .medium:
                return "circle.lefthalf.filled"
            case .high:
                return "circle.fill"

            case .none:
                return nil
        }
    }
}

