//
//  DataRegisterPresenter.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 7/08/22.
//

import Foundation

class MapaSearchPresenter {
    
    private weak var controller: MapaSearchViewController?
    
    lazy private var model: MapaModel = {
       return MapaModel()
    }()
  
    init(controller: MapaSearchViewController) {
        self.controller = controller
    }
    
}

extension MapaSearchPresenter: GenericPresenter {
    
    func didLoad() {
       // self.controller?.loaderView(isVisible: true)
        let guid = UserPreferencesController.getGuid()
        
        self.model.getListaMapa(guid: guid) { (jsonValidacion) in
            self.controller?.loaderView(isVisible: true)
           // let state = jsonValidacion.codResult == "1"
            self.controller?.loadDatosMapa(jsonValidacion: jsonValidacion)
            
        }
    }
    
 
}
