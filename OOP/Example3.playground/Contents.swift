class Vehicle {
    
    var user: String?
    var licenseNumber: Int?
    var car: Car?
    var bike: Bike?
    
    enum VehicleType {
        case car
        case bike
    }
    
    struct Car {
        var carModel: String?
        var carNumber: Int?
    }
    
    struct Bike {
        var bikeModel: String?
        var bikeNumber: Int?
    }
    
    init (user: String?, licenseNumber: Int?, car: Vehicle.Car?, bike: Vehicle.Bike?){
        self.user = user
        self.licenseNumber = licenseNumber
        self.car = car
        self.bike = bike
    }
    
    func changeVehicleInform (_ toChangeVehicleType: VehicleType, _ toVehicleModel: String?, _ toVehicleNumber: Int?) {
        switch toChangeVehicleType {
            case .car:
                car?.carModel = toVehicleModel
                car?.carNumber = toVehicleNumber
            case .bike:
                bike?.bikeModel = toVehicleModel
                bike?.bikeNumber = toVehicleNumber
        }
    }
    
    func printInform() {
        if let user = self.user,
           let licenseNumber = self.licenseNumber,
           let carModel = self.car?.carModel,
           let carNumber = self.car?.carNumber,
           let bikeModel = self.bike?.bikeModel,
           let bikeNumber = self.bike?.bikeNumber {
            print("\(user), \(licenseNumber), \(carModel), \(carNumber), \(bikeModel), \(bikeNumber)")
        } else {
            print { "error" }
        }
    }
}

var yeni = Vehicle(user: "yeni", licenseNumber: 9588, car: Vehicle.Car(carModel: "레조", carNumber: 5252), bike: Vehicle.Bike(bikeModel: "미니벨로", bikeNumber: 1004))


yeni.changeVehicleInform(Vehicle.VehicleType.car ,"모닝", 1000)
yeni.changeVehicleInform(Vehicle.VehicleType.bike, "픽시", 4001)
yeni.printInform()
