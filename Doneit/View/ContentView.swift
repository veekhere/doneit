//
//  ContentView.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ActionsView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ActionModel.self, inMemory: true)
}
