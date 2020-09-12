//
//  InputTableViewCell.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 11.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "inputCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textInput: UITextField!

    var saveId = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = .VKColor_Subtitle
        
        //MARK: TextInput
        textInput.backgroundColor = .VKColor_InputBackground
        textInput.attributedPlaceholder = NSAttributedString(string: "Placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.VKColor_Placeholder])
        textInput.layer.cornerRadius = VKBorderRadius
        textInput.clipsToBounds = true
        textInput.layer.borderWidth = 0.5
        textInput.layer.borderColor = UIColor.VKColor_PlaceholderBorder.cgColor
       
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 2.0))
        textInput.leftView = leftView
        textInput.leftViewMode = .always
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.set(textField.text, forKey: saveId)
    }
    
    func setProps(title: String, placeholder: String, keyboardType: UIKeyboardType, saveId: String) {
        titleLabel.text = title
        textInput.placeholder = placeholder
        textInput.keyboardType = keyboardType
        self.saveId = saveId
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
