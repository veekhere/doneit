//
//  BoolExtension.swift
//  Doneit
//
//  Created by Vee K on 4/16/25.
//

import Foundation

extension Bool: @retroactive Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        !lhs && rhs
    }
}
