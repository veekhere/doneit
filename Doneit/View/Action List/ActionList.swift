//
//  ActionList.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI
import SwiftData

struct ActionList: View {
    @Bindable
    var list: ActionListEntry

    var type: ActionListType
    
    @Query
    private var actions: [ActionModel]
    
    @State
    private var linkActive = false
    
    init(list: ActionListEntry, type: ActionListType) {
        self.list = list
        self.type = type
        self._actions = Query(filter: type.filter)
    }

    var body: some View {
        Button {
            linkActive = true
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    listIcon()

                    Spacer()

                    Text("\(actions.count)")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .padding(.trailing, 6)
                }
                .padding(.bottom, 4)
                
                Text(list.title)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
        .navigationDestination(isPresented: $linkActive) {
            ActionsView(listType: type)
        }
    }
    
    private func listIcon() -> some View {
        ZStack {
            Circle()
                .fill(list.color.color)
                .frame(width: 32)
            
            Image(systemName: list.icon)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .bold()
        }
    }
}

#Preview {
    ActionList(list: .init(title: "Preview"), type: .all)
}
