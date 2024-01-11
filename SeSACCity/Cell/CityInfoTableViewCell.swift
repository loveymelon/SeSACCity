//
//  CityInfoTableViewCell.swift
//  SeSACCity
//
//  Created by 김진수 on 1/11/24.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {
    
    static let cityInfoCellIdentifier = "CityInfoTableViewCell"
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var starImageViews: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.travelImageView.settingImageView(clipsToBound: true, radius: 10, mode: .scaleAspectFill)
        
        self.likeImageView.tintColor = .white
        
        //        self.mainLabel.setBodyLabel(aligment: .left, fontSize: 22)
        self.mainLabel.font = .boldSystemFont(ofSize: 16)
        
        self.subLabel.setBodyLabel(fontSize: 14, lineValue: 0, color: .gray, bold: true)
        self.gradeLabel.setBodyLabel(fontSize: 12, color: .lightGray, bold: false)
        self.saveLabel.setBodyLabel(fontSize: 12, color: .lightGray, bold: false)
    }
    
    func configureCell(data: Travel) {
        var count = 0
        
        let url = URL(string: data.travel_image!)!
        
        let image = data.like! ?  "heart" : "heart.fill"
        self.travelImageView.kf.setImage(with: url)
        self.mainLabel.text = data.title
        self.subLabel.text = data.description
        self.likeImageView.image = UIImage(systemName: image)
        self.gradeLabel.text = String(data.grade!)
        self.saveLabel.text = "· 저장 \(data.save!)"
        
        for (index, imageView) in starImageViews.enumerated() {
            imageView.image = UIImage(systemName: "star.fill")
            
            if index <= Int(round(data.grade!)) {
                imageView.tintColor = .yellow
            } else {
                imageView.tintColor = .lightGray
            }
        }
    }
}
