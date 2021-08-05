class Person {
    
    var name: String?
    var job: String?
    var birthDay: BirthDay?

    struct BirthDay {
        var year: Int?
        var month: Int?
        var day: Int?
    }
    
    init (name: String?, job: String?, birthDay: BirthDay?) {
        self.name = name
        self.job = job
        self.birthDay = birthDay
    }
    
    func sleep() {
        if let name = self.name, let job = self.job {
            print("\(job)인 \(name)는 쿨쿨")
        } else {
            print ("못자")
        }
    }
    
    func eat(){
        if let name = self.name, let job = self.job {
            print("\(job)인 \(name)는 냠냠")
        } else {
            print ("못먹어")
        }
    }
        
    func work() {
        if let name = self.name, let job = self.job {
            print("\(job)인 \(name)는 영차")
        } else {
            print ("일이 없어")
        }
    }
}

var yeni: Person = Person(name: "yeni", job: "student", birthDay: Person.BirthDay(year: 1995, month: 8, day: 8))

yeni.sleep()
yeni.eat()
yeni.work()




var dooh = Person(name: "dooh", job: nil, birthDay: Person.BirthDay(year: 2002, month: 2, day: 2))

dooh.eat()
dooh.sleep()
dooh.work()


// Class는 init 필수x
// Struct는 init 필수
