//
//  ActionSort.swift
//  Doneit
//
//  Created by Vee K on 4/18/25.
//

import Foundation

class ActionsSortHelper {
    static let sortEntires: [ActionsSortKey : ActionsSortEntry] = [
        .defaultSort: .init(
            title: "Default",
            sort: [SortDescriptor(\ActionModel.isDone), SortDescriptor(\ActionModel.isFlagged, order: .reverse)]
        ),
        .title: .init(
            title: "Title",
            variants: [
                .init(
                    id: .forward,
                    title: "Ascending",
                    descriptors: [SortDescriptor(\ActionModel.title, order: .forward)]
                ),
                .init(
                    id: .reverse,
                    title: "Descending",
                    descriptors: [SortDescriptor(\ActionModel.title, order: .reverse)]
                ),
            ]
        ),
        .createdAt: .init(
            title: "Creation Date",
            variants: [
                .init(
                    id: .forward,
                    title: "Oldest First",
                    descriptors: [SortDescriptor(\ActionModel.createdAt, order: .forward)]
                ),
                .init(
                    id: .reverse,
                    title: "Newest First",
                    descriptors: [SortDescriptor(\ActionModel.createdAt, order: .reverse)]
                ),
            ]
        ),
        .editedAt: .init(
            title: "Edit Date",
            variants: [
                .init(
                    id: .forward,
                    title: "Oldest First",
                    descriptors: [SortDescriptor(\ActionModel.editedAt, order: .forward)]
                ),
                .init(
                    id: .reverse,
                    title: "Newest First",
                    descriptors: [SortDescriptor(\ActionModel.editedAt, order: .reverse)]
                ),
            ]
        )
    ]
    
    static func getEntry(_ key: ActionsSortKey) -> ActionsSortEntry {
        sortEntires[key]!
    }
}
