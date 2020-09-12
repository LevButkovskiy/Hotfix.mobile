//
//  TextFieldTableViewCell.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 12.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextViewDelegate {
    
    static let identifier = "textFieldCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextView!
    
    var placeholder: String!


    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = .VKColor_Subtitle
        
        textField.backgroundColor = .VKColor_InputBackground
        textField.attributedText = NSAttributedString(string: "Placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.VKColor_Placeholder, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        textField.layer.cornerRadius = VKBorderRadius
        textField.clipsToBounds = true
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.VKColor_PlaceholderBorder.cgColor
        
        textField.textContainerInset = UIEdgeInsets(top: 12, left: 6, bottom: 12, right: 6)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == UIColor.VKColor_Placeholder) {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text.isEmpty) {
            textView.text = placeholder
            textView.textColor = UIColor.VKColor_Placeholder
        }
        print(textView.text)
        UserDefaults.standard.set(textView.text!, forKey: "description")
    }
    
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if (text == "\n") {
//            self.endEditing(true)
//            return false
//        }
//        return true
//    }
//
    func setProps(title: String, placeholder: String) {
        titleLabel.text = title
        textField.text = placeholder
        self.placeholder = placeholder
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
