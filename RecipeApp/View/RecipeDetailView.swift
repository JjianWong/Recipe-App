//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 17/11/2021.
//

import SwiftUI

struct RecipeDetailView: View {
   
    var RecipeDetail : Recipe
    @State var potionSelectionIndex : Int = 2
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading)
            {
                Image(RecipeDetail.image)
                    .resizable()
                    .scaledToFill()
                
                
                //MARK: Potion Picker
                VStack (alignment: .leading) {
                    Text("Pick Potion")
                        .font(.headline)
                    
                    Picker("Potion", selection: $potionSelectionIndex ) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }
                .padding([.leading, .bottom])
              
                
                //MARK : Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 1)
                    
                    ForEach(RecipeDetail.ingredients) {
                        item in Text("•" + RecipeModel.getPotion(ingredient: item, recipeServingSize: RecipeDetail.servings, targetServing: potionSelectionIndex) +  " " + item.name)
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
        // create a Recipe instances for receive the parameter from other view
        let model = RecipeModel()
        
        RecipeDetailView(RecipeDetail: model.RecipesList[0])
    }
}
