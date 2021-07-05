import SwiftUI

struct ContentView: View {
  @State var artworks = artData
  
  var body: some View {
    NavigationView {
      List(artworks) { artwork in
        NavigationLink(destination: DetailView(artwork: artwork)){
          Text(artwork.title)
        }
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Artworks")
      DetailView(artwork: artworks[0])
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
