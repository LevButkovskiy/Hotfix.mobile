//
//  SelectTableViewCell.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 12.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var selectionViewValue: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    static let identifier = "selectionCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = .VKColor_Subtitle
        
        selectionView.backgroundColor = .VKColor_InputBackground
        selectionViewValue.attributedText = NSAttributedString(string: "Placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        selectionView.layer.cornerRadius = VKBorderRadius
        selectionView.clipsToBounds = true
        selectionView.layer.borderWidth = 0.5
        selectionView.layer.borderColor = UIColor.VKColor_PlaceholderBorder.cgColor
        
        iconView.tintColor = .VKColor_Chevron
        iconView.image = .VKIcon_ChevroneDown
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProps(title: String, placeholder: String, placeholderColor: UIColor) {
        titleLabel.text = title
        selectionViewValue.text = placeholder
        selectionViewValue.textColor = placeholderColor
    }
    
}
