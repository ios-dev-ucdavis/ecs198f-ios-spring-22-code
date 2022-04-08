//import UIKit

struct Student {
    var grade = 4.0
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

var students = [
    Student("Yibo Yan"),
    Student("Yifan Huang"),
    Student("Yiyang Huo")
]

print(students[0])

for i in 0..<students.count {
    var student = students[i]
    student.grade = 3.9
}

print(students[0])
