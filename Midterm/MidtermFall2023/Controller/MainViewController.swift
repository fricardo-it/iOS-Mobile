import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskInfoViewControllerDelegate {

    
      
    var username : String?
    public var selectedTask : Task?
    public var selectedRow : Int?
    private var completedTasks = [Task]()
    //private var filteredTasks = [Task]()
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var lblUsername : UILabel!

    @IBOutlet weak var swShowOnlyTasksDone : UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    
    private func initialize(){
        
        lblUsername.text = "Hello " + username!.capitalized
        
        swShowOnlyTasksDone.isOn = false
        
        TaskProvider.generateMockData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @IBAction func swShowOnlyTasksDoneChanged( _ sender : Any? ){

        completedTasks = []
        
        for task in TaskProvider.allTasks {
            if task.done {
                completedTasks.append(task)
            }
        }
        
        refreshTable()
        
        
    }
    
    @IBAction func btnLogOffTapped( _ sender : Any? ){
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskProvider.tasksToReturn(swShowOnlyTasksDone.isOn).count
        //return TaskProvider.allTasks.count


    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        let task = TaskProvider.tasksToReturn(swShowOnlyTasksDone.isOn)[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = task.description
        content.secondaryText = task.instruction
        
        if task.done {
            content.image = UIImage (systemName: "checkmark")
            content.imageProperties.tintColor = UIColor(ciColor: .green)
        } else {
            content.image = UIImage (systemName: "square")
            content.imageProperties.tintColor = UIColor(ciColor: .red)
        }
        
        cell.contentConfiguration = content
        
        return cell
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)

        self.selectedTask = TaskProvider.tasksToReturn(swShowOnlyTasksDone.isOn)[indexPath.row]

        self.selectedRow = indexPath.row
        
        performSegue(withIdentifier: Segue.toTaskInfoViewControllerUpdateDelete, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
        if segue.identifier == Segue.toTaskInfoViewControllerUpdateDelete {
            (segue.destination as! TaskInfoViewController).selectedTask = self.selectedTask
        }
        
        (segue.destination as! TaskInfoViewController).delegate = self
        
    }
    
    func refreshTable() {
        tableView.reloadData()
    }
    
    func insertTask(newTask: Task) {
        TaskProvider.allTasks.append(newTask)
        refreshTable()
    }
    
    func updateTask(updatedTask: Task) {
        TaskProvider.allTasks[selectedRow!] = updatedTask
        refreshTable()
    }
    
    func deleteTask(taskToDelete: Task) {
        for i in 0..<TaskProvider.allTasks.count {
            if TaskProvider.allTasks[i] === taskToDelete {
                TaskProvider.allTasks.remove(at: i)
                break
            }
        }
        refreshTable()
    }

}

