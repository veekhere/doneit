//
//  Action.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import SwiftUI

struct ActionRow: View {
    @State
    var action: ActionModel
    
    @Binding
    var selection: Set<String>
    
    @State
    private var actionEditSheetPresent = false
    
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.editMode)
    private var editMode

    var body: some View {
        HStack {
            if !editMode!.wrappedValue.isEditing {
                toggleButton()
            }
            
            actionContent()
            
            Spacer()
            
            actionMeta()
        }
        .padding(.vertical, -4)
        .frame(minHeight: 42, alignment: .leading)
        .contentShape(Rectangle())
        .sheet(isPresented: $actionEditSheetPresent) {
            ActionEditSheet(action: action)
        }
        .onTapGesture {
            if editMode!.wrappedValue.isEditing { return }
            toggleActionStatus()
        }
        .contextMenu {
            infoMenu()

            menuGroup()
            
            duplicateAction()
            
            priorityPicker()

            deleteAction()
            
            Divider()
            
            selectAction()
        }
        .disabled(editMode!.wrappedValue.isEditing)
        .swipeActions(edge: .trailing) {
            trailingSwipeActions()
        }
        .swipeActions(edge: .leading) {
            leadingSwipeActions()
        }
    }
    
    private func toggleButton() -> some View {
        Button {
            withAnimation {
                action.toggleStatus()
            }
        } label: {
            Image(action.isDone ? "circle.circle.2" : "circle")
                .animation(nil, value: action.isDone)
                .foregroundColor(.accentColor)
                .font(.system(size: 19))
        }
        .padding(.trailing, 5)
        .transition(.blurReplace.combined(with: .scale.combined(with: .move(edge: .trailing).combined(with: .opacity))))
    }
    
    private func actionContent() -> some View {
        VStack(alignment: .leading) {
            Text(action.title)
                .fontWeight(.medium)
                .lineLimit(1)

            if (!action.actionDescription.isEmpty) {
                Text(action.actionDescription)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .animation(nil, value: editMode?.wrappedValue)
        .opacity(action.isDone ? 0.25 : 1)
        .animation(.easeInOut(duration: 0.2), value: action.isDone)
    }
    
    private func actionMeta() -> some View {
        VStack {
            if action.isFlagged {
                Image(systemName: "flag")
                    .foregroundColor(.orange)
                    .font(.caption)
                    .padding(2)
                    .transition(.blurReplace)
            }
            
            if action.priority.icon != nil {
                Image(systemName: action.priority.icon!)
                    .foregroundColor(action.priority.color)
                    .font(.caption)
                    .padding(2)
                    .transition(.blurReplace)
            }
        }
        .animation(nil, value: editMode?.wrappedValue.isEditing)
        .animation(.easeInOut(duration: 0.2), value: action.priority)
        .animation(.easeInOut(duration: 0.2), value: action.isFlagged)
        .offset(x: 6)
    }
    
    private func infoMenu() -> some View {
        Menu("Info", systemImage: "info.circle") {
            Text("Created on \(action.createdAt.formatted(date: .abbreviated, time: .standard))")
            if action.editedAt > Date.distantPast {
                Text("Edited on \(action.editedAt.formatted(date: .abbreviated, time: .standard))")
            }
        }
    }
    
    private func menuGroup() -> some View {
        ControlGroup {
            Button {
                toggleActionStatus()
            } label: {
                Text(action.isDone ? "Uncheck" : "Check")
                Image(action.isDone ? "circle" : "circle.circle.2")
            }

            Button() {
                actionEditSheetPresent = true
            } label: {
                Label("Edit", systemImage: "square.and.pencil")
            }

            Button() {
                withAnimation {
                    action.toggleFlag()
                }
            } label: {
                Label(action.isFlagged ? "Unflag" : "Flag", systemImage: "flag")
                    .symbolVariant(action.isFlagged ? .slash : .none)
            }
        }
    }
    
    private func duplicateAction() -> some View {
        Button() {
            let newAction = ActionModel(title: action.title, description: action.actionDescription)
            context.insert(newAction)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        } label: {
            Label("Duplicate", systemImage: "document.badge.plus")
        }
    }
    
    private func priorityPicker() -> some View {
        Picker(selection: $action.priority.animation()) {
            ForEach(Priority.allCases) {
                if $0.icon?.isEmpty != nil {
                    Label($0.rawValue.capitalized, systemImage: $0.icon!)
                        .tag($0)
                } else {
                    Text($0.rawValue.capitalized)
                        .tag($0)
                }
            }
        } label: {
            Label("Set Priority" ,systemImage: "bolt.circle")
        }
        .pickerStyle(.menu)
    }
    
    private func deleteAction() -> some View {
        Button(role: .destructive) {
            context.delete(action)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
    
    private func selectAction() -> some View {
        Button() {
            editMode?.wrappedValue = .active
            selection.insert(action.id)
        } label: {
            Label("Select Action", systemImage: "checkmark.circle")
        }
    }
    
    private func trailingSwipeActions() -> some View {
        HStack {
            Button(role: .destructive) {
                context.delete(action)

                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button(role: .none) {
                actionEditSheetPresent = true
            } label: {
                Label("Edit", systemImage: "square.and.pencil")
            }
            .tint(.orange)
        }
    }
    
    private func leadingSwipeActions() -> some View {
        HStack {
            Button(role: .none) {
                withAnimation {
                    action.toggleFlag()
                }
            } label: {
                Label(action.isFlagged ? "Unflag" : "Flag", systemImage: "flag")
                    .symbolVariant(action.isFlagged ? .slash : .none)
            }
            .tint(.blue)
        }
    }
    
    private func toggleActionStatus() {
        UIImpactFeedbackGenerator.init(style: .soft).impactOccurred()
        withAnimation {
            action.toggleStatus()
        }
    }
}

#Preview {
    ActionRow(action: .default, selection: .constant(Set<String>()))
}
