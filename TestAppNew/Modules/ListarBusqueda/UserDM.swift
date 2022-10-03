//
//  UserDM.swift
//  HSSearchable
//
//  Created by Hitendra iDev on 28/08/17.
//  Copyright © 2017 Hitendra iDev. All rights reserved.
//

import Foundation
import HSSearchable

struct UserDM {

    var id: String
    var name: String
    var username: String
    var email: String
    var phone: String
    
}

extension UserDM: SearchableData {
    /*
     this will only search from the name
     */
//    var searchValue: String{
//        return self.name
//    }
    
    /*
     this will search from the name and city both
     */
    var searchValue: String{
        return self.id + " " + self.name + " " + self.username + " " + self.email + " " + self.phone
    }
}
