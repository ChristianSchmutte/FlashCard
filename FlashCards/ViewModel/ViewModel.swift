//
//  ViewModel.swift
//  FlashCards
//
//  Created by Christian Schmutte on 08.05.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import Foundation
import RealmSwift

class ViewModel {
    private let realm = try! Realm()
    private var flashCards: Results<FlashCard>?
    private var cardCategories: Results<CardCategory>?
    
    // MARK: Public methods
    
    public func createFlashCard(title cardTitle: String, body cardBody: String, category: CardCategory) {
        do {
            try realm.write {
                let newCard = FlashCard()
                newCard.cardBody = cardBody
                newCard.cardTitle = cardTitle
                category.cards.append(newCard)
            }
        } catch {
            print(error)
        }
        
        
    }
    
    public func getFlashCards() -> [FlashCard] {
        guard let cards = flashCards else {fatalError("flashcards is nil")}
        return Array(cards)
    }
    
    public func getCategories() -> [CardCategory] {
        guard let categories = cardCategories else {fatalError("CardGetegories is nil")}
        return Array(categories)
    }
    
    public func deleteFlashCard(card: FlashCard) {
        do {
            try realm.write {
                realm.delete(card)
            }
        } catch {
            print("Error deleting card", error)
        }
    }
    
    public func creatCardCategory(name: String) -> CardCategory{
        let newCategory = CardCategory()
        newCategory.name = name
        
        do {
            try realm.write {
                realm.add(newCategory)
            }
        } catch {
            print("Error saving new category", error)
        }
        
        return newCategory
        
    }
    
    public func deleteCategory(category: CardCategory) {
        do {
            try realm.write {
                realm.delete(category.cards)
                realm.delete(category)
            }
        } catch {
            print("Error deleting category", error)
        }
    }
    
    public func editFlashCard(card: FlashCard, newTitle: String? = nil, newBody: String? = nil, isDone: Bool = false) {
        if let title = newTitle {
            try! realm.write {
                card.cardTitle = title
            }
        }
        if let body = newBody {
            try! realm.write {
                card.cardBody = body
            }
        }
        try! realm.write {
            card.isDone = isDone
        }
    }
    
    // MARK: - Private methods
    
    
    private func loadRealmObjects(){
        cardCategories = realm.objects(CardCategory.self)
        flashCards = realm.objects(FlashCard.self)
    }
    

    

    
    init() {
        self.loadRealmObjects()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
}
