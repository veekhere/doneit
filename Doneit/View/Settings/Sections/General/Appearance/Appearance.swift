//
//  Appearance.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

enum Appearance: String, CaseIterable, Identifiable {
    case system = "system"
    case light = "light"
    case dark = "dark"
    
    var id: String { rawValue }
}
