import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // swiping tra
    
    // Dummy data for demonstration
    var data = [
        ["Indicatif": ["Future", "Present", "Past"]],
        ["Subjonctif": ["Present", "Imperfect"]],
        ["Conditionnel": ["Present", "Past"]],
        ["Imperatif": ["Present"]]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Adjust based on selected segment
        let segmentIndex = segmentControl.selectedSegmentIndex
        return data[segmentIndex].values.first?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Dummy number of rows for each section
        return 3 // Assume 3 verbs for each tense
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                
        // Configure the cell with dummy data
        cell.textLabel?.text = "Verb \(indexPath.row + 1)"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let segmentIndex = segmentControl.selectedSegmentIndex
        return data[segmentIndex].values.first?[section]
    }

    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    @IBAction func btnAddFavorite(_ sender: Any) {
    }
    /*
     // direita pra esquerda
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        <#code#>
    }
     
    //esquerda pra direita
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        <#code#>
    }
     */
    
}
