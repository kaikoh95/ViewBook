//
//  CustomUserCell.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import UIKit

class UserCell : UITableViewCell {

    var user : User? {
        didSet {
            userThumbnail.image = loadImageFromUrl(url: (user?.thumbnail)!)
            userFirstNameLabel.text = user?.firstName?.capitalized
            userLastNameLabel.text = user?.lastName?.capitalized
            userBirthdayLabel.text = user?.birthday
            userGenderLabel.text = user?.gender?.capitalized
        }
    }
    
    private let userFirstNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: dynamicFontSize(24))
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let userLastNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: dynamicFontSize(24))
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let userThumbnail : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let userBirthdayLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: dynamicFontSize(16))
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let userGenderLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: dynamicFontSize(16))
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userThumbnail)
        addSubview(userFirstNameLabel)
        addSubview(userLastNameLabel)
        addSubview(userBirthdayLabel)
        addSubview(userGenderLabel)
        
        userThumbnail.cellAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        userFirstNameLabel.cellAnchor(top: topAnchor, left: userThumbnail.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        userLastNameLabel.cellAnchor(top: topAnchor, left: userFirstNameLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        userBirthdayLabel.cellAnchor(top: userLastNameLabel.bottomAnchor, left: userThumbnail.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        userGenderLabel.cellAnchor(top: userLastNameLabel.bottomAnchor, left: userBirthdayLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
