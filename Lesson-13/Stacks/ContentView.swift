import SwiftUI

// MARK:- Directions
/*
 * Try presenting a popover when the MeowMixHeader is tapped. Use the MessagePopover view.
 * Check out the TODO in this file to learn more about options for navigation views.
 */

struct ContentView: View {
  let mix = MeowMix()
  @State private var showMessage = false
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0.0) {
        MeowMixHeader()
          .padding()
          .onTapGesture {showMessage = true}
          .popover(isPresented: $showMessage){
            MessagePopover()
          }
        
        Divider()
          .padding()
        
        List(mix.tracks) { track in
          NavigationLink(destination: DetailView(track: track)){
            TrackRow(track: track)
          }
        }
        
        FeaturedCats(artists: mix.tracks.map(\.artist))
          .padding(.vertical)
          .background(Color.gray.opacity(0.2))
      }
      .navigationBarHidden(true)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct DetailView: View {
  let track: Track
  
  var body: some View {
    ZStack {
      track.gradient
        .ignoresSafeArea()
      
      VStack {
        Text(track.title)
          .font(.largeTitle)
          .fontWeight(.black)
        Text(track.artist)
          .font(.title)
          .fontWeight(.semibold)
        
        track.thumbnail
          .resizable()
          .scaledToFit()
          .padding(50)
      }
      .foregroundColor(.white)
    }
  }
}

struct MessagePopover: View {
  var body: some View {
    Text("These cats are not available in your region 😿")
      .font(.title)
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let mix = MeowMix()
    
    ContentView()
    DetailView(track: mix.tracks[0])
  }
}

