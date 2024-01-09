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
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.bounds.width / 2
        self.mainImageView.contentMode = .scaleToFill
        
        self.mainLabel.textAlignment = .center
        self.mainLabel.font = .boldSystemFont(ofSize: 16)
        
        self.subLabel.numberOfLines = 0
        self.subLabel.textColor = .lightGray
        self.subLabel.textAlignment = .center
        self.subLabel.font = .systemFont(ofSize: 14)
    }
    
    func configuarCell(data: City) {
        let url = URL(string: data.city_image)!
        self.mainImageView.kf.setImage(with: url)
        self.mainLabel.text = "\(data.city_name) | \(data.city_english_name)"
        self.subLabel.text = data.city_explain
    }

}
