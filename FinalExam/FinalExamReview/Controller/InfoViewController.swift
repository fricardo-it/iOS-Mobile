//
//  InfoViewController.swift
//  FinalExamReview
//
//  Created by Francisco Ricardo on 2023-12-19.
//

import UIKit

protocol InfoViewControllerDelegate {
    func refreshTable()
}
class InfoViewController: UIViewController {

    var reservation : Reservation?
    var delegate: InfoViewControllerDelegate?
    
    @IBOutlet weak var txtClientName: UITextField!
    @IBOutlet weak var txtNumberOfGuests: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var lblNavBar: UINavigationItem!
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let entityName = Reservation.entity().name!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if reservation != nil {
            txtClientName.text = reservation!.clientName
                    txtNumberOfGuests.text = String(reservation!.numberOfGuests)
                    lblNavBar.title = "Showing"
                    
                } else {
                    btnDelete.isHidden = true
                    lblNavBar.title = "Adding"
                }
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        if txtClientName.text!.count < 3 || txtClientName.text!.count > 30 {
            Toast.ok(view: self, title: "Wowww", message: "The client name length is 3 to 30 characters.")
            return
        }
        
        if !txtNumberOfGuests.hasText{
            Toast.ok(view: self, title: "Wowww", message: "The number of guests must be informed")
            return
        }
        
        if Int(txtNumberOfGuests.text!) ?? 0 < 1 || Int(txtNumberOfGuests.text!) ?? 0 > 16{
            Toast.ok(view: self, title: "Wowww", message: "The number of guests is between 1 and 16.")
            return
        }
        
        if reservation == nil {
            if let existsReservation = (CoreDataProvider.findOne(context: self.context, entityName: entityName, key: "clientName", value: txtClientName.text!) as? Reservation) {
                Toast.ok(view: self, title: "Wowww", message: "\(existsReservation.clientName!) is already inserted")
                return
            }
            
            reservation = Reservation(context: self.context)
        }
        
        reservation!.clientName = txtClientName.text!
        reservation!.numberOfGuests = Int32(txtNumberOfGuests.text!)!
        
        do{
                    try CoreDataProvider.save(context: self.context)
                } catch {
                    Toast.ok(view: self, title: "Wowww", message: error.localizedDescription)
                }
                
                if delegate != nil {
                    delegate!.refreshTable()
                }
                
                navigationController?.popViewController(animated: true)
            }
    
    @IBAction func btnDeleteTouchUpInside(_ sender: Any) {
        do {
            try CoreDataProvider.delete(context: self.context, objectToDelete: self.reservation!)
        } catch {
            Toast.ok(view: self, title: "Wowww", message: error.localizedDescription)
        }
        
        if delegate != nil {
            delegate!.refreshTable()
        }
        
        navigationController?.popViewController(animated: true)
    }
}
