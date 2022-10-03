//
//  DoctorImage.swift
//  App
//
//  Created by App on 1/6/20.
//  Copyright © 2019 App. All rights reserved.
//

import UIKit

class SunarpImage {
    
    enum SmartImagesIdentifier: String {
        case iconClose = "ic_close"
        case iconBackWhite = "ic_back_white"
        case iconNextBlack = "ic_next_black"
       
        case iconMapWhite = "filtrar_white"
        case iconMapDark = "filtrar_dark"
        
        case iconCyanMapOfiReg = "cyanMapOfiReg"
        case iconYellowMapOfiRec = "yellowMapOfiRec"
        case iconRedMapOfiCen = "redMapOfiCen"
        case iconDarMapTriReg = "darMapTriReg"
        case iconGreenMapZonReg = "greenMapZonReg"
        case iconPurpulMapOfiOther = "purpulMapOfiOther"
        
        case vect_posision = "vect_posision"
        
    }
    
    
    
    static func getImage(named: SmartImagesIdentifier) -> UIImage? {
        return UIImage(named: named.rawValue, in: Bundle(identifier: "Sunarp.App"), compatibleWith: .none)
    }
}
