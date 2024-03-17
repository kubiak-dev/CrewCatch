//
//  String.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 07/03/2024.
//

import Foundation
import SwiftUI

extension String {
    func heightWithConstrainedWidth(
        width: CGFloat,
        font: UIFont
    ) -> CGFloat {
        let constraintRect = CGSize(
            width: width,
            height: .greatestFiniteMagnitude
        )
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        )
        return ceil(boundingBox.height)
    }
}
