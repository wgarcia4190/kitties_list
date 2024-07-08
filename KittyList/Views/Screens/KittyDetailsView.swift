import Foundation
import SwiftUI
import SwiftData

struct KittyDetailsView: View {
    var model: CatModel
    
    @Query private var savedKitties: [CatItem]
    @Environment(\.modelContext) private var modelContext
    
    
    init(model: CatModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            Color.clear.overlay(content: {
                
                AsyncImage(
                    url: model.getImageUrl(
                        width: nil,
                        height: 300
                    )
                )
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipped()
            })
            .frame(
                width: UIScreen.main.bounds.width,
                height: 300
            )
            
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
        .toolbar {
            ToolbarItem {
                Button(action: toggleItem) {
                    Label("Add Item", systemImage: isSaved() ? "heart.fill" : "heart")
                }
            }
        }
    }
    
    private func isSaved() -> Bool{
        savedKitties.contains(where: { $0.id == model.id })
    }
    
    
    private func toggleItem() {
        withAnimation {
            if isSaved() {
                deleteItems(offsets: IndexSet(savedKitties.indices.filter { savedKitties[$0].id == model.id }))
            } else {
                let newItem = CatItem(id: model.id, tags: model.tags)
                modelContext.insert(newItem)
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(savedKitties[index])
            }
        }
    }
}
