import UIKit

protocol TaskInfoViewControllerDelegate {
    func insertTask(newTask: Task)
    func updateTask(updatedTask: Task)
    func deleteTask(taskToDelete: Task)
}

class TaskInfoViewController: UIViewController {

    public var selectedTask : Task?
    
    @IBOutlet weak var btnDelete : UIBarButtonItem!

    @IBOutlet weak var txtDescription : UITextField!
    @IBOutlet weak var txtInstruction : UITextField!
    @IBOutlet weak var swDone : UISwitch!

    public var delegate: TaskInfoViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    
    private func initialize() {
        
        if selectedTask != nil {

            txtDescription.text = selectedTask!.description
            txtInstruction.text = selectedTask!.instruction
            swDone.isOn = selectedTask!.done
            
        } else {
            btnDelete.isHidden = true
            swDone.isOn = false
        }
        
    }
    
    @IBAction func btnSaveTapped(_ sender : Any?) {


        // not implemented
        
        if selectedTask != nil {
            let updatedTask = Task(description: txtDescription.text!, instruction: txtInstruction.text!, done: swDone.isOn)
            delegate!.updateTask(updatedTask: updatedTask)

        } else {
            let newTask = Task(description: txtDescription.text!, instruction: txtInstruction.text!, done: swDone.isOn)
            delegate!.insertTask(newTask: newTask)
        }
                
        navigationController!.popViewController(animated: true)

    }


    func DoNotDelete( action : UIAlertAction ) {
        return
    }
    
    func yesDelete(action: UIAlertAction) {

        delegate!.deleteTask(taskToDelete: selectedTask!)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnDeleteTapped(_ sender: Any?) {
        Toast.confirm(view: self, title: "Delete", message: "Confirm to delete?", yesHandler: yesDelete, noHandler: DoNotDelete)
    }
    
}
