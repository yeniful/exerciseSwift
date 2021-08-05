// 전달인자 레이블과 매개변수 명을 일치시킨 경우
func greetingNoLabel (receiver: String, giver: String) {
    print("\(receiver) <- \(giver)")
}

// 중복 정의로 사용. 함수 호출시 매개변수의 역할을 명확히 하기위해 재정의 가능.
func greetingWithLabel (receiver to: String, giver from: String) {
    print("\(to) <- \(from)")
}

greetingNoLabel(receiver: "Yeni", giver: "Gucci")
greetingWithLabel(receiver: "Yeni", giver: "Roy")

// Output : Yeni <- Gucci
// Output : Yeni <- Roy
