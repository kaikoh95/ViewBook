//
//  MainLogicController.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class MainLogicController {
    
    private let networkManager = MainNetworkManager()
    
    func handleFetch(currentVC: MainViewController) {
        
        let loadingInterface = currentVC.setLoadingView()
        let overlay = loadingInterface.0
        let loadingView = loadingInterface.1
        networkManager.fetchProfiles(loadingView: loadingView, currentVC: currentVC, overlay: overlay)
    }
    
    func handleLoad(currentVC: MainViewController) {
        let userData = loadUserData(currentVC: currentVC)
        for data in userData {
            if !currentVC.users.contains(data) {
                currentVC.users.append(data)
            }
        }
    }
}
