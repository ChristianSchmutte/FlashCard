//
//  CardCategory.swift
//  FlashCards
//
//  Created by Christian Schmutte on 08.05.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import Foundation
import RealmSwift

class CardCategory: Object {
    @objc dynamic var name: String = ""
    let cards = List<FlashCard>()
}
