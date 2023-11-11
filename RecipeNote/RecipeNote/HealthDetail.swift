//
//  HealthDetail.swift
//  My_Recipe
//
//  Created by YOU on 11/3/23.
//

import SwiftUI

struct HealthDetail: View {
    
    let seletedRecipes : Recipe
    
    var body: some View {
        VStack {
            Form{
                Section(header: Text(seletedRecipes.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
                    .frame(width: 190, height: 30)
                    .background(Color.kaleGreen)
                    .cornerRadius(50)) {
                    Image(seletedRecipes.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(seletedRecipes.name)
                        .font(.headline)
                        .foregroundStyle(Color.kaleGreen)
                        
                    HStack{
                           Image(systemName: "timer")
                                .foregroundColor(.carrot)
                            Text("\(seletedRecipes.cookingTime) 분")
                                .font(.body)
                            
                           
                          }
                        
                    Text(seletedRecipes.ingredient)
                        .font(.body)
                        
                    Text(seletedRecipes.cookingOrder)
                        .font(.body)
                }
                   
            }
            .background(Color.semikaleGreen)
        }
        
    }
       
}

#Preview {
    HealthDetail(seletedRecipes: .init(id: "", name: "", cookingTime: "", ingredient: "", cookingOrder: "", imageName: ""))
}
