//
//  Priority.swift
//  Doneit
//
//  Created by Vee K on 4/26/25.
//

import SwiftUICore

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
    
    var index: Int {
        switch self {
            case .low:
                return 1
            case .medium:
                return 2
            case .high:
                return 3

            case .none:
                return 0
        }
    }
}
