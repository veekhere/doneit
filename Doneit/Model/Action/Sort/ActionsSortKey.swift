//
//  SortKey.swift
//  Doneit
//
//  Created by Vee K on 4/18/25.
//

import Foundation

enum ActionsSortKey: String, Codable, Hashable, CaseIterable {
    case defaultSort = "default"
    case title = "title"
    case priority = "priority"
    case createdAt = "createdAt"
    case editedAt = "editedAt"
}
