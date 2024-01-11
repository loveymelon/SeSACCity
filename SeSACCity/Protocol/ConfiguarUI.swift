//
//  ConfiguarUI.swift
//  SeSACCity
//
//  Created by 김진수 on 1/10/24.
//

import Foundation
import UIKit

// ViewController들의 기능 통일
@objc protocol ConfiguarUI {
    func designNavigation()
    @objc optional func settingCollectionView()
    @objc optional func settingTableView()
}
