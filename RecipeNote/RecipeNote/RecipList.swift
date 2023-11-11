import SwiftUI

struct  RecipeList :View {
    
    var recipe :Recipe
    
    var body: some View {
        HStack{
            Image(recipe.imageName)

            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .shadow(radius: 5)
            .padding(5)
            
            VStack(alignment:.leading){
                Text("조리시간: \(recipe.cookingTime) 분")
                    .foregroundStyle(Color.white)
                    .font(.caption)
                    .padding(10)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 20)
                    .background(Color.semikaleGreen)
                    .cornerRadius(50)
                
                Text(recipe.name)
                    .foregroundStyle(Color.white)
                    .font(.headline)
                    .padding(10)
                    .frame(width: 180, height: 30,alignment: .leading)
                    .background(Color.kaleGreen)
                    .cornerRadius(50)
                    .padding(5)
                
            }
        }
    }
    
}
