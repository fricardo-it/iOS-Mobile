import UIKit

class SignUpViewController: UIViewController {

    let validation = Validation()

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnShowPassword(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
        txtConfirmPassword.isSecureTextEntry = !txtConfirmPassword.isSecureTextEntry
    }

    @IBAction func btnSignUpTapped(_ sender: Any) {
        let email = txtEmail.text ?? ""
        let fullName = txtFullName.text ?? ""
        let password = txtPassword.text ?? ""
        let confirmPassword = txtConfirmPassword.text ?? ""

        if validation.isValidEmail(email: email) &&
           validation.isValidFullName(name: fullName) &&
           validation.doPasswordsMatch(password: password, confirmPassword: confirmPassword) {

            FrenchVerbAPI.signUp(fullName: fullName, email: email, password: password) {httpStatusCode in
                    self.navigationController?.popViewController(animated: true)
                    self.showAlertDialog(message: "Confirmado")
                    //self.performSegue(withIdentifier: Segue.signUpToMainViewController, sender: self)
            } failHandler: { httpStatusCode, errorMessage in
                DispatchQueue.main.async {
                    self.showAlertDialog(message: "Sign Up Failed: \(errorMessage)")
                }
            }
        } else {
            var errorMessage = ""

            if !validation.isValidEmail(email: email) {
                errorMessage += "Invalid email address.\n"
            }
            if !validation.isValidFullName(name: fullName) {
                errorMessage += "Invalid full name.\n"
            }
            if !validation.doPasswordsMatch(password: password, confirmPassword: confirmPassword) {
                errorMessage += "Passwords do not match."
            }

            self.showAlertDialog(message: errorMessage)
        }
    }

    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
