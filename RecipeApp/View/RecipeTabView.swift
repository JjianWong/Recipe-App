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
            Text("Recipe Features")
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
        } // end tab view
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
