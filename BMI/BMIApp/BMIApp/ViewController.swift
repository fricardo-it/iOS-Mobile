//
//  ViewController.swift
//  BMIApp
//
//  Created by Francisco Ricardo Andraschko on 19/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtHeightInCm: UITextField!
    @IBOutlet weak var txtWeightInKg: UITextField!
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {

        if let heightInCm = Double(txtHeightInCm.text!) {
            if (heightInCm >= 80 && heightInCm <= 250) {
                if let weightInKg = Double(txtWeightInKg.text!) {
                    if (weightInKg >= 30 && weightInKg <= 300) {
                        
                        let heightInMeters = heightInCm / 100
                        let bmi = weightInKg / pow(heightInMeters,2)

                        var classification : String = ""
                        
                        // Switch classif
                        if bmi < 18.5 {
                            classification = "Underweight"
                            lblResultClassification.backgroundColor = UIColor.blue
                            lblResultClassification.textColor = UIColor.white
                        } else if bmi < 25.0 {
                            classification = "Normal"
                            lblResultClassification.backgroundColor = UIColor.green
                            lblResultClassification.textColor = UIColor.black
                        } else if bmi < 30.0 {
                            classification = "Overweight"
                            lblResultClassification.backgroundColor = UIColor.yellow
                            lblResultClassification.textColor = UIColor.black
                        } else {
                            classification = "Obese"
                            lblResultClassification.backgroundColor = UIColor.orange
                            lblResultClassification.textColor = UIColor.black
                        }
                        
                        lblResultClassification.text = "BMI Classification = " + classification
                        lblResultClassification.isHidden = false
                        
                    }
                } else {
                    Toast.ok(view: self, title: "Review the weight", message: "Enter a height between 30 kg and 300 kg.")
                }
            } else{
                Toast.ok(view: self, title: "Review the height", message: "Enter a height between 80 cm and 250 cm.")
            }
        }
    }
    
    @IBOutlet weak var lblResultClassification: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResultClassification.isHidden = true
        
        txtHeightInCm.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        txtWeightInKg.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        lblResultClassification.isHidden = true
    }
    
}
