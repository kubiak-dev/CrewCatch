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
        backgroundColor: Color = .background,
        foregroundColor: Color = .text,
        borderColor: Color = .black,
        borderWidth: CGFloat = 2,
        opacity: CGFloat = 1
    ) -> some View {
        self.padding()
            .background(.thickMaterial.opacity(opacity))
            .cornerRadius(cornerRadius)
//            .foregroundStyle(Color.text)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.text.opacity(1), lineWidth: borderWidth)
            )
            .autocorrectionDisabled(true)
    }
}

