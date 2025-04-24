//
//  ActionList.swift
//  Doneit
//
//  Created by Vee K on 4/24/25.
//

import SwiftUI

struct ActionList: View {
    @Bindable
    var list: ActionListModel
    
    @State
    private var linkActive = false

    var body: some View {
        Button {
            linkActive = true
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    listIcon()

                    Spacer()

                    Text("\(list.actions.count)")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .padding(.trailing, 6)
                }
                
                Text(list.title)
                    .font(.system(.subheadline, design: .rounded, weight: .bold))
                    .foregroundColor(.secondary)
            }
            .padding(8)
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
        .navigationDestination(isPresented: $linkActive) {
            ActionsView()
        }
    }
    
    private func listIcon() -> some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 28)
            
            Image(systemName: list.icon)
                .foregroundColor(.white)
                .font(.footnote)
                .bold()
        }
    }
}

#Preview {
    ActionList(list: .init(title: "Preview"))
}
