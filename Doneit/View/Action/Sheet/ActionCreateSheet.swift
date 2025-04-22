//
//  ActionCreateSheet.swift
//  Doneit
//
//  Created by Vee K on 4/14/25.
//

import SwiftUI
import SwiftData

struct ActionCreateSheet: View {
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.modelContext)
    private var context
    
    @State
    private var action = ActionModel()

    var body: some View {
        NavigationStack {
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
            .navigationTitle("New Action")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Create") {
                        let title = action.title.trimmingCharacters(in: .whitespacesAndNewlines)
                        let description = action.actionDescription.trimmingCharacters(in: .whitespacesAndNewlines)

                        action.title = title.isEmpty ? "Untitled" : title
                        action.actionDescription = description

                        context.insert(action)
                        
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }

                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ActionCreateSheet()
}
