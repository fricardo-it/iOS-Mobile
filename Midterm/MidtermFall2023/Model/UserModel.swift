import Foundation

class User {
    
    var username : String?
    
    /* R: - Username must be stored lowercased
          - Username is a unique key (cannot have two with the same name).
     */
    
    var password : String?
    
    /* Important information about storing passwords:
     
     Remember that you NEVER store a user password like we are doing here, unless
         if you want to be fired :).
     
      A hash/encryption algorithm should be applied before storing it.
     */
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}
