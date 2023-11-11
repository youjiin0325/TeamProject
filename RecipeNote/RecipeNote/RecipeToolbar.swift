/*Toolbar design*/

import SwiftUI


struct RecipeToolbar: ViewModifier{
    func body(content: Content) -> some View {
        content
        .foregroundStyle(.kaleGreen)
        .font(.headline)
        .fontWeight(.bold)
        .padding()
     }
   }


