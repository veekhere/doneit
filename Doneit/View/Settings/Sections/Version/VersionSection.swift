//
//  VersionSection.swift
//  Doneit
//
//  Created by Vee K on 4/25/25.
//

import SwiftUI

struct VersionSection: View {
    var body: some View {
        if UIApplication.appVersion == nil || UIApplication.bundleVersion == nil {
            EmptyView()
        } else {
            HStack {
                Text("Version")
                
                Spacer()
                
                Text("\(UIApplication.appVersion!) (\(UIApplication.bundleVersion!))")
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    VersionSection()
}
