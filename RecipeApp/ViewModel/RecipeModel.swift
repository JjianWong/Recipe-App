//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Ivan Wong on 16/11/2021.
//

import Foundation

//Allow observable (Broadcast to others)
class RecipeModel : ObservableObject {
    @Published var RecipesList : [Recipe] = [Recipe]()
    init()
    {
       let RecipeServices = DataService()
        RecipesList = RecipeServices.getRecipeDataService()
    }
}
