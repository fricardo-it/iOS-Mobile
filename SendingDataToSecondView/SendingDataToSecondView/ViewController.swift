//
//  ViewController.swift
//  SendingDataToSecondView
//
//  Created by Francisco Ricardo Andraschko on 26/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UITextField!
    
    @IBAction func btnSendMessageTouchUpInside(_ sender: Any) {
        //red button
        
        /*
         
         Segue:
         Green Button -> ViewController : ShouldPerformSegue -> PrepareForSegue
         
         Red Button call Segue          :       -- -- --     -> PrepareForSegue
         
         */
    
        if !txtMessage.text!.isEmpty {
            performSegue(withIdentifier: Segue.toSecondViewControllerProgrammatically, sender: self)
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtMessage.backgroundColor = .yellow

        
    }


    @IBAction func txtMessageEditingChanged(_ sender: Any) {
        
        if txtMessage.text!.isEmpty{
            txtMessage.backgroundColor = .yellow
        }else{
            txtMessage.backgroundColor = .white
        }
    }
    
    // should I stay or should I go
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // using this function to validate the data before dispatching a Segue
        if identifier == Segue.toSecondViewController {
            return !txtMessage.text!.isEmpty
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toSecondViewController || segue.identifier == Segue.toSecondViewControllerProgrammatically{
            
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.receivedMessage = txtMessage.text
            
        }
        
    }
    
}
