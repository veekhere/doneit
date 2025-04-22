//
//  ActionSortEntry.swift
//  Doneit
//
//  Created by Vee K on 4/18/25.
//

import Foundation

struct ActionsSortEntry: Codable {
    var title: String
    var sort: [SortDescriptor<ActionModel>] = []
    var variants: [SortVariant] = []
    
    static let `default` = ActionsSortEntry(
        title: "Default",
        sort: [SortDescriptor(\ActionModel.isDone), SortDescriptor(\ActionModel.isFlagged, order: .reverse)]
    )
    
    init(
        title: String,
        sort: [SortDescriptor<ActionModel>] = [],
        variants: [SortVariant] = []
    ) {
        self.title = title
        self.sort = sort
        self.variants = variants
    }
    
    struct SortVariant: Identifiable, Codable {
        var id: SortOrder
        var title: String
        var descriptors: [SortDescriptor<ActionModel>]
    }
}
