//
//  ViewController.swift
//  FlashCards
//
//  Created by Christian Schmutte on 08.05.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    var flashCards = [FlashCard]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let catageory = viewModel.creatCardCategory(name: "Some Category")
        viewModel.createFlashCard(title: "Some flashcard", body: "here is some text", category: catageory)
        
        
        
    }


}

