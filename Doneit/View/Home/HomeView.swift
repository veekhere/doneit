//
//  HomeView.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Actions", destination: ActionsView())
                NavigationLink("Settings", destination: SettingsView())
            }
        }
    }
}

#Preview {
    HomeView()
}
