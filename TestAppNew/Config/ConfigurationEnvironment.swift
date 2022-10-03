//
//  Configuration.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 20/07/22.
//

import Foundation

protocol EnvironmentInfo {
    
    var parameterURL: String {get set}
    
}

struct ConfigurationEnvironment {
    
    static var environment: Environment {
        
        let value = Bundle.main.infoDictionary?["Environment"] as? String ?? ""
        let environment = Environment(rawValue: value) ?? .mock
        
        return environment
    }
    
}

extension ConfigurationEnvironment {
    
    enum Environment: String {
        case mock = "Mock"
        case develop = "Develop"
        case release = "Release"
        
        var info: EnvironmentInfo {
            
            switch self {
                case .mock: return Mock()
                case .develop: return Develop()
                case .release: return Release()
            }
        }
    }
}

extension ConfigurationEnvironment {

    private struct Mock: EnvironmentInfo {
       
        var parameterURL: String = "https://jsonplaceholder.typicode.com/users"
    }
    
    private struct Develop: EnvironmentInfo {
       
        var parameterURL: String = "https://jsonplaceholder.typicode.com/users"
    }
    
    private struct Release: EnvironmentInfo {
      
        var parameterURL: String = ""
    }
}
