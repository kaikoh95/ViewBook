//
//  User+CoreData.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import UIKit
import CoreData

func saveUserData(user: UserProfile) {
    
    //Reference CoreData User Entity
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let getCurrentUser = User(context: context)
    
    getCurrentUser.firstName = user.firstName
    getCurrentUser.lastName = user.lastName
    getCurrentUser.gender = user.gender
    getCurrentUser.birthday = user.birthday
    getCurrentUser.address = user.address
    getCurrentUser.email = user.email
    getCurrentUser.landPhone = user.landPhone
    getCurrentUser.cellPhone = user.cellPhone
    getCurrentUser.thumbnail = user.thumbnail
    getCurrentUser.profilePic = user.profilePic
    getCurrentUser.age = user.age!
    
    do {
        try context.save()
    } catch {
        print("Error, failed to save data locally.")
    }
}

func deleteUserData(currentVC: UIViewController) {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let data = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    
    let result = try? data.fetch(fetchRequest)
    let resultData = result as! [User]
    
    for object in resultData {
        data.delete(object)
    }
    
    do {
        try data.save()
    } catch let error as NSError  {
        print("Could not save \(error), \(error.userInfo)")
    }
}

func loadUserData(currentVC: UIViewController) -> [User] {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return []
    }
    
    let context = appDelegate.persistentContainer.viewContext
    let request: NSFetchRequest<User> = User.fetchRequest()
    
    do {
        
        let getCurrentUser = try context.fetch(request)
        return getCurrentUser
        
    }  catch {
        fatalError("This was not supposed to happen")
    }
    
    return []
}
