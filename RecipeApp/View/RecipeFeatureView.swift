//
//  RecipeFeatureView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 23/11/2021.
//

import SwiftUI

struct RecipeFeatureView: View {
    @EnvironmentObject var model : RecipeModel
    @State var IsRecipeDetailViewShowing : Bool = false
    @State var tabViewIndex = 0
    
 
    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            Text("Features Recipes")
                .font(Font.custom("Avenir Heavy", size: 28))
                .padding(.leading)
                .padding(.top)
             
            
            GeometryReader { geo in
                VStack {
                    TabView (selection: $tabViewIndex) {
                        ForEach(0..<model.RecipesList.count){ index in
                            if model.RecipesList[index].featured == true {
                                
                                Button(action : {
                                   IsRecipeDetailViewShowing = true
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                        
                                        VStack {
                                            Image(model.RecipesList[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                            Text(model.RecipesList[index].name)
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                        }
                                    }
                                }
                                .tag(index)
                                .sheet(isPresented: $IsRecipeDetailViewShowing, content: {
                                    RecipeDetailView(RecipeDetail : model.RecipesList[index])
                                })
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(radius: 10, x: -5, y: 5)
                                
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                
            }
            
            
            VStack(alignment: .leading) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                
                Text(model.RecipesList[tabViewIndex].prepTime)
                    .font(Font.custom("Avenir Light", size: 15))
                    .padding(.bottom,5)
                Text("Highlight:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                
               // Text("aaaa")
                 //   .font(.body)
                
                RecipeHighlightView(highlight: model.RecipesList[tabViewIndex].highlights)
                  //  .font(body)
            }
            .padding(.leading)
            .padding(.bottom,5)
            
            
        }
        .onAppear(perform: {
            setFirstFeature()})
    }
    
    func setFirstFeature()
    {
        
       let result = model.RecipesList.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        
        tabViewIndex = result ?? 0
        
    }
        
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
