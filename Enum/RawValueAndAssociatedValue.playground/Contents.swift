enum Menu: Int {
    case 돈까스, 비빔밥, 된장찌개
}


// rawValue practice

if let myMenu = Menu(rawValue: Int.random(in: 0...2)) { print(myMenu) } // Output: 비빔밥

if let yourMenu = Menu(rawValue: 2) { print(yourMenu.rawValue) } // Output: 2


// associatedValue

enum AppleDevice {
    case iPhone(model: String, storage: Int)
    case iPad(model: String, storage: Int)
    case macBook(model: String, storage: Int)
    case airPods(model: String)
}


var myIphone = AppleDevice.iPhone(model: "IPhone 11 Pro Max", storage: 256)
var myMacBook = AppleDevice.macBook(model: "MacBook Pro 2020 16 inch ", storage: 1024)

print("yeni의 Iphone : \(myIphone) \nyeni의 MacBook : \(myMacBook)")



print("\n\n")

// switch문 연습

var myDevice = AppleDevice.iPhone(model: "사실은삼성폰", storage: 100 )

switch myDevice {
case .iPhone:
    let device = myDevice
    print("yeni의 Iphone : \(device)")
case .macBook:
    let device = myDevice
    print("yeni의 macBook : \(device)")
case .iPad(model: let model, storage: let storage):
    let device = myDevice
    print("아이패드")
case .airPods(model: let model):
    let device = myDevice
    print("에어팟")
}
