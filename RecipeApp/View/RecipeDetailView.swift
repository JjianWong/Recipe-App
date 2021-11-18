//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 17/11/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    // create a Recipe instances for receive the parameter from other view
    var RecipeDetail : Recipe
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading)
            {
                Image(RecipeDetail.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK : Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 1)
                    
                    ForEach(RecipeDetail.ingredients, id: \.self) {
                        item in Text("•" + " " + item)
                    }
                    .padding(.bottom,1)
                }
                .padding(.horizontal)
                
                //MARK : Instruction
                VStack(alignment: .leading){
                    Text("Instruction")
                        .padding(.top, 5.0)
                        .font(.headline)
                        .padding(.bottom, 1.0)
                    
                    ForEach(0...RecipeDetail.directions.count-1, id: \.self) {
                        item in Text(String(item + 1) + ". " + RecipeDetail.directions[item])
                    }.padding(.bottom,1)
                }
                .padding(.horizontal)
                
            }//Master VStack
           
        }.navigationBarTitle(RecipeDetail.name) //ScrollView End
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(RecipeDetail: model.RecipesList[0])
    }
}
