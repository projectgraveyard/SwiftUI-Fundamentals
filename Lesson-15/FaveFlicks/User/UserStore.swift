import Combine

class UserStore: ObservableObject {
  @Published var currentUserInfo = UserInfo(userName: "Movie Lover", favoriteGenre: .adventure)
}

struct UserInfo {
  let userName: String
  let favoriteGenre: Genre
}
