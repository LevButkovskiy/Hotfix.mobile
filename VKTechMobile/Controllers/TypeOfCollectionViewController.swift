//
//  TypeOfCollectionViewController.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 11.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class TypeOfCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var topTypeViewConstaint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Navigation Controller
        self.title = "Тип сбора"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.NavigationBarFont]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .VKIcon_ChevroneLeft, style: .plain, target: self, action: #selector(backButton))
        
        //MARK: TypeView
        topTypeViewConstaint.constant = self.view.frame.height * 0.5 - tableView.frame.height * 1.25
        
        
        //MARK: UITableView
        tableView.register(UINib(nibName: String(describing: TypeCollectionViewCellTableViewCell.self), bundle: nil), forCellReuseIdentifier: TypeCollectionViewCellTableViewCell.identifier)

    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TypeCollectionViewCellTableViewCell.identifier, for: indexPath) as! TypeCollectionViewCellTableViewCell
        if(indexPath.row == 0) {
            cell.setProps(iconImage: .VKIcon_Target, title: "Целевой сбор", subtitle: "Когда есть определенная цель")
        }
        else {
            cell.setProps(iconImage: .VKIcon_Calendar, title: "Регулярный сбор", subtitle: "Если нужна помощь ежемесячно")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = CreateCollectionViewController()
        navigationController?.pushViewController(controller, animated: true)
        controller.collectionIsTarget = indexPath.row == 0 ? true : false
    }

}
