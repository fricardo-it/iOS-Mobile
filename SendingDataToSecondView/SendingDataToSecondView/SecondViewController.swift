//
//  SecondViewController.swift
//  SendingDataToSecondView
//
//  Created by Francisco Ricardo Andraschko on 26/09/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    public var receivedMessage : String? //nill
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        lblMessage.text = receivedMessage
        
        
        }
    
 
    
}
