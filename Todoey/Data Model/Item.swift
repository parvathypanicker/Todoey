//
//  Item.swift
//  Todoey
//
//  Created by Rahul Nath on 13/8/19.
//  Copyright © 2019 Parvathy Thottathil. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
