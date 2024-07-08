import SwiftUI
import SwiftData

struct KittiesListView: View {
    @State private var selectedOption = "Kitties"
    @State var skip: Int = 0
    
    @StateObject var viewModel = KittyViewModel()
    @Query private var savedKitties: [CatItem]
    
    var limit: Int = 50
    var options = ["Kitties", "Favorites"]
    
    var body: some View {
        NavigationView {
            VStack(
                alignment: .center,
                spacing: .zero
            ) {
                Picker(
                    "",
                    selection: $selectedOption
                ) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                Divider()
                
                Spacer()
                
                switch selectedOption {
                case "Kitties":
                    renderKittiesList()
                case "Favorites":
                    renderFavoritesList()
                default:
                    EmptyView()
                }
            }
            .navigationTitle("Kitties")
        }
        .onAppear {
            viewModel.isLoading = true
            Task {
                await viewModel.getCats(skip: skip, limit: limit)
            }
        }
    }
    
    private func renderKittiesList() -> some View {
        ScrollView {
            ForEach(viewModel.cats, id: \.id) { cat in
                KittyCard(model: cat)
            }
        }
    }
    
    private func renderFavoritesList() -> some View {
        ScrollView {
            ForEach(savedKitties, id: \.id) { cat in
                KittyCard(model: cat.toModel())
            }
        }
    }
}

#Preview {
    KittiesListView()
        .modelContainer(for: CatItem.self, inMemory: true)
}
