//
//  PrePostViewController.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 12.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class PrePostViewController: UIViewController {

    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postProgress: UIProgressView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Navigation Controller
        self.title = "Матвей"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.NavigationBarFont]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .VKIcon_Dismiss, style: .plain, target: self, action: #selector(backButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .VKIcon_ChevroneLeft, style: .plain, target: self, action: #selector(backButton))
        
        postView.layer.borderWidth = 0.5
        postView.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.08).cgColor
        
        postView.layer.cornerRadius = VKBorderRadius
        postView.layer.masksToBounds = false
        postView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04).cgColor
        postView.layer.shadowOffset = CGSize(width: 2, height: 4)
        postView.layer.shadowRadius = 6
        
        
        
        let decoded  = UserDefaults.standard.object(forKey: "photo") as! Data
        let decodedImage = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! UIImage
        
        postTitle.text = UserDefaults.standard.object(forKey: "name") as? String
        postDescription.text = "Матвей Правосудов · Закончится через 5 дней"
        postImage.image = decodedImage
        let text = UserDefaults.standard.object(forKey: "description")!
        textView.text = text as? String

    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
