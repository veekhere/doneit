//
//  Appearance.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUICore

enum Appearance: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case system = "system"
    case light = "light"
    case dark = "dark"
    
    var scheme: ColorScheme? {
        switch self {
            case .light:
                return .light
            case .dark:
                return .dark
            default:
                return nil
        }
    }
}
