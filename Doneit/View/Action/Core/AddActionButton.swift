//
//  AddActionButton.swift
//  Doneit
//
//  Created by Vee K on 4/16/25.
//

import SwiftUI

struct AddActionButton: View {
    @Binding
    var actionCreateSheetPresent: Bool
    
    var body: some View {
        Button {
            actionCreateSheetPresent = true
            UIImpactFeedbackGenerator.init(style: .soft).impactOccurred()
        } label: {
            Label("New Action", systemImage: "plus")
                .bold()
        }
        .labelStyle(.iconOnly)
        .buttonStyle(GrowingButton())
        .offset(x: -34, y: -2)
        .transition(AddButtonTransition())
    }
    
    private struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(10)
                .background(.accent)
                .foregroundStyle(Color(UIColor.systemBackground))
                .clipShape(Circle())
                .scaleEffect(configuration.isPressed ? 2.5 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    private struct AddButtonTransition: Transition {
        func body(content: Content, phase: TransitionPhase) -> some View {
            content
                .blur(radius: phase.isIdentity ? 0 : 30)
                .opacity(phase.isIdentity ? 1 : 0)
                .offset(x: phase.isIdentity ? 0 : 100, y: phase.isIdentity ? 0 : 100)
                .scaleEffect(phase.isIdentity ? 1 : 0)
        }
    }
}

#Preview {
    AddActionButton(actionCreateSheetPresent: .constant(false))
}
