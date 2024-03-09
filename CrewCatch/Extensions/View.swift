//
//  ViewModifiers.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 07/03/2024.
//

import Foundation
import SwiftUI

extension View {
    func roundedTextFieldWithBorder(
        cornerRadius: CGFloat = 15,
        backgroundColor: Color = .BackgroundColor,
        foregroundColor: Color = .TextColor,
        borderColor: Color = .black,
        borderWidth: CGFloat = 2,
        opacity: CGFloat = 1
    ) -> some View {
        self.padding()
            .background(.thinMaterial.opacity(opacity))
            .cornerRadius(cornerRadius)
            .foregroundColor(Color.TextColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.TextColor.opacity(1), lineWidth: borderWidth)
            )
            .autocorrectionDisabled(true)
    }
}

