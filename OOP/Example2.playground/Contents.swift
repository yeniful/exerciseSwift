class Vehicle {
    
    var user: String?
    var licenseNumber: Int?
    var car: Car?
    var bike: Bike?
    
    struct Car {
        var carNumber: Int?
        var carModel: String?
    }
    
    struct Bike {
        var bikeNumber: Int?
        var bikeModel: String?
    }
    
    init (user: String?, licenseNumber: Int?, car: Car?, bike: Bike?) {
        self.user = user
        self.licenseNumber = licenseNumber
        self.car = car
        self.bike = bike
    }
    
    func userCarInform () {
        if let user = self.user,
           let carModel = self.car?.carModel,
           let carNumber = self.car?.carNumber {
                print("소유주 : \(user), 모델 : \(carModel), 차번호 : \(carNumber)")
            } else {
                print("error")
            }
        }
}    

var myVehicle = Vehicle(user: "yeni", licenseNumber: 9588, car: Vehicle.Car(carNumber: 1004, carModel: "Ray"), bike: Vehicle.Bike(bikeNumber: 1818, bikeModel: "Pixi"))


myVehicle.car?.carModel = "갤로퍼"
myVehicle.car?.carNumber = 5252
myVehicle.userCarInform()
