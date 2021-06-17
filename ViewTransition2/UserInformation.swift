//
//  UserInformation.swift
//  ViewTransition
//
//  Created by Yeni Hwang on 2021/06/18.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation () // shared 라는 이름의 type propertiy shared라는 이름은 자주 사용되기때문에 보안에 취약.
    
    var name: String?
    var age: String?
}
