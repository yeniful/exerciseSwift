//
//  Friend.swift
//  MyFriends
//
//  Created by Yeni Hwang on 2021/07/01.
//

import Foundation


/*
 {
     "name":"하나",
     "age":22,
     "address_info": {
         "country":"대한민국",
         "city":"울산"
     }
 }
 */


// 타입(구조체) 생성 후 Codable 프로토콜을 준수하도록 채택
struct Friend: Codable {
    
    struct Address: Codable{
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
    // let address_info: Address
    
    // 이름 + 나이
    var nameAndAge: String {
        return self.name + "(\(self.age))"
    }
    
    // 주소 합치기
    var fullAddress: String {
        return self.addressInfo.city + ", " +
            self.addressInfo.country
    }

    // 제이슨의 키 값(address_info)을 바꿔서(addressInfo) 적용하기
    // CodingKey 프로토콜 준수
    enum CodingKeys: String, CodingKey {
        // case마다 각각의 프로퍼티 입력
        case name, age
        case addressInfo = "address_info"
    }
}
