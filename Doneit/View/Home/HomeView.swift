//
//  HomeView.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI

struct HomeView: View {
    @State
    private var actionsActive = false
    
    @State
    private var settingsActive = false
    
    @StateObject
    private var shortcutsManager = ShortcutsManager.instance
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Actions", destination: ActionsView())
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        settingsActive = true
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationTitle("Lists")
            .navigationDestination(isPresented: $actionsActive) {
                ActionsView()
            }
            .navigationDestination(isPresented: $settingsActive) {
                SettingsView()
            }
            .onAppear {
                performShortcut()
            }
            .onChange(of: shortcutsManager.shortcut) {
                performShortcut()
            }
        }
    }
    
    private func performShortcut() {
        switch shortcutsManager.shortcut {
            case .newAction:
                actionsActive = true
            default:
                return
        }
    }
}

#Preview {
    HomeView()
}
