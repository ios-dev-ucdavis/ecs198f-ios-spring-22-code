import Foundation

struct Reminder: Identifiable {
    // MARK: Properties
    var id = UUID()
    var groupId = UUID()
    
    var steps: [Step] = [] {
        didSet {
            if !steps.isEmpty {
                self.updateFinishStatus()
            }
        }
    }
    
    var finished: Bool = false
    var title: String = ""
    var note: String = ""
    var dueDate: Date = Date.now
    var dueDateEnabled = false
    
    // MARK: Initializers
    init() {
        self.finished = false
        self.title = ""
    }
    
    init(groupId: UUID) {
        self.groupId = groupId
        self.finished = false
        self.title = ""
    }
    
    init(steps: [Step], title: String, note: String = "") {
        self.steps = steps
        self.finished = false
        self.title = title
        self.note = note
    }
    
    // MARK: Member functions
    mutating func toggleStep(for finishedStep: Step) {
        for index in steps.indices {
            if steps[index].id == finishedStep.id {
                steps[index].toggleStep()
            }
        }
        self.updateFinishStatus()
    }
    
    mutating func toggleFinish() {
        self.finished.toggle()
    }
    
    // Used to expand a step to show the note.
    mutating func toggleExpanded(for finishedStep: Step) {
        for index in steps.indices {
            if steps[index].id == finishedStep.id {
                steps[index].toggleExpanded()
            }
        }
    }
    
    private mutating func updateFinishStatus() {
        self.finished = self.steps.filter({ $0.finished == false }).isEmpty
    }
    
    // MARK: Nested Step Struct
    struct Step: Identifiable {
        var id: Int
        var finished: Bool
        var content: String
        var notes: String
        var expanded = false
        
        init(id: Int, content: String, notes: String = "") {
            self.finished = false
            self.id = id
            self.content = content
            self.notes = notes
        }
        
        mutating func toggleStep() {
            self.finished.toggle()
        }
        
        // Used to expand to show the notes of a step
        mutating func toggleExpanded() {
            self.expanded.toggle()
        }
    }
}
