//
//  AdditionalInfoViewController.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 12.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class AdditionalInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Navigation Controller
        self.title = "Дополнительно"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.NavigationBarFont]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .VKIcon_ChevroneLeft, style: .plain, target: self, action: #selector(backButton))
        continueButton.setTitle("Создать сбор", for: .normal)
        continueButton.layer.cornerRadius = VKBorderRadius
        continueButton.backgroundColor = .VKColor_Button
        
        tableView.register(UINib(nibName: String(describing: InputTableViewCell.self), bundle: nil), forCellReuseIdentifier: InputTableViewCell.identifier)
        tableView.register(UINib(nibName: String(describing: SelectTableViewCell.self), bundle: nil), forCellReuseIdentifier: SelectTableViewCell.identifier)
        tableView.register(UINib(nibName: String(describing: RadioButtonTableViewCell.self), bundle: nil), forCellReuseIdentifier: RadioButtonTableViewCell.identifier)

    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath) as! SelectTableViewCell
            cell.setProps(title: "Автор", placeholder: "Матвей Правосудов", placeholderColor: .black)
            return cell
        }
        else if (indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: RadioButtonTableViewCell.identifier, for: indexPath) as! RadioButtonTableViewCell
            cell.setProps(title: "Сбор завершится", firstLabel: "Когда соберём сумму", secondLabel: "В определённую дату", saveId: "collectionType")
            return cell
        }
        else if(indexPath.row == 2) {
                let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath) as! SelectTableViewCell
            cell.setProps(title: "Дата окончания", placeholder: "Выберите дату", placeholderColor: .VKColor_Placeholder)
                return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1: return 140
        default:
            return 96
        }
    }
    
    @IBAction func proceedButton() {
            let controller = PrePostViewController()
            self.navigationController?.pushViewController(controller, animated: true)
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
