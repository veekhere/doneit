//
//  AppearancePicker.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI

struct AppearancePicker: View {
    @AppStorage("appearance")
    private var appearance: Appearance = .system

    var body: some View {
        Picker(selection: $appearance) {
            ForEach(Appearance.allCases) { option in
                Text(option.rawValue.capitalized)
                    .tag(option)
            }
        } label: {
            Text("Preferred Appearance")
        }
    }
}

#Preview {
    AppearancePicker()
}
