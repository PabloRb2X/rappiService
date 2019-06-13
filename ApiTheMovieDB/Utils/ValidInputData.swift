//
//  ValidInpoutData.swift
//  ApiTheMovieDB
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

open class ValidInputData {
    
    public var onFormatError: ((_ message: String)->())?
    public var onServiceError: ((_ error: ServiceError)->())?
    
    public init() {}
    
    ////////////////// Aquí se hacen las validaciones para cada servicio
    public func validinputParameters() -> Bool {
        
        return true
    }
}

open class ServiceError {
    
    public var httpCode = 0
    public var exception = ""
    public var message = ""
    public var cveDiagnostic = ""
    
    public init() { }
    
    public init(httpCode:Int , exception:String, message:String, cveDiagnostic:String) {
        self.httpCode = httpCode
        self.exception = exception
        if  self.httpCode >= 500 && self.httpCode < 600 {
            self.message = "Ocurrió una intermitencia con el servicio, por favor vuelve a intentar."
        }
        else {
            self.message = message
        }
        self.cveDiagnostic = cveDiagnostic
    }
}
