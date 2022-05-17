import Foundation

class UserData {
    // MARK: Use this flag to enable/disable random generation
    // Right now, if this is disabled, it will just give you an empty data.
    static let isRandomGenerationEnabled = true
    
    static var reminders: [Reminder] = initReminders()
    static var reminderGroups: [ReminderGroup] = initReminderGroups()
    
    private static func initReminders() -> [Reminder] {
        // MARK: no-op function that is reserved for future use.
        if isRandomGenerationEnabled {
            return []
        }
        return []
    }
    
    private static func initReminderGroups() -> [ReminderGroup] {
        // MARK: Not really useful function. Reserved for future use.
        if isRandomGenerationEnabled {
            return randomGenerateGroups()
        }
        return []
    }
}

// MARK: - Data and methods for random generation.
extension UserData {
    static func randomGenerateGroups() -> [ReminderGroup] {
        var groups = [ReminderGroup]()
        
        for _ in 0...10 {
            let groupName = UserData.possibleReminderGroupName.randomElement()!
            let groupNote = UserData.possibleReminderGroupNote.randomElement()!
            groups.append(
                ReminderGroup.getFakeReminderGroup(
                    named: groupName,
                    with: groupNote
                )
            )
        }
        
        return groups
    }
    
    static let possibleStepsCollecton: [[Reminder.Step]] = [
        [
            .init(id: 0, content: "Bacon", notes: "two bags"),
            .init(id: 1, content: "Water", notes: "soda water is better!"),
            .init(id: 2, content: "Coffee", notes: "vanilla flavor"),
            .init(id: 3, content: "Egg"),
            .init(id: 4, content: "Multi-Vitamin", notes: "120 tablets is enough"),
            .init(id: 5, content: "Sth else", notes: "lemme think about it"),
            .init(id: 6, content: "Milk", notes: "Run out of milk."),
        ],
        [
            .init(id: 0, content: "Paper #2", notes: "Due on Monday"),
            .init(id: 1, content: "Case Brief"),
            .init(id: 2, content: "ECS HW 1", notes: "add unit tests!"),
            .init(id: 3, content: "Reading 3", notes: "read twice"),
            .init(id: 4, content: "Optional Materials", notes: "Haven't done yet")
        ],
        [
            .init(id: 0, content: "Running", notes: "20 miles"),
            .init(id: 1, content: "Cycling", notes: "at least 25 mins"),
            .init(id: 2, content: "Strength"),
            .init(id: 3, content: "Swimming"),
            .init(id: 4, content: "Badminton")
        ],
        [
            .init(id: 0, content: "Do Laundry"),
            .init(id: 1, content: "Clean Rooms", notes: "after laundry"),
            .init(id: 2, content: "Fuel Car", notes: "87 is enough"),
            .init(id: 3, content: "Feed Cat")
        ],
        []
    ]
    
    static let possibleReminderNames: [(String, String)] = [
        ("Shopping List", "Go to Costco this Saturday"),
        ("Study", "Homework and Deadlines"),
        ("Fitness", "Arc hours: 9 a.m. to 9 p.m."),
        ("Misc", "Living"),
        ("Try out this new reminder", "Do we have any notes?")
    ]
    
    static let possibleReminderGroupName: [String] = [
        "Today",
        "Urgent",
        "Misc",
        "Anytime",
        "Logbook"
    ]
    
    static let possibleReminderGroupNote: [String] = [
        "This is a test data",
        "Do you want to join us?",
        "Let's have fun with SwiftUI",
        "Sync up",
        "; ) !"
    ]
}
