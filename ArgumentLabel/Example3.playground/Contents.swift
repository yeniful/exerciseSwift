func callDog(owner: String, boy dog:String ){
    print("\(owner)는 \(dog) 왕자를 불렀다.")
}

func callDog(owner: String, girl dog: String ){
    print("\(owner)는 \(dog) 공주를 불렀다.")
}

callDog(owner: "Yeni", boy: "Guccl")
callDog(owner: "Yeni", girl: "Roy")

// Output : Yeni는 Gucci 왕자를 불렀다.
// Output : Yeni는 Roy 공주를 불렀다.
