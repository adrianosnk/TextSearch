//
//  ValidacionCeRequest.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 14/08/22.
//

import UIKit

class MapaRequest: NSObject {

    var guid: String = ""

    init(guid: String) {
        self.guid = guid
        super.init()
    }
    
    func bodyDictionary() -> NSDictionary {
        let bodyDic : NSDictionary = ["guid": guid]
        print (bodyDic)
        return bodyDic
    }
    
}

