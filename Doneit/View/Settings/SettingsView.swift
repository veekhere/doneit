//
//  SettingsView.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section("Appearance settings") {
                AppearancePicker()
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
