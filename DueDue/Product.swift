//
//  Product.swift
//  DueDue
//
//  Created by Michal Smulski on 06/12/2017.
//  Copyright © 2017 msmulski. All rights reserved.
//

import UIKit

enum ProductCategory {
    case book
    case movie
    case other
}

struct BarCode {
    var number: Int
    var image: UIImage?
}

struct Product {
    var name: String
    var category: ProductCategory
    var image: UIImage?
    var barCode: BarCode
    var manufacturer: String
    var desc: String
}
