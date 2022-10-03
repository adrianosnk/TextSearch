//
//  MapaEntity.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 7/08/22.
//

import Foundation


struct MapaEntity {
    public let id: String
    public let name: String
    public let username: String
    public let email: String
    public let phone: String

    init(json: JSON) {
        self.id = json["id"] as? String ?? ""
        self.name = json["name"] as? String ?? ""
        self.username = json["username"] as? String ?? ""
        self.email = json["email"] as? String ?? ""
        self.phone = json["phone"] as? String ?? ""
        
        
    }
}


