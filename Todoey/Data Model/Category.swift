//
//  Category.swift
//  Todoey
//
//  Created by Rahul Nath on 13/8/19.
//  Copyright © 2019 Parvathy Thottathil. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
