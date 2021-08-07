class Person {
    var name: String
    var home: Apartment?
    init(name: String) {
        self.name = name
    }
}
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")

var guardName: String = "hey"
yagom?.home?.guard?.name = guardName
guardName = "Hey"

print(guardName)
