//
//  LoadImageFromUrl.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation
import UIKit

func loadImageFromUrl(url: String) -> UIImage {
    let urlLink = URL(string: url)
    if let data = try? Data(contentsOf: urlLink!)
    {
        let image: UIImage = UIImage(data: data)!
        return image
    }
    return UIImage(named: "arrowDown")! //placeholder image
}
