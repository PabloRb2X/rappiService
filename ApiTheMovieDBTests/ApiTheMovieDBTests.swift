//
//  ApiTheMovieDBTests.swift
//  ApiTheMovieDBTests
//
//  Created by Pablo Ramirez on 6/13/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import XCTest
@testable import ApiTheMovieDB

class ApiTheMovieDBTests: XCTestCase {
    
    private var expectation: XCTestExpectation!
    private var serviceViewModel: ServiceViewModel = ServiceViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        expectation = self.expectation(description: "waitingResponse")
        self.showNHiddenLoading()
        self.errorCatalog()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMoviesService(){
        serviceViewModel.onSuccessMoviesService = {(_ response: MoviesResponse) -> Void in
            print(response)
            XCTAssert(true, "El servicio respondió correctamente")
            self.expectation.fulfill()
        }
        
        ///// puede ser upcoming, top_rated, popular
        serviceViewModel.performMoviesService(typeMovies: "popular")
        
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func testDetailMovieService(){
        serviceViewModel.onSuccessDetailMovieService = {(_ response: DetailMovieResponse) -> Void in
            print(response)
            XCTAssert(true, "El servicio respondió correctamente")
            self.expectation.fulfill()
        }
        
        serviceViewModel.performDetailMovieService(idMovie: 320288)
        
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func testSearchMovieService(){
        serviceViewModel.onSuccessSearchMovieService = {(_ response: SearchMovieResponse) -> Void in
            print(response)
            XCTAssert(true, "El servicio respondió correctamente")
            self.expectation.fulfill()
        }
        
        serviceViewModel.performSearchMovieService(movie: "Matrix")
        
        waitForExpectations(timeout: 60, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func showNHiddenLoading(){
        serviceViewModel.showLoading  = {()  -> Void in
            XCTAssert(true, "se comienza la carga")
        }
        serviceViewModel.hideLoading = {()  -> Void in
            XCTAssert(true, "se terminó la carga, se espera el retorno del objeto")
        }
    }
    
    func errorCatalog(){
        serviceViewModel.onFormatError = { (_ message: String) -> Void in
            XCTAssert(false, message)
            self.expectation.fulfill()
        }
        serviceViewModel.onServiceError  = {(_ error: ServiceError)  -> Void in
            XCTAssert(false, error.message)
            self.expectation.fulfill()
        }
    }

}
