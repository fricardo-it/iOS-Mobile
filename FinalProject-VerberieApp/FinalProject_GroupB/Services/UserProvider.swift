import Foundation

class UserProvider {
    
    static var allUsers = [User(fullName: "Francisco", email: "francisco@gmail.com", password: "12345"),
                           User(fullName: "Brunno", email: "brunno@gmail.com", password: "12345"),
                           User(fullName: "Daniel", email: "daniel@gmail.com", password: "12345"),
                           User(fullName: "Igor", email: "igor@gmail.com", password: "12345")]
    
    static func userExists(_ email: String) -> Bool{
        for user in allUsers {
            if user.email == email {
                return true
            }
        }
        return false
    }
}
