//
//  Response.swift
//  ViewBook
//
//  Created by Kurokikai on 14/08/19.
//  Copyright © 2019 Kai Koh. All rights reserved.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let status: String
    let message: String
    let data: T?
}
