//
//  ServiceManager.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

open class ServiceManager {
    
    private let apiKey = "5e83b05e73d911e56f4628169436b5cb"
    private let baseAPIURL = "https://api.themoviedb.org/3/movie/"
    
    internal func performMoviesService(typeMovies: String, completion: @escaping (_ error:
        ServiceError, _ responseModel: MoviesResponse?) -> Void) {
        
        let urlrequest = "\(baseAPIURL)\(typeMovies)?api_key=\(apiKey)&language=en-US"
        
        //let model = DetailMovieRequest(apikey: apiKey, idMovie: idMovie, language: "en-US")
        let body = ""//Mapper().toJSONString(model) ?? ""
        
        ServerUtils.defaultManager.request(ServerUtils.createRequest(urlString: urlrequest, body: body)).responseJSON { (response) in
            
            print(response.result.value ?? "")
            var serviceError = ServiceError()
            
            if let error = response.result.error as? AFError {
                serviceError = ServiceError(httpCode: response.response?.statusCode ?? 0, exception:error.localizedDescription, message:error.errorDescription ?? "", cveDiagnostic: "")
            }
            
            if response.result.isSuccess {
                if let value = response.result.value as? [String : Any] {
                    if let resp = Mapper<MoviesResponse>().map(JSON: value) {
                        
                        completion(serviceError, resp)
                    }
                    else {
                        serviceError.message = "Ocurrio un error al convertir JSON"
                        completion(serviceError , nil)
                    }
                }
            }
            else {
                completion(serviceError, nil)
            }
            
        }
    }
    
    internal func performDetailMovieService(idMovie: Int, completion: @escaping (_ error:
        ServiceError, _ responseModel: DetailMovieResponse?) -> Void) {
        
        let urlrequest = "\(baseAPIURL)\(idMovie)?api_key=\(apiKey)&language=en-US"
        
        //let model = DetailMovieRequest(apikey: apiKey, idMovie: idMovie, language: "en-US")
        let body = ""//Mapper().toJSONString(model) ?? ""
        
        ServerUtils.defaultManager.request(ServerUtils.createRequest(urlString: urlrequest, body: body)).responseJSON { (response) in
            
            print(response.result.value ?? "")
            var serviceError = ServiceError()
            
            if let error = response.result.error as? AFError {
                serviceError = ServiceError(httpCode: response.response?.statusCode ?? 0, exception:error.localizedDescription, message:error.errorDescription ?? "", cveDiagnostic: "")
            }
            
            if response.result.isSuccess {
                if let value = response.result.value as? [String : Any] {
                    if let resp = Mapper<DetailMovieResponse>().map(JSON: value) {
                        
                        completion(serviceError, resp)
                    }
                    else {
                        serviceError.message = "Ocurrio un error al convertir JSON"
                        completion(serviceError , nil)
                    }
                }
            }
            else {
                completion(serviceError, nil)
            }
            
        }
    }
    
    internal func performSearchMovieService(movie: String, completion: @escaping (_ error:
        ServiceError, _ responseModel: SearchMovieResponse?) -> Void) {
        
        let urlrequest = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(movie)&page=1&include_adult=false"
        
        //let model = DetailMovieRequest(apikey: apiKey, idMovie: idMovie, language: "en-US")
        let body = ""//Mapper().toJSONString(model) ?? ""
        
        ServerUtils.defaultManager.request(ServerUtils.createRequest(urlString: urlrequest, body: body)).responseJSON { (response) in
            
            print(response.result.value ?? "")
            var serviceError = ServiceError()
            
            if let error = response.result.error as? AFError {
                serviceError = ServiceError(httpCode: response.response?.statusCode ?? 0, exception:error.localizedDescription, message:error.errorDescription ?? "", cveDiagnostic: "")
            }
            
            if response.result.isSuccess {
                if let value = response.result.value as? [String : Any] {
                    if let resp = Mapper<SearchMovieResponse>().map(JSON: value) {
                        
                        completion(serviceError, resp)
                    }
                    else {
                        serviceError.message = "Ocurrio un error al convertir JSON"
                        completion(serviceError , nil)
                    }
                }
            }
            else {
                completion(serviceError, nil)
            }
            
        }
    }
    
}
