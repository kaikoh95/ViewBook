//
//  Layout.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import UIKit

//  The values of 375 and 667 are based off the Zeplin wireframes from my iOS internship earlier in February.
//  These methods allows the UI to scale and maintain the ratio for different phone sizes.

func dynamicFontSize(_ fontSize: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.size.width
    let calculatedFontSize = screenWidth / 375 * fontSize
    return calculatedFontSize
}

func dynamicHeight(_ height: CGFloat) -> CGFloat {
    let screenHeight = UIScreen.main.bounds.size.height
    let calculatedHeight = screenHeight / 667 * height
    return calculatedHeight
}

func dynamicWidth(_ width: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.size.width
    let calculatedWidth = screenWidth / 375 * width
    return calculatedWidth
}

