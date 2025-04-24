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
            GeneralSection()
            VersionSection()
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
