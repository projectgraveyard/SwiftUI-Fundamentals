import SwiftUI

struct UserView: View {
  @State private var userName = ""
  @State private var favoriteGenre = Genre.action
  @ObservedObject var userStore: UserStore

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("User")) {
          TextField("User Name", text: $userName)
        }
        Section(header: Text("Favorite Genre")) {
          GenrePicker(genre: $favoriteGenre)
        }
      }
    }
    .onAppear {
      userName = userStore.currentUserInfo.userName
      favoriteGenre = userStore.currentUserInfo.favoriteGenre
    }
    .navigationBarTitle(Text("\(userName) Info"), displayMode: .inline)
    .navigationBarItems(
      trailing:
        Button(action: { updateUserInfo() } ) {
          Text("Update")
        }
    )
  }
  
  func updateUserInfo() {
    let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView(userStore: UserStore())
  }
}
