//
//  ADTableViewCell.swift
//  SeSACCity
//
//  Created by 김진수 on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let adCellIdentifier = "ADTableViewCell"

    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adView: UIView!
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.adLabel.setBodyLabel(aligment: .center, fontSize: 18, lineValue: 0, bold: true)
        
        self.adView.layer.cornerRadius = 10
        self.backView.layer.cornerRadius = 5
        self.backView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
    }
    
    func configureCell(data: Travel) {
        
        self.adLabel.text = data.title
    }
    
}
