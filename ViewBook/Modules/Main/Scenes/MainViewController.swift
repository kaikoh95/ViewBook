//
//  MainViewController.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    private var tableView = UITableView()
    private var safeArea: UILayoutGuide!
    
    var users: [User] = []
    private var logicController: MainLogicController?
    private var navigation: MainNavigation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        logicController = MainLogicController()
        navigation = MainNavigation()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        firstSetup()
        setupTableView()
        deleteUserData(currentVC: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.isUserInteractionEnabled = true
        
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UserCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = true
    }
    
    // MARK: Actions
    @objc func loadMoreButtonPressed(sender: UIButton!) {
        fetchProfiles()
        loadProfiles()
        tableView.reloadData()
    }
    
    func fetchProfiles() {
        logicController?.handleFetch(currentVC: self)
    }
    
    func loadProfiles() {
        logicController?.handleLoad(currentVC: self)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigation?.presentProfileScene(currentVC: self, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        footerView.isUserInteractionEnabled = true
        footerView.backgroundColor = .white
        footerView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height:
            dynamicHeight(40))
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: dynamicWidth(55), y: 0, width: dynamicWidth(270), height: dynamicHeight(40))
        button.setTitle("Load More...", for: .normal)
        
        button.isUserInteractionEnabled = true
        button.backgroundColor = .black
        button.layer.cornerRadius = dynamicHeight(20)
        
        button.addTarget(self, action: #selector(loadMoreButtonPressed(sender:)), for: UIControl.Event.touchUpInside)
        footerView.addSubview(button)
        
        return footerView
    }
}
