import SwiftUI

struct Recipe: Codable, Identifiable {
    var id: String
    var name: String
    var cookingTime :String
    var ingredient: String
    var cookingOrder: String
    var imageName: String
}
