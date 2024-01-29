import Foundation

class UserProvider {
    
    static var allUsers = [User(username: "admin", password: "1234"),
                           User(username: "guest", password: "123456"),
                           User(username: "daniel carvalho", password: "1234")]
    
    
    static func userExists(_ username: String) -> Bool{
        
        for user in allUsers {
            if user.username == username {
                return true
            }
        }
        return false
    }
}
