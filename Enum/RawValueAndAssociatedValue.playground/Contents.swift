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
