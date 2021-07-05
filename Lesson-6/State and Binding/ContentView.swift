import SwiftUI

enum Mood: String {
  case happy = "😀"
  case sad = "☹️"
  case upsidedown = "🙃"
  case cat = "🐱"
}

struct ContentView: View {
  @State private var name: String = ""
  @State private var favoriteColor: Color = .green
  @State private var mood: Mood = .happy
  
  var body: some View {
    VStack {
      Text("Set your status:")
  
      StatusControl(name: $name, favoriteColor: $favoriteColor, mood: $mood)
        .padding()
      
      StatusIcon(name: name, favoriteColor: favoriteColor, mood: mood)
        .padding()
    }
  }
}

struct StatusControl: View {
  @Binding var name: String
  @Binding var favoriteColor: Color
  @Binding var mood: Mood
  
  var body: some View {
    VStack {
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      ColorPicker("Favorite Color", selection: $favoriteColor)
      
      Picker("Mood", selection: $mood) {
        Text(Mood.happy.rawValue).tag(Mood.happy)
        Text(Mood.sad.rawValue).tag(Mood.sad)
        Text(Mood.upsidedown.rawValue).tag(Mood.upsidedown)
        Text(Mood.cat.rawValue).tag(Mood.cat)
      }
      .pickerStyle(SegmentedPickerStyle())
    }
  }
}

struct StatusIcon: View {
  let name: String
  let favoriteColor: Color
  let mood: Mood
  
  var body: some View {
    VStack {
      Text(mood.rawValue)
      Text(name)
        .foregroundColor(.white)
    }
    .font(.largeTitle)
    .padding()
    .background(favoriteColor)
    .cornerRadius(12)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
