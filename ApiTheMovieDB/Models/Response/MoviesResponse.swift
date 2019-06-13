//
//  MoviesResponse.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import ObjectMapper

open class MoviesResponse: Mappable {
    public var page: Int = 0
    public var totalResults: Int = 0
    public var totalPages: Int = 0
    public var results: [Result] = []
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    open func mapping(map: Map) {
        
        page <- map[CodingKeys.page.rawValue]
        totalResults <- map[CodingKeys.totalResults.rawValue]
        totalPages <- map[CodingKeys.totalPages.rawValue]
        results <- map[CodingKeys.results.rawValue]
    }
}

// MARK: - Result
open class Result: Mappable {
    public var voteCount: Int = 0
    public var id: Int = 0
    public var video: Bool = false
    public var voteAverage: Double = 0.0
    public var title: String = ""
    public var popularity: Double = 0.0
    public var posterPath: String = ""
    public var originalLanguage: String = ""
    public var originalTitle: String = ""
    public var genreIDS: [Int] = []
    public var backdropPath: String = ""
    public var adult: Bool = false
    public var overview: String = ""
    public var releaseDate: String = ""
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    open func mapping(map: Map) {
        
        voteCount <- map[CodingKeys.voteCount.rawValue]
        id <- map[CodingKeys.id.rawValue]
        video <- map[CodingKeys.video.rawValue]
        voteAverage <- map[CodingKeys.voteAverage.rawValue]
        title <- map[CodingKeys.title.rawValue]
        popularity <- map[CodingKeys.popularity.rawValue]
        posterPath <- map[CodingKeys.posterPath.rawValue]
        originalLanguage <- map[CodingKeys.originalLanguage.rawValue]
        originalTitle <- map[CodingKeys.originalTitle.rawValue]
        genreIDS <- map[CodingKeys.genreIDS.rawValue]
        backdropPath <- map[CodingKeys.backdropPath.rawValue]
        adult <- map[CodingKeys.adult.rawValue]
        overview <- map[CodingKeys.overview.rawValue]
        releaseDate <- map[CodingKeys.releaseDate.rawValue]
    }
}

