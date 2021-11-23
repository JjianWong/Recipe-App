//
//  DataService.swift
//  RecipeApp
//
//  Created by Ivan Wong on 16/11/2021.
//

import Foundation


class DataService {
    
    func getRecipeDataService() -> [Recipe]
    {
        // find the json file within the bundle app
        let Path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //use guard to make sure the path is not nil
        guard let pathString = Path else
        {
            return [Recipe]()
        }
        
            //establish a url object
            let urlString = URL(fileURLWithPath: pathString)
            
            do {
                // get the json content from the Json URL
                 let data = try Data(contentsOf: urlString)
                
                //initiate json decoder
                let jsonDecoder = JSONDecoder()
                
                do
                {
                    //decode the json file in a recipe model
                    let recipeData = try jsonDecoder.decode([Recipe].self, from: data)
                    
                   for recipeItem in recipeData
                   {
                       recipeItem.id = UUID()
                       
                       for ingredientDetail in recipeItem.ingredients
                       {
                           ingredientDetail.id = UUID()
                       }
                   }
                
                   return recipeData

                } catch
                {
                    //return a nil recipe object
                 return [Recipe]()
                }
            }catch
            {
                //return a nil recipe object if unable get json content
               return [Recipe]()
            }
        
    }
}
