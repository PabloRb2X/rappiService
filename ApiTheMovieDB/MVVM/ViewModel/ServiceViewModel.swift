//
//  ServiceViewModel.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

open class ServiceViewModel: ValidInputData {
    
    public var showLoading: (()->())?
    public var hideLoading: (()->())?
    
    public var onSuccessMoviesService:((_ response: MoviesResponse) -> ())?
    public var onSuccessDetailMovieService:((_ response: DetailMovieResponse) -> ())?
    public var onSuccessSearchMovieService:((_ response: SearchMovieResponse) -> ())?
    
    private let manager = ServiceManager()
    
    public override init() {}
    
    public func performMoviesService(typeMovies: String){
        self.showLoading?()
        
        manager.performMoviesService(typeMovies: typeMovies, completion: { ( _ error:
            ServiceError ,_ response: MoviesResponse?) in
            self.hideLoading?()
            
            if let response = response {
                
                self.onSuccessMoviesService?(response)
            }else {
                
                self.onServiceError?(error)
            }
        })
    }
    
    public func performDetailMovieService(idMovie: Int){
        
        self.showLoading?()
        
        manager.performDetailMovieService(idMovie: idMovie, completion: { ( _ error:
            ServiceError ,_ response: DetailMovieResponse?) in
            self.hideLoading?()
            
            if let response = response {
                
                self.onSuccessDetailMovieService?(response)
            }else {
                
                self.onServiceError?(error)
            }
        })
    }
    
    public func performSearchMovieService(movie: String){
        
        self.showLoading?()
        
        manager.performSearchMovieService(movie: movie, completion: { ( _ error:
            ServiceError ,_ response: SearchMovieResponse?) in
            self.hideLoading?()
            
            if let response = response {
                
                self.onSuccessSearchMovieService?(response)
            }else {
                
                self.onServiceError?(error)
            }
        })
    }
}
