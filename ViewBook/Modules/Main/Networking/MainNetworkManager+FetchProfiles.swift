//
//  MainNetworkManager+FetchProfiles.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MainNetworkManager {
    
    func fetchProfiles(loadingView: UIActivityIndicatorView, currentVC: UIViewController, overlay: UIView) {
        
        let url = URL(string: "\(API_URL)/?results=5&exc=login,registered,id,nat")
        
        Alamofire.request(url!, method: .get, encoding: URLEncoding.default).responseJSON {
            response in
            
            loadingView.stopAnimating()
            currentVC.view.isUserInteractionEnabled = true
            overlay.isHidden = true
            
            if response.result.isSuccess {
                
                let json = response.result.value as! NSDictionary
                let results = json["results"] as! NSArray
                for result in results {
                    let profile = result as! NSDictionary
                    
                    let name = profile["name"] as! NSDictionary
                    let firstName = name["first"] as! String
                    let lastName = name["last"] as! String
                    
                    let dob = profile["dob"] as! NSDictionary
                    let date = dob["date"] as! String
                    let birthday = date.components(separatedBy: "T")[0]
                    let age = dob["age"] as! Int16
                    
                    let location = profile["location"] as! NSDictionary
                    let street = location["street"] as! String
                    let city = location["city"] as! String
                    let state = location["state"] as! String
                    let address = "\(street.capitalized), \(city.capitalized), \(state.capitalized)"
                    
                    let picture = profile["picture"] as! NSDictionary
                    let thumbnail = picture["thumbnail"] as! String
                    let profilePic = picture["large"] as! String
                    
                    let gender = profile["gender"] as! String
                    let email = profile["email"] as! String
                    let landPhone = profile["phone"] as! String
                    let cellPhone = profile["cell"] as! String
                    
                    let user = UserProfile(
                        [
                            "firstName": firstName.capitalized,
                            "lastName": lastName.capitalized,
                            "birthday": birthday,
                            "age": age,
                            "address": address,
                            "thumbnail": thumbnail,
                            "profilePic": profilePic,
                            "gender": gender.capitalized,
                            "email": email,
                            "landPhone": landPhone,
                            "cellPhone": cellPhone
                        ]
                    )
                    saveUserData(user: user)
                }
            }
        }
    }
}
