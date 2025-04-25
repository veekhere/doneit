//
//  AccentColorView.swift
//  Doneit
//
//  Created by Vee K on 4/25/25.
//

import SwiftUI

struct AccentColorView: View {
    @AppStorage("accentColor")
    private var color: AccentColor = .defaultColor

    var body: some View {
        NavigationStack {
            List {
                Section {
                    colorEntry(.defaultColor)
                }
                
                Section {
                    ForEach(AccentColor.allCases.filter { $0 != .defaultColor }) { color in
                        colorEntry(color)
                    }
                }
            }
            .navigationTitle("Accent Color")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func colorEntry(_ color: AccentColor) -> some View {
        Button {
            self.color = color
        } label: {
            HStack {
                if color != .defaultColor {
                    Circle()
                        .fill(color.color)
                        .frame(width: 22)
                        .padding(.trailing, 8)
                }
                
                Text(color.title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                if self.color == color {
                    Image(systemName: "checkmark")
                        .bold()
                        .foregroundColor(color.color)
                }
            }
        }
    }
}

#Preview {
    AccentColorView()
}
