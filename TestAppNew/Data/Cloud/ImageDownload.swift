//
//  ImageDownload.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 6/08/22.
//

import UIKit

extension UIImageView {
    
    typealias ImageHandler = (_ image: UIImage?) -> Void
    
    func downloadImageInURL(_ urlString: String, placeHolder: UIImage? = nil, aditionalHeaders: [String: Any] = [:], handler: ImageHandler? = nil) {
        
        self.image = placeHolder
        
        guard let urlService = URL(string: urlString) else {
            print("La url es inválida")
            return
        }

        var urlRequest = URLRequest(url: urlService)
        urlRequest.httpMethod = "GET"
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = self.createAditionalHeader(aditionalHeaders)
        
        let urlSession = URLSession(configuration: sessionConfiguration)
        
        self.downloadDataTask(urlSession, urlRequest: urlRequest, handler: handler)
    }
        
    private func downloadDataTask(_ urlSession: URLSession, urlRequest: URLRequest, handler: ImageHandler? = nil) {
     
        let task = urlSession.dataTask(with: urlRequest) { (data, urlResponse, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    
                    if let handler = handler {
                        handler(nil)
                    }else {
                        self.image = nil
                    }
                }
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                
                if let handler = handler {
                    handler(image)
                }else {
                    self.image = image
                }
            }
        }
        
        task.resume()
    }
    
    private func createAditionalHeader(_ aditionalHeader: [String: Any]) -> [String: Any] {
        
        var header: [String: Any] = ["Content-Type": "application/json"]
        
        for element in aditionalHeader {
            header[element.key] = element.value
        }
        
        return header
    }
}

