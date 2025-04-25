//
//  ActionEditor.swift
//  Doneit
//
//  Created by Vee K on 4/12/25.
//

import SwiftUI
import SwiftData

struct ActionEditSheet: View {
    @State
    var action: ActionModel
    
    @Environment(\.dismiss)
    private var dismiss

    @Environment(\.modelContext)
    private var context
    
    @AppStorage("accentColor")
    private var color: AccentColor = .defaultColor
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Action info")) {
                    TextField(text: $action.title) {
                        Text("Title")
                    }
                    
                    TextField(text: $action.actionDescription) {
                        Text("Description")
                    }
                }
            }
            .navigationTitle("Edit Action")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Update") {
                        action.editedAt = Date.now
                        dismiss()
                    }
                }
            }
        }
        .accentColor(color.color)
    }
}

#Preview {
    ActionEditSheet(action: ActionModel())
}
