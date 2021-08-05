func greeting (to: String, from: String) {
    print("\(to) <- \(from)")
}

func greeting (receiver to: String, giver from: String) {
    print("\(to) <- \(from)")
}


greeting(to: "Yeni", from: "Gucci")
greeting(receiver: "Yeni", giver: "Roy")

// Output : Yeni <- Gucci
// Output : Yeni <- Roy
