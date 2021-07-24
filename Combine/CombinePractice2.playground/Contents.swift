import Combine
import Foundation // numberFormatter를 위해 Import



// [EXERCISE #5]
// Operator에서 Int타입을 String타입으로 바꿔주기
class CustomSubscriber: Subscriber {
    typealias Input = String // 성공타입
        typealias Failure = Never // 실패타입
        
        func receive(completion: Subscribers.Completion<Failure>) {
            print("모든 데이터의 발행이 완료되었습니다.")
        }
        
        func receive(subscription: Subscription) {
            print("데이터의 구독을 시작합니다.")
            // 구독할 데이터의 개수를 제한하지 않습니다.
            subscription.request(.unlimited)
        }
        
        // 구독 이후 데이터 스트림을 변경할 때 사용 .none 리턴은 현재 스트림을 유지한다는 뜻
        func receive(_ input: String) -> Subscribers.Demand {
            print("데이터를 받았습니다.", input)
            return .none
        }

}

// Mapping element operator를 이용하여 데이터 타입을 다른 타입으로 변환
let formatter = NumberFormatter()
formatter.numberStyle = .ordinal
(1...10).publisher.map{
    formatter.string(from: NSNumber(integerLiteral:  $0)) ?? "" }.sink{print($0)
}
print("\n")



// [EXERCISE #6]
// PassthroughSubject : 상태값을 가지지않는 Subject
let subject = PassthroughSubject<String, Error>()

subject.sink(receiveCompletion: { completion in
    switch completion {
    case .failure:
        print("Error가 발생하였습니다.")
    case .finished:
        print("데이터의 발행이 끝났습니다.")
    }
}, receiveValue: { value in
    print(value)
})

//데이터를 외부에서 발행할 수 있습니다.
subject.send("A")
subject.send("B")
subject.send("C")
subject.send("D")
//데이터의 발행을 종료합니다.
subject.send(completion: .finished)

print("\n")




// [EXERCISE #7]
// CurrentValueSubject : 상태값을 가지는 Subject
//sink와 동시에 초기값이 발행됩니다. 초기값은 true입니다.
let currentStatus = CurrentValueSubject<Bool, Error>(true)

currentStatus.sink(receiveCompletion: { completion in
    switch completion {
    case .failure:
        print("Error가 발생하였습니다.")
    case .finished:
        print("데이터의 발행이 끝났습니다.")
    }
}, receiveValue: { value in
    print(value)
})

//데이터를 외부에서 발행할 수 있습니다.
print("초기값은 \(currentStatus.value)입니다.")

currentStatus.send(false) //false 값을 주입합니다.
//value값을 변경해도 값이 발행됩니다.
currentStatus.value = true

print("\n")



// [EXERCISE #8]
// Cancellable
// Subejct 타입의 externalProvider를 초기화합니다.
let externalProvider = PassthroughSubject<String, Never>()

let anyCancleable = externalProvider.sink{ steam in
        print("전달받은데이터 \(steam)")
}

externalProvider.send("A")
externalProvider.send("B")
externalProvider.send("C")
anyCancleable.cancel() //데이터 발행을 중단합니다.
externalProvider.send("D")
