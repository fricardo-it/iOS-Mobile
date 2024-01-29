import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword : UITextField!

    @IBOutlet weak var btnHidePassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPassword.isSecureTextEntry = true
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toSignUpViewController {
            return true
        } else if identifier == Segue.toMainViewController {
            
            let username = txtUsername.text?.lowercased()
            let password = txtPassword.text
            var message = ""
            
            if username == "" {
                Toast.ok(view: self, title: "Error", message: "Username is missing")
            } else if password == "" {
                Toast.ok(view: self, title: "Error", message: "Password is missing")
            } else {
                for user in UserProvider.allUsers {
                    if user.username == username && user.password == password {
                        return true
                    }
                    else {
                        if user.username != username {
                            message = "Invalid credentials: Username not found"
                        } else if user.password != password {
                            message = "Invalid credentials: Password is wrong"
                        }
                    }
                }
                Toast.ok(view: self, title: "Error", message: message)
                return false
            }
        }
        return false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toMainViewController {
            let mainViewController = segue.destination as! MainViewController
            mainViewController.username = txtUsername.text!.capitalized
        }
    }


    @IBAction func btnHidePasswordTouchUpInside(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry

    }
    
    
    @IBAction func btnHidePasswordTouchDown(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
        
    }
    
}

