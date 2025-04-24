//
//  ActionView.swift
//  Doneit
//
//  Created by Vee K on 4/16/25.
//

import SwiftUI
import SwiftData

struct ActionsView: View {
    @Query
    private var actions: [ActionModel]
    
    @State
    private var editMode: EditMode = .inactive
    
    @State
    private var selection = Set<String>()
    
    @State
    private var sortKey: ActionsSortKey = .defaultSort
    
    @State
    private var order: SortOrder = .forward
    
    private var selectedSortEntry: ActionsSortEntry {
        ActionsSortHelper.getEntry(sortKey)
    }
    
    private var sort: [SortDescriptor<ActionModel>] {
        return sortKey == .defaultSort
            ? selectedSortEntry.sort
            : selectedSortEntry.variants.first { $0.id == order }!.descriptors
    }

    var body: some View {
        VStack {
            Actions(sort, selection: selection)
                .environment(\.editMode, $editMode.animation())
                .navigationTitle("Actions")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    if !actions.isEmpty {
                        editButton()
                    }
                }
        }
    }
    
    private func editButton() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            if editMode.isEditing {
                Button("Done") {
                    withAnimation {
                        editMode = .inactive
                    }
                }
            } else {
                Menu("Edit") {
                    Button {
                        withAnimation {
                            editMode = .active
                        }
                    } label: {
                        Label("Select Actions", systemImage: "checkmark.circle")
                    }

                    Menu {
                        sortOptions()
                        
                        if !selectedSortEntry.variants.isEmpty {
                            orderOptions()
                        }
                    } label: {
                        Button(action: {}, label: {
                            Text("Sort By")
                            Text(ActionsSortHelper.getEntry(sortKey).title)
                            Image(systemName: "arrow.up.arrow.down")
                        })
                    }
                }
            }
        }
    }
    
    private func sortOptions() -> some View {
        Picker("Sort options", selection: $sortKey) {
            ForEach(ActionsSortKey.allCases, id: \.self) { key in
                Text(ActionsSortHelper.getEntry(key).title)
                    .tag(key)
            }
        }
        .onChange(of: sortKey) {
            order = .forward
        }
    }
    
    private func orderOptions() -> some View {
        Picker("Order options", selection: $order) {
            ForEach(selectedSortEntry.variants) { variant in
                Text(variant.title).tag(variant.id)
            }
        }
    }
}

#Preview {
    ActionsView()
}
