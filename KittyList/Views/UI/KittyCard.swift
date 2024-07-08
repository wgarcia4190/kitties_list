import Foundation
import SwiftUI

struct KittyCard: View {
    var model: CatModel
    
    init(model: CatModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationLink {
            KittyDetailsView(model: model)
        } label: {
            VStack(
                alignment: .leading,
                spacing: .zero
            ) {
                AsyncImage(
                    url: model.getImageUrl(
                        width: 320,
                        height: 200
                    )
                )
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipped()
                .frame(width: 320, height: 200)
                
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    Text(
                        "Kitty's Information"
                    )
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 4)
                    .padding(.horizontal, 6)
                    Text(
                        "Tags: \(model.tags.joined(separator: ", "))"
                    )
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .padding(.horizontal, 6)
                    .padding(.bottom, 6)
                }
            }
            .background(Color(UIColor.systemGray5))
            .cornerRadius(15.0)
        }
    }
}

#Preview {
    KittyCard(model: CatModel(id: "", tags: []))
        
}
