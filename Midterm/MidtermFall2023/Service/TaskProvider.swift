import Foundation

class TaskProvider {
    
    static var allTasks = [Task]()
    
    static var taskToReturn = [Task]()
    
    /// Generate mock date for testing purpouses
    static func generateMockData() {
        
        TaskProvider.allTasks = []        

        for i in 0..<100{
            allTasks.append(Task(description: "Task description #\(i+1)", instruction: "Task instruction \(i+1)", done: false))
        }
        
    }
    
    static func tasksToReturn(_ swShowOnlyTasksDone: Bool) -> Array<Task>{
        
        taskToReturn = []
        
        for task in allTasks {
            if swShowOnlyTasksDone  {
                if task.done {
                    taskToReturn.append(task)
                }
            } else {
                taskToReturn.append(task)
            }
        }
        return taskToReturn
    }
    
    
}
