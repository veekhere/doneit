//
//  Priority.swift
//  Doneit
//
//  Created by Vee K on 4/26/25.
//

import SwiftUICore

enum Priority: CaseIterable, Codable {
    case none
    case low
    case medium
    case high
    
    init(_ index: Int) {
        switch index {
            case 1:
                self = .high
            case 2:
                self = .medium
            case 3:
                self = .low

            default:
                self = .none
        }
    }
    
    var index: Int {
        switch self {
            case .low:
                return 3
            case .medium:
                return 2
            case .high:
                return 1

            case .none:
                return 4
        }
    }
    
    var title: String {
        switch self {
            case .low:
                return "Low"
            case .medium:
                return "Medium"
            case .high:
                return "High"
                
            case .none:
                return ""
        }
    }
    
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
