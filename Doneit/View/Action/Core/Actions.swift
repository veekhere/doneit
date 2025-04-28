//
//  ActionList.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import SwiftUI
import SwiftData

struct Actions: View {
    var listType: ActionListType

    @State
    var selection: Set<String>

    @State
    private var actionCreateSheetPresent = false

    @Environment(\.modelContext)
    private var context
    
    @Query
    private var actions: [ActionModel]

    @Environment(\.editMode)
    private var editMode

    @StateObject
    private var shortcutsManager = ShortcutsManager.instance

    init(_ sort: [SortDescriptor<ActionModel>], selection: Set<String>, listType: ActionListType) {
        self._actions = Query(filter: listType.filter, sort: sort)
        self.selection = selection
        self.listType = listType
    }
    
    var body: some View {
        VStack {
            List(selection: $selection) {
                ForEach(actions) { action in
                    ActionRow(action: action, selection: $selection)
                }
            }
            .animation(.default, value: editMode?.wrappedValue)
            .animation(.default, value: actions)
            .listStyle(.inset)
            .overlay {
                if actions.isEmpty {
                    emptyView()
                }
            }
            .sheet(isPresented: $actionCreateSheetPresent) {
                ActionCreateSheet(listType: listType)
                    .presentationDetents([.medium])
            }
        }
        .overlay(alignment: .bottomTrailing) {
            if !editMode!.wrappedValue.isEditing && listType != .completed {
                AddActionButton(actionCreateSheetPresent: $actionCreateSheetPresent)
            }
        }
        .toolbar {
            if editMode!.wrappedValue.isEditing {
                bottomActions()
            }
        }
        .onAppear {
            performShortcut()
        }
        .onChange(of: shortcutsManager.shortcut) {
            performShortcut()
        }
    }
    
    private func emptyView() -> some View {
        ContentUnavailableView {
            Label("No Actions", systemImage: "list.bullet.rectangle.portrait")
        } description: {
            if listType != .completed {
                Text("Start adding actions to see them here")
            }
        }
        .offset(y: -60)
    }
    
    private func bottomActions() -> some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            HStack {
                Button(selection.count != actions.count ? "Select All" : "Unselect All") {
                    if selection.count != actions.count {
                        for action in actions {
                            selection.insert(action.id)
                        }
                    } else {
                        selection.removeAll()
                    }
                }
                .contentTransition(.identity)

                Spacer()

                Button("Delete") {
                    do {
                        try context.delete(model: ActionModel.self, where: #Predicate<ActionModel> { selection.contains($0.id) })
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }

                    selection.removeAll()
                    
                    withAnimation {
                        editMode!.wrappedValue = .inactive
                    }
                }
                .disabled(selection.isEmpty)
            }
        }
    }
    
    private func performShortcut() {
        switch shortcutsManager.shortcut {
            case .newAction:
                actionCreateSheetPresent = true
                shortcutsManager.shortcut = nil
            default:
                return
        }
    }
}

#Preview {
    Actions([SortDescriptor(\ActionModel.isDone)], selection: Set<String>(), listType: .all)
}
