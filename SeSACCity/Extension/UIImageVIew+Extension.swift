//
//  UIImageVIew+Extension.swift
//  SeSACCity
//
//  Created by 김진수 on 1/11/24.
//

import Foundation
import UIKit

extension UIImageView {
    func settingImageView(clipsToBound: Bool, radius: CGFloat, mode: UIView.ContentMode = .scaleAspectFit) {
        self.clipsToBounds = clipsToBound
        self.layer.cornerRadius = radius
        self.contentMode = mode
    }
}
