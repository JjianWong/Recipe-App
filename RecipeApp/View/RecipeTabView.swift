//
//  RecipeTabView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 21/11/2021.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var defaultTab : Int = 0
    
    var body: some View {
        
        TabView(selection: $defaultTab)
        {
            // mark : Features tab
            RecipeFeatureView()
                .tabItem{
                    VStack {
                        Image(systemName: "star")
                        Text("Features")
                    }
                }.tag(0)
            
            // MARK : Recipe list Tab
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                } .tag(1)
        }
        .environmentObject(RecipeModel())
        // using environmentobject modifier so child view able access the data.
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
