//
//  WebServiceRequest.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import Foundation
import Alamofire

class WebServiceRequest{
    
    static let sharedInstance: WebServiceRequest = {
        return WebServiceRequest()
    }()
    
    public func get<T: Codable>(path: String, completion: @escaping (T) -> Void, failure: @escaping (String) -> Void){
        
        guard let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else{
            return
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        AF.request(url, method: .get)
            .validate()
            .responseData(completionHandler: {(response) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result{
                case .success(let data):
                    do{
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(result)
                    }
                    catch (let jsonError as NSError){
                        failure("JSON decode failed: \(jsonError.localizedDescription)")
                    }
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut{
                        failure("Timeout: \(error.localizedDescription)")
                    }
                    else{
                        failure(error.localizedDescription)
                    }
                }
            })
    }
}
