//
//  User.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    var firstName: String?
    var lastName: String?
    var gender: String?
    
    var birthday: String?
    var address: String?
    var email: String?
    
    var landPhone: String?
    var cellPhone: String?
    var thumbnail: String?
    
    var profilePic: String?
    var age: Int16?

    
    init(_ json: [String: Any]) {
        self.firstName = json["firstName"] as? String
        self.lastName = json["lastName"] as? String
        self.birthday = json["birthday"] as? String
        
        self.age = json["age"] as? Int16
        self.address = json["address"] as? String
        self.thumbnail = json["thumbnail"] as? String
        
        self.profilePic = json["profilePic"] as? String
        self.gender = json["gender"] as? String
        self.email = json["email"] as? String
        
        self.landPhone = json["landPhone"] as? String
        self.cellPhone = json["cellPhone"] as? String
    }
}
