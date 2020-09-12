//
//  MainViewController.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 11.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var baseView: UIView!

    @IBOutlet weak var topDescriptionConstaint: NSLayoutConstraint!
    @IBOutlet weak var bottomDescriptionConstaint: NSLayoutConstraint!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Navigation Controller
        self.title = "Пожертвования"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.NavigationBarFont]
        navigationController?.navigationBar.barTintColor = .white

        //MARK: CreateButton
        createButton.layer.cornerRadius = VKBorderRadius
        createButton.backgroundColor = .VKColor_Button
        createButton.setTitle("Создать сбор", for: .normal)
        
        //MARK: DescriptionLabel
        descriptionLabel?.text = "У вас пока нет сборов.\nНачните доброе дело"
        descriptionLabel.textColor = .VKColor_Description
        topDescriptionConstaint.constant = self.baseView.frame.height * 0.2449
        bottomDescriptionConstaint.constant = self.baseView.frame.height * 0.551


    }
    
    @IBAction func createButtonClick() {
        let controller = TypeOfCollectionViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
