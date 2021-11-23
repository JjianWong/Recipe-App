//
//  RecipeFeatureView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 23/11/2021.
//

import SwiftUI

struct RecipeFeatureView: View {
    @EnvironmentObject var model : RecipeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Features Recipes")
                .bold()
                .padding(.leading)
                .padding(.top)
                .font(.largeTitle)
                
            
            GeometryReader { geo in
                VStack {
                    TabView {
                        ForEach(0..<model.RecipesList.count){ index in
                            if model.RecipesList[index].featured == true {
      
                              ZStack {
                                    Rectangle()
                                      .foregroundColor(.white)

                                    VStack {
                                        Image(model.RecipesList[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.RecipesList[index].name)
                                    }
                                }
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
                    .font(.headline)
                    
                Text("1 hour")
                    .font(.body)
                    .padding(.bottom,5)
                Text("Highlight:")
                    .font(.headline)
            
                Text("Healthy, Hearthy")
                    .font(.body)
            }
            .padding(.leading)
            .padding(.bottom,5)
            
            
        }
        
        
      
        
      
        
        
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
