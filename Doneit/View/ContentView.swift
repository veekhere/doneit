//
//  ContentView.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("appearance")
    private var appearance: Appearance = .system
    
    private var colorScheme: ColorScheme? {
        switch appearance {
            case .light:
                return .light
            case .dark:
                return .dark
            default:
                return nil
        }
    }

    var body: some View {
        HomeView()
            .preferredColorScheme(colorScheme)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ActionModel.self, inMemory: true)
}
