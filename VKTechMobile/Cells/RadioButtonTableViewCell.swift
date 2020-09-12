//
//  RadioButtonTableViewCell.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 12.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class RadioButtonTableViewCell: UITableViewCell {

    static let identifier = "radioButtonCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstRadioButton: UIButton!
    @IBOutlet weak var firstRadioLabel: UILabel!
    @IBOutlet weak var firstRadioView: UIView!
    @IBOutlet weak var secondRadioButton: UIButton!
    @IBOutlet weak var secondRadioLabel: UILabel!
    @IBOutlet weak var secondRadioView: UIView!

    var isFirstSelected: Bool!
    var saveId: String!

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.textColor = .VKColor_Subtitle
        
        let firstTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.firstRadioButtonClick))
        firstRadioLabel.addGestureRecognizer(firstTapGesture)
        firstRadioLabel.isUserInteractionEnabled = true
        firstRadioView.addGestureRecognizer(firstTapGesture)
        firstRadioView.isUserInteractionEnabled = true
        
        let secondTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.secondRadioButtonClick))
        secondRadioLabel.addGestureRecognizer(secondTapGesture)
        secondRadioLabel.isUserInteractionEnabled = true
        secondRadioView.addGestureRecognizer(secondTapGesture)
        secondRadioView.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func firstRadioButtonClick() {
        isFirstSelected = true
        firstRadioButton.setImage(.VKIcon_RadioButtonON, for: .normal)
        secondRadioButton.setImage(.VKIcon_RadioButtonOFF, for: .normal)
        
        UserDefaults.standard.set(firstRadioLabel.text, forKey: saveId)
    }
    
    @IBAction func secondRadioButtonClick() {
        isFirstSelected = false
        firstRadioButton.setImage(.VKIcon_RadioButtonOFF, for: .normal)
        secondRadioButton.setImage(.VKIcon_RadioButtonON, for: .normal)
        
        UserDefaults.standard.set(secondRadioLabel.text, forKey: saveId)

    }
    
    func setProps(title: String, firstLabel: String, secondLabel: String, saveId: String) {
        titleLabel.text = title
        firstRadioLabel.text = firstLabel
        secondRadioLabel.text = secondLabel
        self.saveId = saveId
    }
    
}
