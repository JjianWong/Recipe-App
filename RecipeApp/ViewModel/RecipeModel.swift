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
    
    static func getPotion(ingredient : Ingredient, recipeServingSize: Int ,targetServing : Int) -> String {
        
        var denominator : Int = ingredient.denom ?? 1
        var numerator : Int = ingredient.num ?? 1
        var portion : String = ""
        var wholePortions : Int = 0
        
        
        // Get a Single serving size by multiplying denominator by the recipe servings
        denominator = denominator * recipeServingSize
        
        // Get target portion by multiplying numerator by targer servings
        numerator = numerator * targetServing
        
        // Reduce fraction by greatest common divisor
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator = numerator / divisor
        denominator = denominator / divisor
        
        
        // Get the whole portion if numerator > denominator
        if numerator > denominator {
            //Calculated whole portions
            wholePortions = numerator / denominator

            //Calculated the remainder
            numerator = numerator % denominator
            
            //Assign to portion string
            portion = portion + String(wholePortions)
        }
        // Express the remainder as a fraction
        if numerator > 0 {
            //Assign remainder as fraction to the portion string
            portion += wholePortions > 0 ? " " : ""
            portion = portion + "\(numerator)/\(denominator)"
            
        }
        
        if var unit = ingredient.unit {
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else
                {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
        
    }
}
