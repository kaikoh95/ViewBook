//
//  MainNavigation.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import UIKit

//  The Main folder is for the flow of events for the main screen (scrolling and viewing profiles).
//  In most real-world applications, there are other flows such as Authentication and Profile Setup, of which
//  their respective folders can be created and conveniently managed thereon.

class MainNavigation {
    func toPreviousPage(currentVC: UIViewController) {
        currentVC.navigationController?.popViewController(animated: true)
    }
    
    func presentProfileScene(currentVC: UIViewController, index: Int) {
        let nextViewController = ProfileViewController()
        nextViewController.index = index
        currentVC.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

