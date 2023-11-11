import SwiftUI
import _PhotosUI_SwiftUI

struct AddNewRecipe: View {
    @StateObject var recipeStore : RecipeStore
    @State var recipePhotoView = RecipePhotoView()
    
    @Binding var path : NavigationPath
    
    @State private var name :String = ""
    @State private var cookingTime :String = ""
    @State private var ingredient :String = ""
    @State private var cookingOrder :String = ""
    @State private var imageName : String = "" //사진첩에서 받아와야함
    
    var body: some View {
        Form {
            Section{
                recipePhotoView
                    .toolbar{
                        PhotosPicker(selection: $recipePhotoView.selectedPhoto, matching: .images) {
                            Image(systemName: "photo.fill")
                    
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(50)
                                .foregroundColor(.semikaleGreen)
                                .shadow(radius: 10)
                                .cornerRadius(20)
                                .opacity(0.5)
                  
                        }
                    }
          
                
                VStack(alignment: .leading) {
                    FoodInput(foodTitle: "Name", userInput: $name)
                    FoodInput(foodTitle: "CookingTime", userInput: $cookingTime)
                    FoodInput(foodTitle: "Ingredients", userInput: $ingredient)
                    FoodInput(foodTitle: "Instructions", userInput: $cookingOrder)
                }
                
                
            }.navigationTitle("Add My Recipe")
            
            
        }
        Button{
            addNewFoodRecipe()
        }label :{
            Text("Add Recipe")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(width: 300,height: 50,alignment: .center)
                .background(Color.kaleGreen)
                .cornerRadius(10)
            
        }
        
    }

    func addNewFoodRecipe() {
    
        
        let newRecipe = Recipe(id: UUID().uuidString, name: name, cookingTime: cookingTime,
                               ingredient: ingredient, cookingOrder: cookingOrder,
                               imageName: imageName.isEmpty ? "food_1" : imageName)
    
    
        recipeStore.recipes.append(newRecipe)
    
        path.removeLast()

    }
      
}

//새로운 레시피 상세 정보 입력을 위한 뷰

struct FoodInput : View {
    var foodTitle : String
  
    @Binding var userInput:String
    
    var body: some View {
        VStack(alignment:.leading){
            Text(foodTitle)
                .font(.headline)
            TextField("Enter \(foodTitle)", text: $userInput)
                .padding()
                .frame(width: 300, height: 60)
                .overlay(
                     RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.semikaleGreen, lineWidth: 2)
                    .opacity(0.5)
            )
               
        }
        .padding()
    }
}




