//
//  UILabel+Extension.swift
//  SeSACCity
//
//  Created by 김진수 on 1/10/24.
//

import Foundation
import UIKit

extension UILabel {
    func setBodyLabel(aligment: NSTextAlignment, fontSize: CGFloat, lineValue: Int = 1, color: UIColor = .black) {
        self.numberOfLines = lineValue
        self.textColor = color
        self.textAlignment = aligment
        self.font = .systemFont(ofSize: fontSize)
    }
}
