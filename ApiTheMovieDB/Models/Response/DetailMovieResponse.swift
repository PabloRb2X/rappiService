//
//  DetailMovieResponse.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - Welcome
open class DetailMovieResponse: Mappable {
    public var adult: Bool = false
    public var backdropPath: String = ""
    public var belongsToCollection: String = "" ////
    public var budget: Int = 0
    public var genres: [Genre] = []
    public var homepage: String = "" ////
    public var id: Int = 0
    public var imdbID: String = ""
    public var originalLanguage: String = ""
    public var originalTitle: String = ""
    public var overview: String = ""
    public var popularity: Double = 0.0
    public var posterPath: String = ""
    public var productionCompanies: [ProductionCompany] = []
    public var productionCountries: [ProductionCountry] = []
    public var releaseDate: String = ""
    public var revenue: Int = 0
    public var runtime: Int = 0
    public var spokenLanguages: [SpokenLanguage] = []
    public var status: String = ""
    public var tagline: String = ""
    public var title: String = ""
    public var video: Bool = false
    public var voteAverage: Double = 0.0
    public var voteCount: Int = 0
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    open func mapping(map: Map) {
        
        adult <- map[CodingKeys.adult.rawValue]
        backdropPath <- map[CodingKeys.backdropPath.rawValue]
        belongsToCollection <- map[CodingKeys.belongsToCollection.rawValue]
        budget <- map[CodingKeys.budget.rawValue]
        genres <- map[CodingKeys.genres.rawValue]
        homepage <- map[CodingKeys.homepage.rawValue]
        id <- map[CodingKeys.id.rawValue]
        imdbID <- map[CodingKeys.imdbID.rawValue]
        originalLanguage <- map[CodingKeys.originalLanguage.rawValue]
        originalTitle <- map[CodingKeys.originalTitle.rawValue]
        overview <- map[CodingKeys.overview.rawValue]
        popularity <- map[CodingKeys.popularity.rawValue]
        posterPath <- map[CodingKeys.posterPath.rawValue]
        productionCompanies <- map[CodingKeys.productionCompanies.rawValue]
        productionCountries <- map[CodingKeys.productionCountries.rawValue]
        releaseDate <- map[CodingKeys.releaseDate.rawValue]
        revenue <- map[CodingKeys.revenue.rawValue]
        runtime <- map[CodingKeys.runtime.rawValue]
        spokenLanguages <- map[CodingKeys.spokenLanguages.rawValue]
        status <- map[CodingKeys.status.rawValue]
        tagline <- map[CodingKeys.tagline.rawValue]
        title <- map[CodingKeys.title.rawValue]
        video <- map[CodingKeys.video.rawValue]
        voteAverage <- map[CodingKeys.voteAverage.rawValue]
        voteCount <- map[CodingKeys.voteCount.rawValue]
    }
}

// MARK: - Genre
open class Genre: Mappable {
    public var id: Int = 0
    public var name: String = ""
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    open func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

// MARK: - ProductionCompany
open class ProductionCompany: Mappable {
    public var id: Int = 0
    public var logoPath: String = ""
    public var name: String = ""
    public var originCountry: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    open func mapping(map: Map) {
        id <- map[CodingKeys.id.rawValue]
        logoPath <- map[CodingKeys.logoPath.rawValue]
        name <- map[CodingKeys.name.rawValue]
        originCountry <- map[CodingKeys.originCountry.rawValue]
    }
}

// MARK: - ProductionCountry
open class ProductionCountry: Mappable {
    public var iso3166_1: String = ""
    public var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    open func mapping(map: Map) {
        iso3166_1 <- map[CodingKeys.iso3166_1.rawValue]
        name <- map[CodingKeys.name.rawValue]
    }
}

// MARK: - SpokenLanguage
open class SpokenLanguage: Mappable {
    public var iso639_1: String = ""
    public var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case name
    }
    
    public init() {}
    
    required public init?(map: Map){
    }
    
    open func mapping(map: Map) {
        iso639_1 <- map[CodingKeys.iso639_1.rawValue]
        name <- map[CodingKeys.name.rawValue]
    }
}
