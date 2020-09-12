//
//  TypeCollectionViewCellTableViewCell.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 11.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class TypeCollectionViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var chevronImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    static let identifier = "TypeCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.tintColor = .VKColor_Icon
        chevronImageView.tintColor = .VKColor_Chevron
        subtitleLabel.textColor = .VKColor_Subtitle
        backView.backgroundColor = .VKColor_Block
        backView.layer.cornerRadius = VKBorderRadius

        titleLabel.text = "Целевой сбор"
        subtitleLabel.text = "Когда есть определенная цель"
        
        chevronImageView.image = .VKIcon_ChevroneRight
        
        self.layoutMargins.left = 290
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProps(iconImage: UIImage, title: String, subtitle: String) {
        iconImageView.image = iconImage
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
}
