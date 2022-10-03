//
//  RegisterModel.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 7/08/22.
//

import Foundation

class MapaModel {
    
    let service = MapaService()
    
    func getListaMapa(guid: String, handler: @escaping MapaResponseModel) {
        
        self.service.getListaMapa(guid: guid) { (arrayJsonResponse) in
            
            var arrayTipoDocumentos = [MapaEntity]()
            
            for jsonResponse in arrayJsonResponse {
                let objJson = MapaEntity(json: jsonResponse)
                arrayTipoDocumentos.append(objJson)
            }
           
            handler(arrayTipoDocumentos)
        }
    }
    
}
