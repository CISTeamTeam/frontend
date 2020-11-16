//
//  Modifier-Aligned.swift
//
//  Created by Julian Schiavo. Licensed under the MIT License.
//

import SwiftUI

extension View {
    /// Aligns the view to a certain direction
    /// - Parameters:
    ///   - alignment: The alignment in which to align the view
    ///   - padding: Additional padding to add
    /// - Returns: The modified view
    func aligned(to alignment: Alignment, padding: CGFloat = 0) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .padding(padding)
    }
    
    /// Aligns the view to a certain direction horizontally
    /// - Parameters:
    ///   - alignment: The alignment in which to align the view
    ///   - padding: Additional padding to add
    /// - Returns: The modified view
    func alignedHorizontally(to alignment: HorizontalAlignment, padding: CGFloat = 0) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment.normalized)
            .padding(padding)
    }
    
    /// Aligns the view to a certain direction vertically
    /// - Parameters:
    ///   - alignment: The alignment in which to align the view
    ///   - padding: Additional padding to add
    /// - Returns: The modified view
    func alignedVertically(to alignment: VerticalAlignment, padding: CGFloat = 0) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment.normalized)
            .padding(padding)
    }
}

private extension HorizontalAlignment {
    /// Converts the `HorizontalAlignment` to an `Alignment`
    var normalized: Alignment {
        switch self {
        case .center: return .center
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }
}

private extension VerticalAlignment {
    /// Converts the `VerticalAlignment` to an `Alignment`
    var normalized: Alignment {
        switch self {
        case .bottom: return .bottom
        case .center, .firstTextBaseline, .lastTextBaseline: return .center
        case .top: return .top
        default: return .center
        }
    }
}
