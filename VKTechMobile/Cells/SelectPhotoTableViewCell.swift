//
//  SelectPhotoTableViewCell.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 12.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class SelectPhotoTableViewCell: UITableViewCell, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    static let identifier = "selectPhoto"
    
    @IBOutlet weak var selectPhotoView: UIImageView!
    
    @IBOutlet weak var uploadIcon: UIImageView!
    @IBOutlet weak var uploadLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    let _border = CAShapeLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectPhotoView.layer.cornerRadius = VKBorderRadius
        selectPhotoView.clipsToBounds = true

        _border.path = UIBezierPath(roundedRect: selectPhotoView.frame, cornerRadius: VKBorderRadius).cgPath
        _border.frame = selectPhotoView.frame
        
        _border.strokeColor = UIColor.VKColor_Icon.cgColor
        _border.fillColor = nil
        _border.lineDashPattern = [4,4]
        self.selectPhotoView.layer.addSublayer(_border)
        
        uploadLabel.textColor = .VKColor_Icon
        uploadLabel.text = "Загрузить обложку"
        
        uploadIcon.image = .VKIcon_Picture
        uploadIcon.tintColor = .VKColor_Icon
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture(gesture:)))
        uploadIcon.addGestureRecognizer(tapGesture)
        uploadIcon.isUserInteractionEnabled = true
        uploadLabel.addGestureRecognizer(tapGesture)
        uploadLabel.isUserInteractionEnabled = true
        selectPhotoView.addGestureRecognizer(tapGesture)
        selectPhotoView.isUserInteractionEnabled = true
        
        closeButton.isHidden = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func tapGesture(gesture: UIGestureRecognizer) {
        NotificationCenter.default.post(name: Notification.Name("selectPhotoTapped"), object: nil)
    }
    
    func setImage(image: UIImage) {
        selectPhotoView.image = image
        uploadIcon.isHidden = true
        uploadLabel.isHidden = true
        closeButton.isHidden = false
        _border.removeFromSuperlayer()
        
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "photo")
        } catch {
            print("Couldn't write file")
        }
    }
    
    @IBAction func closeButtonAction() {
        selectPhotoView.image = nil
        uploadIcon.isHidden = false
        uploadLabel.isHidden = false
        closeButton.isHidden = true
        self.selectPhotoView.layer.addSublayer(_border)
        
        UserDefaults.standard.removeObject(forKey: "photo")


    }
}
