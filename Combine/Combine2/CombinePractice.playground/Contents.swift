import Foundation
import Combine

// MARK:- EXERCISE #1. publisher - assgin(to:on:)
// to: \.대상 변수 on: 오브젝트
class AssignTest {
    var num: Int = 0{
        didSet{
            print("num: \(num)")
        }
    }
}

var assignTest = AssignTest()

(1...5).publisher.assign(to: \.num, on: assignTest)



// MARK:- EXEICISE #2. publisher - Just
// 한 번만 보내고 끝냄
Just("Swift").sink(receiveCompletion: {
    value in
    print("Subscriber 구독 종료: \(value)")
}, receiveValue: {
    value in
    print ("Subscriber에서 받은 값: \(value)")
})



// MARK:- EXERCISE #3.
// MVVM 디자인 패턴에 적용
class ViewModel {
    var title: String! {
        didSet{
            print("title의 값: " + title)
        }
    }
    var cancelBag = Set<AnyCancellable>()
    let webService = WebService()
    
    init() {
        webService.getTitle()
        // subscriber 구독하는 것들 출력하고 cancelbag에 넣어주기
        webService.title.sink(receiveValue: {
            print($0)
        }).store(in: &cancelBag)
    }
    
}

class WebService{
    // Publisher
    var title = CurrentValueSubject<String, Never>("")
    // 일정 시간(5초) 뒤 지연 실행
    func getTitle() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: {
            self.title.value = Server.title
        })
    }
}

class Server{
    static var title: String = "초기 title"
}



var viewModel = ViewModel()         // output : 초기 title

// 7초 뒤 실행 (5초 이하로 지정시 getTitle의 지연 시간과 맞물려 ouput이 변경된 title로 나옴)
sleep(4)

Server.title = "변경된 title"
viewModel.webService.getTitle()     // output : 변경된 title

