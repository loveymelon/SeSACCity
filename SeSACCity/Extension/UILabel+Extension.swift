//
//  UILabel+Extension.swift
//  SeSACCity
//
//  Created by 김진수 on 1/10/24.
//

import Foundation
import UIKit

// ViewController에서 Label을 공통되게 설정하는 부분들이 많아 UILabel 자체에 메소드를 추가하는 extension
extension UILabel {
    func setBodyLabel(aligment: NSTextAlignment, fontSize: CGFloat, lineValue: Int = 1, color: UIColor = .black) {
        self.numberOfLines = lineValue
        self.textColor = color
        self.textAlignment = aligment
        self.font = .systemFont(ofSize: fontSize)
    }
}
