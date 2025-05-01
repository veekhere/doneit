//
//  HomeView.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State
    private var allActionsActive = false

    @State
    private var flaggedActionsActive = false

    @State
    private var settingsActive = false

    @StateObject
    private var shortcutsManager = ShortcutsManager.instance

    let colums = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        LazyVGrid(columns: colums, spacing: 10) {
                            ForEach(ActionListType.allCases, id: \.self) { listType in
                                ActionListView(list: ActionListHelper.getEntry(listType), type: listType)
                            }
                        }
                    }
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.sidebar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        settingsActive = true
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationDestination(isPresented: $allActionsActive) {
                ActionsView(listType: .all)
            }
            .navigationDestination(isPresented: $flaggedActionsActive) {
                ActionsView(listType: .flagged)
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
                allActionsActive = true
            case .newFlaggedAction:
                flaggedActionsActive = true
            default:
                return
        }
    }
}

#Preview {
    HomeView()
}
