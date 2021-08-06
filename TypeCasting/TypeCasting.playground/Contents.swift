class Person{
    var name: String = ""
    var age: Int?
    
    init( _ name: String, _ age: Int? ){
        self.name = name
        self.age = age
    }
    
    func wakeUp() { print("기상") }
    
    func eat() { print("냠냠") }
    
    func sleep() { print("쿨쿨") }
}

class Student: Person {
    var school: String?
    
    
    init(_ name: String, _ age: Int, _ school: String ){
        super.init(name, age)
        self.school = school
    }
    
    func goToSchool() {
        if let school = self.school {
            print("간다! \(school)!")
        } else {
            print ("error")
        }
    }
}

class UniversityStudent: Student {
    var Major: String = ""
    func makeTimetable() { print("한다! 수강신청!") }
}



var yeeun = Student("yeeun", 27, "대학교")


var yeni = Person("yeni", 27)
var jaemin = Student("jaemin", 16, "중학교")
var mimi = UniversityStudent("mimi", 20, "대학교")
var minsoo = Person("miinsoo", 22) as? UniversityStudent

var result: Bool = false {
    willSet {
        print ("\(result) -> \(newValue) 바뀌는 중")
    }
    didSet {
        print ("\(oldValue) -> \(result) 바뀜")
    }
}
result = yeni is Person
print(result)
result = yeni is Student
print(result)

result = mimi is Person
print(result)
result = mimi is Student
print(result)

// print(type(of: jaemin))
yeni.sleep()
minsoo?.sleep()
jaemin.sleep()
