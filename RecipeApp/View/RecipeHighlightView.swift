//
//  RecipeHighlightView.swift
//  RecipeApp
//
//  Created by Ivan Wong on 25/11/2021.
//

import SwiftUI

struct RecipeHighlightView: View {
    
    var allHighlights : String = ""
    
    init(highlight : [String])
    {
        for index in 0..<highlight.count {
            if index == highlight.count - 1 {
                allHighlights += highlight[index]
            } else
            {
                allHighlights +=  highlight[index] + ","
            }
        }
    }
    
    var body: some View {
        
    Text(allHighlights)
            .font(Font.custom("Avenir Light", size: 15))
    }
}

struct RecipeHighlightView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightView(highlight : ["test1,test2,test3"])
    }
}
