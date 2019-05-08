//
//  FlashCard.swift
//  FlashCards
//
//  Created by Christian Schmutte on 08.05.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import Foundation
import RealmSwift

class FlashCard: Object {
    @objc dynamic var cardTitle: String = ""
    @objc dynamic var cardBody: String = ""
    @objc dynamic var isDone: Bool = false
    /*
     When changing properties remember to migrate again (delete from simulator
     and run again)
    */
    
    var parentCategory = LinkingObjects(fromType: CardCategory.self, property: "cards")
}
