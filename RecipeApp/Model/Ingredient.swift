//
//  Ingredient.swift
//  RecipeApp
//
//  Created by Ivan Wong on 23/11/2021.
//

import Foundation


class Ingredient : Identifiable,Decodable {
    var id : UUID?
    var name: String
    var num : Int?
    var denom : Int?
    var unit : String?
    
}
