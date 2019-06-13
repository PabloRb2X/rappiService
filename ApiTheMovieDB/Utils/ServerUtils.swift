//
//  ServerUtils.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

open class ServerUtils {
    public static let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    public static func createRequest(urlString: String, body: String?) -> URLRequest {
        var mutableURLRequest = URLRequest(url: URL(string: urlString)!)
        mutableURLRequest.httpMethod = "GET"//"POST"
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        print("\nURL Request:\(urlString)")
        
        if let dataBody = body {
            mutableURLRequest.httpBody = dataBody.data(using: String.Encoding.utf8)
            print("\nBody Request:\(dataBody)")
        }
        else {
            mutableURLRequest.httpBody = "{}".data(using: String.Encoding.utf8)
        }
        
        return mutableURLRequest
    }
    
}
