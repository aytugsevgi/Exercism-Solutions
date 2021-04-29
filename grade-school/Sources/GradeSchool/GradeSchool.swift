//Solution goes in Sources
import Foundation

struct Student {
    var name: String
    var grade: Int
}

struct GradeSchool {
    var students = [Student]()
    var roster: [Int : [String]] {
        var result = [Int : [String]]()
        for student in students {
            if result[student.grade] != nil {
                result[student.grade]!.append(student.name)
            } else {
                result[student.grade] = [student.name]
            }
        }
        
        return result
    }
    var sortedRoster: [Int : [String]] {
        let roster = self.roster
        var result = [Int: [String]]()
        roster.forEach() {
            let value = $0.value.sorted()
            let key = $0.key
            result[key] = value
        }
        return result
    }
    mutating func addStudent(_ name: String, grade: Int) {
        let student = Student(name: name, grade: grade)
        students.append(student)
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        let filteredStudent = students.filter { $0.grade == grade }
        return filteredStudent.map { $0.name }
    }
}
