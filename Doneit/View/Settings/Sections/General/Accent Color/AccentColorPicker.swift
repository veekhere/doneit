//
//  AccentColorPicker.swift
//  Doneit
//
//  Created by Vee K on 4/25/25.
//

import SwiftUI

struct AccentColorPicker: View {
    @AppStorage("accentColor")
    private var color: AccentColor = .defaultColor
    
    var body: some View {
        NavigationLink(destination: AccentColorView()) {
            HStack {
                Image(systemName: "paintbrush.pointed")
                    .foregroundColor(color.color)
                    .padding(.leading, 4)
                    .padding(.trailing, 10)

                Text("Accent Color")
                
                Spacer()
                
                Text(color.title)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    AccentColorPicker()
}
