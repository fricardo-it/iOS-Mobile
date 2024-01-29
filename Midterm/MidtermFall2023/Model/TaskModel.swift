import Foundation

class Task {
    
    var description : String?
    var instruction : String?
    var done : Bool = false
    
    init(description: String, instruction: String, done: Bool) {
        self.description = description
        self.instruction = instruction
        self.done = done
    }
    
    init(){
    }
    
}
