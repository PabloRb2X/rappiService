//
//  MoviesResponse.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import ObjectMapper

open class MoviesResponse: NSObject, Mappable, NSCoding {
    
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
    
    public override init() {}
    
    public init(page: Int, totalResults: Int, totalPages: Int, results: [Result]){
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
    
    required public init?(map: Map){
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let page = aDecoder.decodeInteger(forKey: "page")
        let totalResults = aDecoder.decodeInteger(forKey: "totalResults")
        let totalPages = aDecoder.decodeInteger(forKey: "totalPages")
        let results = aDecoder.decodeObject(forKey: "results") as! [Result]
        
        self.init(page: page, totalResults: totalResults, totalPages: totalPages, results: results)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(page, forKey: "page")
        aCoder.encode(totalResults, forKey: "totalResults")
        aCoder.encode(totalPages, forKey: "totalPages")
        aCoder.encode(results, forKey: "results")
    }
    
    open func mapping(map: Map) {
        
        page <- map[CodingKeys.page.rawValue]
        totalResults <- map[CodingKeys.totalResults.rawValue]
        totalPages <- map[CodingKeys.totalPages.rawValue]
        results <- map[CodingKeys.results.rawValue]
    }
}

// MARK: - Result
open class Result: NSObject, Mappable, NSCoding {
    
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
    
    public override init() {}
    
    required public init?(map: Map){
    }
    
    public init(voteCount: Int, id: Int, video: Bool, voteAverage: Double, title: String, popularity: Double, posterPath: String, originalLanguage: String, originalTitle: String, genreIDS: [Int], backdropPath: String, adult: Bool, overview: String, releaseDate: String){
        
        self.voteCount = voteCount
        self.id = id
        self.video = video
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIDS = genreIDS
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let voteCount = aDecoder.decodeInteger(forKey: "voteCount")
        let id = aDecoder.decodeInteger(forKey: "id")
        let video = aDecoder.decodeBool(forKey: "video")
        let voteAverage = aDecoder.decodeDouble(forKey: "voteAverage")
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let popularity = aDecoder.decodeDouble(forKey: "popularity")
        let posterPath = aDecoder.decodeObject(forKey: "posterPath") as! String
        let originalLanguage = aDecoder.decodeObject(forKey: "originalLanguage") as! String
        let originalTitle = aDecoder.decodeObject(forKey: "originalTitle") as! String
        let genreIDS = aDecoder.decodeObject(forKey: "genreIDS") as! [Int]
        let backdropPath = aDecoder.decodeObject(forKey: "backdropPath") as! String
        let adult = aDecoder.decodeBool(forKey: "adult")
        let overview = aDecoder.decodeObject(forKey: "overview") as! String
        let releaseDate = aDecoder.decodeObject(forKey: "releaseDate") as! String
        
        self.init(voteCount: voteCount, id: id, video: video, voteAverage: voteAverage, title: title, popularity: popularity, posterPath: posterPath, originalLanguage: originalLanguage, originalTitle: originalTitle, genreIDS: genreIDS, backdropPath: backdropPath, adult: adult, overview: overview, releaseDate: releaseDate)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(voteCount, forKey: "voteCount")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(video, forKey: "video")
        aCoder.encode(voteAverage, forKey: "voteAverage")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(popularity, forKey: "popularity")
        aCoder.encode(posterPath, forKey: "posterPath")
        aCoder.encode(originalLanguage, forKey: "originalLanguage")
        aCoder.encode(originalTitle, forKey: "originalTitle")
        aCoder.encode(genreIDS, forKey: "genreIDS")
        aCoder.encode(backdropPath, forKey: "backdropPath")
        aCoder.encode(adult, forKey: "adult")
        aCoder.encode(overview, forKey: "overview")
        aCoder.encode(releaseDate, forKey: "releaseDate")
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

