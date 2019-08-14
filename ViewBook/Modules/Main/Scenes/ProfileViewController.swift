//
//  ProfileViewController.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    var index = 0
    var users: [User] = []
    
    private let userPicture : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let userDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "arial", size: dynamicHeight(16))
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstSetup()
        
        users = loadUserData(currentVC: self)
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(userPicture)
        view.addSubview(userDescriptionLabel)
        
        setupUserPicture()
        setupUserDescriptionLabel()
    }
    
    func setupUserPicture() {
        userPicture.image = loadImageFromUrl(url: (users[index].profilePic)!)
        userPicture.setupView(width: dynamicWidth(200), height: dynamicHeight(200))
        userPicture.topAnchor.constraint(equalTo: view.topAnchor, constant: dynamicHeight(100)).isActive = true
        userPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userPicture.anchorSize(widthValue: dynamicWidth(200), heightValue: dynamicHeight(200))
    }
    
    func setupUserDescriptionLabel() {
        userDescriptionLabel.contentMode = .scaleToFill
        userDescriptionLabel.setupView(width: view.frame.width, height: dynamicHeight(500))
        userDescriptionLabel.text = "Full Name: \(users[index].firstName!.capitalized) \(users[index].lastName!.capitalized) \nGender: \(users[index].gender!.capitalized) \nAge: \(users[index].age)\nDate of Birth: \(users[index].birthday!) \nAddress: \(users[index].address!.capitalized) \nMobile: \(users[index].cellPhone!) \nLandline: \(users[index].landPhone!)\nEmail: \(users[index].email!)"
        userDescriptionLabel.numberOfLines = 12
        userDescriptionLabel.topAnchor.constraint(equalTo: userPicture.bottomAnchor, constant: dynamicHeight(-100)).isActive = true
        userDescriptionLabel.anchorSize(widthValue: view.frame.width, heightValue: dynamicHeight(500))
    }
    
}

