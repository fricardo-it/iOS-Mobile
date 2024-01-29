//
//  ViewController.swift
//  FinalExamReview
//
//  Created by Francisco Ricardo on 2023-12-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLogin: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoginTouchUpInside(_ sender: Any) {
        let username = txtLogin.text
        let password = txtPassword.text
        
        if (username!.count < 2){
            Toast.ok(view: self, title: "Error", message: "Login must be at least two chars length!")
        }
        else if (password != "2235113"){
            Toast.ok(view: self, title: "Error", message: "Password must be the student number: 2235113")
        }
        else {
            performSegue(withIdentifier: Segue.toListViewController, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == Segue.toListViewController{
              (segue.destination as! ListViewController).login = txtLogin.text!
          }
      }
    
}

