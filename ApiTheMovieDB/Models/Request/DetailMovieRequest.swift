//
//  DetailMovieRequest.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import ObjectMapper

open class DetailMovieRequest: Mappable {
    
    public var apikey: String = ""
    public var idMovie: Int = 0
    public var language: String = ""
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    init(apikey: String, idMovie: Int, language: String){
        self.apikey = apikey
        self.idMovie = idMovie
        self.language = language
    }
    
    open func mapping(map: Map) {
        apikey <- map["api_key"]
        idMovie <- map["movie_id"]
        language <- map["language"]
    }
    
}
