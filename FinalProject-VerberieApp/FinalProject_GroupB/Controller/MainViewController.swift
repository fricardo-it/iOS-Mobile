import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @IBAction func btnShowPassword(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
    }
    
    
    @IBAction func btnSignUpTouchUpInside(_ sender: Any) {
        performSegue(withIdentifier: Segue.mainToSignUpController, sender: nil)
    }
    
    @IBAction func btnSignInTouchUpInside(_ sender: Any) {
            FrenchVerbAPI.signIn(email: txtEmail.text!, password: txtPassword.text!) { token in
                DispatchQueue.main.async {
                    print("Logged in with token \(token)")
                    Context.loggedUserToken = token
                    self.performSegue(withIdentifier: Segue.mainToTableViewController, sender: self)
                }
            } failHandler: { httpStatusCode, errorMessage in
                DispatchQueue.main.async {
                    print("Failed with code \(httpStatusCode) - \(errorMessage)")
                }
            }
        }
    
    /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.mainToSignUpController{
            return true
        }
        else if identifier == Segue.mainToTableViewController {
        }
        return false
    }
    */
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == Segue.mainToTableViewController{
            
            performSegue(withIdentifier: Segue.mainToTableViewController, sender: nil)
            
            let mainToTableView = segue.destination as! TableViewController
        }
    }
     */

}
