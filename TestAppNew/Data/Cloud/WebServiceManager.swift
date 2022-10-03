//
//  WebServiceManager.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 6/08/22.
//

import Foundation
import UIKit

typealias JSON      = [String: Any]
typealias JSONArray = [JSON]

extension WebServiceManager {
    
    typealias ServiceHandler = (_ jsonResponse: Any?) -> Void
    
    enum HTTPMethod: String {
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
        case patch  = "PATCH"
    }
    
    enum HostHttp: String {
        case user    = "user"
        case parameter   = "parameter"
        case security    = "security"
        case profile    = "profile"
        case solicitud    = "solicitud"
        case consultaDoc    = "consultaDoc"
        case consultaPro    = "consultaPro"
        
    }
}

class WebServiceManager {
    
    func doResquestToMethod(_ method: HTTPMethod, urlString: String, params: AnyObject? = nil, aditionalHeaders: [String: Any] = [:], handler: @escaping ServiceHandler) {
        
        var newUrl = urlString
        var host: HostHttp?
        print("urlString -> ", urlString)
        if (ConfigurationEnvironment.environment.rawValue == ConfigurationEnvironment.Environment.develop.rawValue) {
            if (urlString.contains(Constant.hostUser)) {
                host = HostHttp.user
                newUrl = urlString.replacingOccurrences(of: Constant.hostUser, with: Constant.ipHost)
            } else if (urlString.contains(Constant.hostParameter)) {
                host = HostHttp.parameter
                newUrl = urlString.replacingOccurrences(of: Constant.hostParameter, with: Constant.ipHost)
            } else if (urlString.contains(Constant.hostSecurity)) {
                host = HostHttp.security
                newUrl = urlString.replacingOccurrences(of: Constant.hostSecurity, with: Constant.ipHost)
            } else if (urlString.contains(Constant.hostProfile)) {
                host = HostHttp.profile
                newUrl = urlString.replacingOccurrences(of: Constant.hostProfile, with: Constant.ipHost)
            } else if (urlString.contains(Constant.hostSolicitud)) {
                host = HostHttp.solicitud
                newUrl = urlString.replacingOccurrences(of: Constant.hostSolicitud, with: Constant.ipHost)
            }else if (urlString.contains(Constant.hostConsulDoc)) {
                host = HostHttp.consultaDoc
                newUrl = urlString.replacingOccurrences(of: Constant.hostConsulDoc, with: Constant.ipHost)
            } else if (urlString.contains(Constant.hostConsultPropiedad)) {
                host = HostHttp.consultaPro
                newUrl = urlString.replacingOccurrences(of: Constant.hostConsultPropiedad, with: Constant.ipHost)
            }
        }
        print("newUrl -> ", newUrl)
         
        guard let urlService = URL(string: newUrl) else {
            print("La url es inválida")
            return
        }
        
        var urlRequest = URLRequest(url: urlService)
        urlRequest.httpMethod = method.rawValue
        
        let sessionConfiguration = URLSessionConfiguration.default
       // sessionConfiguration.httpAdditionalHeaders = self.createAditionalHeader(aditionalHeaders, host: host!)
        //sessionConfiguration.httpAdditionalHeaders = self.createAditionalHeader(aditionalHeaders, host: HostHttp.user)
        
        let urlSession = URLSession(configuration: sessionConfiguration)
        print(newUrl)
        method == .get ?
            downloadDataTask(urlSession, urlRequest: urlRequest, handler: handler) :
            uploadDataTask(urlSession, urlRequest: urlRequest, params: params, handler: handler)
        
    }
    
    func getJSONResponseFromData(_ data: Data?) -> Any? {
        
        guard let data = data else {
            print("No existe respuesta del servicio")
            return  nil
        }
        
        let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print(jsonResponse ?? "Error en la lectura del servicio")
        
        return jsonResponse
    }
    
    func uploadDataTask(_ urlSession: URLSession, urlRequest: URLRequest, params: AnyObject?, handler: @escaping ServiceHandler) {
        
        var dataPrams: Data? = nil
        
        if let params = params {
            dataPrams = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        
        let task = urlSession.uploadTask(with: urlRequest, from: dataPrams ?? Data()) { (data, urlResponse, error) in
            let jsonResponse = self.getJSONResponseFromData(data)
            DispatchQueue.main.async {
                handler(jsonResponse)
            }
        }
        
        task.resume()
    }
    
    func downloadDataTask(_ urlSession: URLSession, urlRequest: URLRequest, handler: @escaping ServiceHandler) {
     
        let task = urlSession.dataTask(with: urlRequest) { (data, urlResponse, error) in
            let jsonResponse = self.getJSONResponseFromData(data)
            DispatchQueue.main.async {
                handler(jsonResponse)
            }
            
            /*
            if let httpResponse = urlResponse as? HTTPURLResponse {
                if (httpResponse.statusCode == 401) {
                    UserPreferencesController.clearPreference()
                } else {
                    DispatchQueue.main.async {
                        handler(jsonResponse)
                    }
                }
            }*/
        }
        task.resume()
    }
    
    
    
    func createAditionalHeader(_ aditionalHeader: [String: Any], host: HostHttp) -> [String: Any] {
        
        var header: [String: Any] = ["Content-Type": "application/json"]
        
        for element in aditionalHeader {
            header[element.key] = element.value
        }
        
        if (ConfigurationEnvironment.environment.rawValue == ConfigurationEnvironment.Environment.develop.rawValue) {
            switch(host) {
            case .user:
                header["Host"] = Constant.hostUser
            case .parameter:
                header["Host"] = Constant.hostParameter
            case .security:
                header["Host"] = Constant.hostSecurity
            case .profile:
                header["Host"] = Constant.hostProfile
            case .solicitud:
                header["Host"] = Constant.hostSolicitud
            case .consultaDoc:
                header["Host"] = Constant.hostConsulDoc
            case .consultaPro:
                header["Host"] = Constant.hostConsultPropiedad
            }
        }
         
        if (!UserPreferencesController.getAccessToken().isEmpty) {
            let accessToken = "\(UserPreferencesController.getTokenType().capitalized) \(UserPreferencesController.getAccessToken())"
            print(accessToken)
            header["Authorization"] = accessToken
        }
        
        return header
    }
    
}
