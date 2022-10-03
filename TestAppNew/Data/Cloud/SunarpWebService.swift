//
//  SunarpService.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 6/08/22.
//

import Foundation

struct SunarpWebService {
    
    static let parameterURL = ConfigurationEnvironment.environment.info.parameterURL
 
    
    
   
    struct Mapa {
        static func getMapa() -> String {
            return parameterURL
        }
    }
    
    
}
