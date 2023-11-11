import SwiftUI
struct ContentView: View {
    @StateObject var recipeStore = RecipeStore(recipes: recipeData)
  
    @State private var stackPath = NavigationPath()

   

    var body: some View {
        NavigationView {
            NavigationStack(path: $stackPath) {
                List {
                    ForEach(0..<recipeStore.recipes.count, id: \.self) { i in
                        NavigationLink(destination: HealthDetail(seletedRecipes: recipeStore.recipes[i])) {
                            RecipeList(recipe: recipeStore.recipes[i])
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                // 선택한 레시피로 이동
                .navigationDestination(for: Int.self) { i in
                    HealthDetail(seletedRecipes: recipeStore.recipes[i])
                }
                .navigationDestination(for: String.self) { _ in
                    AddNewRecipe(recipeStore: self.recipeStore, path: $stackPath)
                }
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                        NavigationLink(destination: AddNewRecipe(recipeStore: self.recipeStore, path: $stackPath)) {
                            Text("Add")
                                .modifier(RecipeToolbar())
                        }
                    }
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        EditButton()
                            .modifier(RecipeToolbar())
                    }
                }
            }
        }
    }

    // 아이템 삭제
    func deleteItem(at offsets: IndexSet) {
        recipeStore.recipes.remove(atOffsets: offsets)
    }

    // 아이템 이동
    func moveItem(from source: IndexSet, to destination: Int) {
        recipeStore.recipes.move(fromOffsets: source, toOffset: destination)
    }
}


#Preview {
    ContentView()
}
