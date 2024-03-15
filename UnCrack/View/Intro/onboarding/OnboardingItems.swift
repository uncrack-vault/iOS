//
//  OnboardingItems.swift
//  UnCrack
//
//  Created by Aritra on 16/03/24.
//

import Foundation

struct Item : Identifiable {
    var id: Int
    var image : String
    var heading : String
    var text : String
}

var items = [
    Item(id: 0, image: "uncrack", heading: "Heading", text: "Text"),
    Item(id: 1, image: "uncrack", heading: "Heading", text: "Text"),
    Item(id: 2, image: "uncrack", heading: "Heading", text: "Text")
]
