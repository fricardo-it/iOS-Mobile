import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnSignUpTouchUpInside( _ sender : Any? ){
        
        let username = txtUsername.text!.lowercased()
        let password = txtPassword.text
        var message = ""
        
        let newUser = User(username: txtUsername.text!.lowercased(), password: txtPassword.text!)
        
        if username == "" {
            Toast.ok(view: self, title: "Error", message: "Username is missing")
        } else if password == "" {
            Toast.ok(view: self, title: "Error", message: "Password is missing")
        } else {
            if !UserProvider.userExists(username) {
                UserProvider.allUsers.append(newUser)
                Toast.ok(view: self, title: "Sucess", message: "Username registered")

            } else {
                Toast.ok(view: self, title: "Error", message: "Username already exists")
            }
            Toast.ok(view: self, title: "Error", message: message)
        }
        
    }

    
    @IBAction func btnShowPasswordTapped( _ sender : Any? ){
        
        txtPassword.isSecureTextEntry.toggle()
        
    }


}
