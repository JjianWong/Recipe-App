//
//  ContentView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 16/11/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    //@ObservedObject var model = RecipeModel()
    //Change using environment object modifier
    @EnvironmentObject var model : RecipeModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading)
            {
                Text("All Recipes")
                    .bold()
                    .padding(.leading)
                    .padding(.top)
                    .font(.largeTitle)
                ScrollView
                {
                    LazyVStack (alignment: .leading)
                    {
                        ForEach(model.RecipesList) { item in
                            NavigationLink(destination: RecipeDetailView(RecipeDetail: item),
                                           label: {
                                HStack(alignment: .top){
                                    Image(item.image)
                                        .resizable(resizingMode: .stretch)
                                        .scaledToFill()
                                        .frame(width: 60, height: 60, alignment: .leading)
                                        .cornerRadius(10)
                                        .clipped()
                                    
                                    Text(item.name)
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                }
                            })
                        }
                    }

                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
        } // End Navigation View
    }//BodyView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
