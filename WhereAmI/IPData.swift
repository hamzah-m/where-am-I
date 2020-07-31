//
//  IPData.swift
//  WhereAmI
//
//  Created by Hamzah Mugharbil on 7/30/20.
//  Copyright © 2020 Hamzah Mugharbil. All rights reserved.
//

import Foundation

struct IPData: Codable {
    var ip: String = ""
    var city: String = ""
    var region: String = ""
    var country: String = ""
    var loc: String = ""
}
