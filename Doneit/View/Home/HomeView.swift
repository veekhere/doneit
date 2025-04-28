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
    
    @State
    private var editMode: EditMode = .inactive
    
    @State
    private var createdListsExpanded = true
    
    let colums = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            List {
                if !editMode.isEditing {
                    Section {
                        VStack {
                            LazyVGrid(columns: colums, spacing: 10) {
                                ForEach(ActionListType.allCases, id: \.self) { listType in
                                    ActionList(list: ActionListHelper.getEntry(listType), type: listType)
                                }
                            }
                        }
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    .listRowInsets(EdgeInsets())
                }
                
                Section(isExpanded: $createdListsExpanded) {
                    // list items
                } header: {
                    Text("Created by You")
                        .textCase(.none)
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .foregroundColor(.primary)
                        .padding(.leading, -20)
                }
                .animation(nil, value: createdListsExpanded)
            }
            .listStyle(.sidebar)
            .environment(\.editMode, $editMode)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        settingsActive = true
                    } label: {
                        Image(systemName: "gear")
                    }
                    .disabled(editMode.isEditing)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    if editMode.isEditing {
                        Button("Done") {
                            withAnimation {
                                editMode = .inactive
                            }
                        }
                    } else {
                        Menu {
                            Button {
                                
                            } label: {
                                Label("Add List", systemImage: "plus")
                            }
                            
                            Button {
                                withAnimation {
                                    editMode = .active
                                }
                            } label: {
                                Label("Edit Lists", systemImage: "pencil")
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $actionsActive) {
//                ActionsView()
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
