//
//  UserSingleton.swift
//  AstroApp
//
//  Created by Bircan Sezgin on 12.08.2023.
//

import Foundation



class UserSingleton{
    static let sharedUserInfo = UserSingleton()
    
    var username = ""
    var userCredit = ""
    var userBirthdayDate = ""
    var userBirthdayTimeOf = ""
    var userHoroscope = ""
    
    
    private init (){
        
    }
}
