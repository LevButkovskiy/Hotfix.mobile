//
//  CreateCollectionViewController.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 11.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class CreateCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var collectionIsTarget: Bool!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Navigation Controller
        self.title = collectionIsTarget ? "Целевой сбор" : "Регулярный сбор"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.NavigationBarFont]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .VKIcon_ChevroneLeft, style: .plain, target: self, action: #selector(backButton))
        
        continueButton.layer.cornerRadius = VKBorderRadius
        continueButton.backgroundColor = .VKColor_Button
        
        imagePicker.delegate = self
        
        tableView.register(UINib(nibName: String(describing: SelectPhotoTableViewCell.self), bundle: nil), forCellReuseIdentifier: SelectPhotoTableViewCell.identifier)
        tableView.register(UINib(nibName: String(describing: InputTableViewCell.self), bundle: nil), forCellReuseIdentifier: InputTableViewCell.identifier)
        tableView.register(UINib(nibName: String(describing: TextFieldTableViewCell.self), bundle: nil), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        tableView.register(UINib(nibName: String(describing: SelectTableViewCell.self), bundle: nil), forCellReuseIdentifier: SelectTableViewCell.identifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.selectPhotoTapped), name: NSNotification.Name(rawValue: "selectPhotoTapped"), object: nil)

        // Do any additional setup after loading the view.
    }


    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionIsTarget ? 6 : 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectPhotoTableViewCell.identifier, for: indexPath) as! SelectPhotoTableViewCell
            if(selectedImage != UIImage()) {
               cell.setImage(image: selectedImage)
            }
            return cell
        }
        else if (indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as! InputTableViewCell
            cell.setProps(title: "Название сбора", placeholder: "Название сбора", keyboardType: .default, saveId: "name")
            return cell
        }
        else if (indexPath.row == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as! InputTableViewCell
            cell.setProps(title: "Сумма, ₽", placeholder: "Сколько нужно собрать?", keyboardType: .numberPad, saveId: "sum")
            return cell
        }
        else if (indexPath.row == 3) {
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath) as! InputTableViewCell
            cell.setProps(title: "Цель", placeholder: "Например, лечение человека", keyboardType: .default, saveId: "target")
            return cell
        }
        else if (indexPath.row == 4) {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.setProps(title: "Описание", placeholder: "На что пойдут деньги и как они кому-то помогут?")
            return cell
        }
        else if (indexPath.row == 5) {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath) as! SelectTableViewCell
            cell.setProps(title: "Куда получать деньги", placeholder: "Счёт VK Pay · 1234", placeholderColor: .black)
            return cell
        }
        else if (indexPath.row == 6) {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath) as! SelectTableViewCell
            cell.setProps(title: "Автор", placeholder: "Матвей Правосудов", placeholderColor: .black)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 152
        case 4: return 116
        default:
            return 96
        }
    }
    
    @objc func selectPhotoTapped() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
            self.tableView.reloadData()
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func proceedButton() {
        if (collectionIsTarget) {
            let controller = AdditionalInfoViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else {
            let controller = PrePostViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
