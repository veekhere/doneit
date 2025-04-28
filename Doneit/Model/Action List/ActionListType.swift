//
//  ActionListType.swift
//  Doneit
//
//  Created by Vee K on 4/26/25.
//

import Foundation

enum ActionListType: String, Codable, Hashable, CaseIterable {
    case all = "all"
    case pending = "pending"
    case completed = "completed"
    case flagged = "flagged"
    
    var filter: Predicate<ActionModel>? {
        switch self {
            case .completed:
                return #Predicate<ActionModel>{ $0.isDone == true }
            case .flagged:
                return #Predicate<ActionModel>{ $0.isFlagged == true }
            case .pending:
                return #Predicate<ActionModel>{ $0.isDone == false }

            case .all:
                return nil
        }
    }
}
