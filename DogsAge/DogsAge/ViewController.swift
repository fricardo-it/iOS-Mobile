//
//  ViewController.swift
//  DogsAge
//
//  Created by Daniel Carvalho on 14/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func btnCheckItOutTouchUpInside(_ sender: Any) {
        
        // If let notation
        if let age = Int(txtAge.text!) {
            // age is not null/nil/None
            print(age)
            
            if age > 0 && age <= 20 {
                
                let humanAge = age * 7
                
                lblResult.text = "If your \(age) years old dog were a human, he/she would have \(humanAge) years old."
                lblResult.isHidden = false
                
            } else {
                Toast.ok(view: self, title: "Ooops!", message: "Please, enter a valid age between 1 and 20 years!")
                //return
            }
            
            
        } else {
            // age is null/nil/None
            Toast.ok(view: self, title: "Ooops!", message: "Please, enter a valid age!")
        }
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.isHidden = true
        
    }

    
    
    @IBAction func txtAgeEditingChanged(_ sender: Any) {
        
        lblResult.isHidden = true
        
    }
    

}

