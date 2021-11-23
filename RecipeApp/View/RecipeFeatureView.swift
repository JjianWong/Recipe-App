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
        VStack
        {
            List(model.RecipesList) {
                r in Image(r.image)
            }
        }
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
    }
}
