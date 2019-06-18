//
//  SearchMovieResponse.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/17/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import ObjectMapper

open class  SearchMovieResponse : Mappable {
    public var page: Int = 0
    public var total_results: Int = 0
    public var total_pages: Int = 0
    public var results: [Result] = []
    
    public init() {}
    
    required public init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        
        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
        results <- map["results"]
    }
    
}

