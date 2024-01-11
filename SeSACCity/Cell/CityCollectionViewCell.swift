//
//  CityCollectionViewCell.swift
//  SeSACCity
//
//  Created by 김진수 on 1/9/24.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    // 왜 지양하는지 알아볼것
    override func draw(_ rect: CGRect) {
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.mainImageView.contentMode = .scaleToFill
        
        //label의 textAlignment, font는 자주 사용하고 안에 있는 값만 달라 extension으로 뺐습니다.
        self.mainLabel.setBodyLabel(aligment: .center, fontSize: 16, bold: true)
        self.subLabel.setBodyLabel(aligment: .center, fontSize: 14, lineValue: 0, color: .lightGray, bold: false)
    }
    
    func configuarCell(data: City) {
        let url = URL(string: data.city_image)!
        self.mainImageView.kf.setImage(with: url)
        self.mainLabel.text = "\(data.city_name) | \(data.city_english_name)"
        self.subLabel.text = data.city_explain
    }

}
