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
    
    @AppStorage("accentColor")
    private var color: AccentColor = .defaultColor

    var body: some View {
        HomeView()
            .preferredColorScheme(appearance.scheme)
            .accentColor(color.color)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ActionModel.self, inMemory: true)
}
