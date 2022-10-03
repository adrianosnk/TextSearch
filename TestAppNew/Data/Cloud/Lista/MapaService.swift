//
//  RegisterService.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 6/08/22.
//

import Foundation

class MapaService {
    
   
    
    func getListaMapa(guid: String, _ handler: @escaping ArrayJsonResponse) {
    
        let urlString = SunarpWebService.Mapa.getMapa()
        
        WebServiceManager().doResquestToMethod(.get, urlString: urlString) { (jsonResponse) in
            
            let arrayResult = jsonResponse as? JSONArray ?? []
            handler(arrayResult)
        }
    }
    
    
  
    
    
    
}
