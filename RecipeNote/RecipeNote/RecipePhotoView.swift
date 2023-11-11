
/*사진 가져오기*/

import SwiftUI
import PhotosUI
import UIKit


struct RecipePhotoView: View {
    @State  var selectedPhoto: PhotosPickerItem?
    @State  var selectedImageBase64: String?
    @State private var image: Image?
  
   // @State var selectedImageBinding = String?
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                image?
                    .resizable()
                    .scaledToFit()
            }
            //이미지 가져오기
            .toolbar{
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Image(systemName: "photo.fill")
                }
            }
            .task(id: selectedPhoto) {
                do {
                    if let selectedImage = try await selectedPhoto?.loadTransferable(type: Image.self) {
                        image = selectedImage
                        encodeImageToBase64(selectedImage)
                       // selectedImageBinding.wrappedValue = selectedImage
                    }
                } catch {
                    // Handle errors appropriately
                    print("Error loading image: \(error)")
                }
            }
        }
    }
    
    //이미지에 관한 공부가 많이 필요함
    private func encodeImageToBase64(_ image: Image) {
           guard let uiImage = UIImage.from(image: image) else {
               return
           }

           if let imageData = uiImage.jpegData(compressionQuality: 1.0) {
               selectedImageBase64 = imageData.base64EncodedString()
               print("Base64: \(selectedImageBase64 ?? "N/A")")
           }
       }
   }

   extension UIImage {
       static func from(image: Image) -> UIImage? {
           guard let uiImage = image.uiImageRepresentation() else {
               return nil
           }
           return uiImage
       }
   }

   extension Image {
       func uiImageRepresentation() -> UIImage? {
           if let uiImage = UIImage(named: "placeholderImage") {  // Provide a placeholder image name
               return uiImage
           }
           return nil
       }
   }
#Preview {
    RecipePhotoView()
}
