import Combine

// [EXERCISE #1]

/*
 - Just :
 - 오직 하나의 값만을 출력하고 끝나게 되는 가장 단순한 형태의 Publisher.
 - Combine Framework에서 빌트인(Built-in) 형태로 제공하는 Publisher.
 -  Just는 인자로 받는 값의 타입을 Output 타입으로 실패타입은 항상 Never 로 리턴.
 
 - sink :
 - sink는 클로저 형태로 데이터를 받는 Subscriber.
 - Input 타입으로는 클로저로 받게되는 데이터값을, 에러타입으로는 Never를 받음.
 */

print("[EXERCISE #1]")
Just(5).sink{
    print($0)
}
print("\n")



// [EXERCISE #2]
/*
 - Publsiher : Publisher 중 ConnectablePublisher 프로토콜을 준수하는 Publisher
 - autoconnect를 이용하여 subscriber연결여부와 상관없이 미리 데이터를 발행.
 - sink에 receiveCompletion를 구현하여 데이터 스트림이 완료될 때 로그가 찍히도록
 - 데이터가 발행될 때 마다 receiveValue가 호출되고 데이터 스트림이 끝나게 되면 receiveCompletion이 호출
 */

// 10개의 데이터를 공급할 publisher
print("[EXERCISE #2]")
let provider = (1...10).publisher

// 구독(subscribe) 시작
provider.sink(receiveCompletion: {_ in
    print("데이터 전달이 끝났습니다.")
}, receiveValue: {data in
    print(data)
})
print("\n")



// [EXERCISE #3]
// Subscriber를 직접 구현하여 모든 라이프사이클을 확인
// class 안의 세 개의 func을 다 구현해주어야 함.
print("[EXERCISE #3]")
class CustomSubscriber: Subscriber{
    
    typealias Input = String // 성공타입
    typealias Failure = Never // 실패타입
    
    func receive(completion: Subscribers.Completion<Failure>) {
        print("모든 데이터의 발행이 완료되었습니다.")
    }
    
    func receive(subscription: Subscription) {
        print("데이터의 구독을 시작합니다.")
        // 구독할 데이터의 개수를 제한하지 않습니다.
        // subscription.request(.unlimited)
        
        // 구독할 데이터의 개수를 5개로 제한
        subscription.request(.max(5))
        // 이 경우 모든 데이터가 발행되지 않았기 때문에 completion는 호출되지 않습니다.
    }
    
    // 구독 이후 데이터 스트림을 변경할 때 사용 .none 리턴은 현재 스트림을 유지한다는 뜻
    func receive(_ input: String) -> Subscribers.Demand {
        print("데이터를 받았습니다.", input)
        return .none
    }

}

let publisher1 = ["A","B","C","D","E","F","G"].publisher
let subscriber1 = CustomSubscriber()
publisher1.subscribe(subscriber1)


// [EXERCISE #4]
// Operator
// Publsiher가 String타입이 아닌 Int타입이라면 서로 받는 타입이 달라 에러 발생
/*
let publisher2 = (1...10).publisher
let subscriber2 = CustomSubscriber()
publisher2.subscribe(subscriber2)
*/
