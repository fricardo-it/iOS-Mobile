import Foundation

class Validation{
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func isValidFullName(name: String) -> Bool {
            let nameRegex = "^[A-Za-z]+(?:[\\s-][A-Za-z]+)*$"
            let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
            return nameTest.evaluate(with: name)
    }
    
    func doPasswordsMatch(password: String, confirmPassword: String) -> Bool {
            return password == confirmPassword
        }
    
}
