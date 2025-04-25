//
//  AccentColor.swift
//  Doneit
//
//  Created by Vee K on 4/25/25.
//

import SwiftUICore

enum AccentColor: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case defaultColor

    case red
    case orange
    case yellow
    case green
    case mint
    case teal
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    case gray
    
    var title: String {
        if self == .defaultColor {
            return "Default"
        }

        return self.rawValue.capitalized
    }
    
    var color: Color {
        switch self {
            case .defaultColor:
                return .accentColor
            case .red:
                return .red
            case .orange:
                return .orange
            case .yellow:
                return .yellow
            case .green:
                return .green
            case .mint:
                return .mint
            case .teal:
                return .teal
            case .cyan:
                return .cyan
            case .blue:
                return .blue
            case .indigo:
                return .indigo
            case .purple:
                return .purple
            case .pink:
                return .pink
            case .brown:
                return .brown
            case .gray:
                return .gray
        }
    }
}
