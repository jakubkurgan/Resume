//
//  HttpClientTests.swift
//  ResumeTests
//
//  Created by Jakub Kurgan on 06/11/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import XCTest
@testable import Resume

class HttpClientTests: XCTestCase {

    func testHttpClientFailedRequest() {
        // Given
        let path: String = ".com"
        
        let expectation = XCTestExpectation(description: "wrongData")
        let httpClient = HttpClient()
        
        // When
        httpClient.request(path: path) { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTFail("Unespected data appeared \(data.description)")
            case .failure(let error):
                XCTAssert(true, "\(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testHttpClientSucceedRequest() {
        // Given
        let path: String = "c93e13915d1d620447dc6c380c504a46/raw/148b684fbc32b79568f1a61fb65a57415f9e2879/fake-resume"
        
        let expectation = XCTestExpectation(description: "succeed")
        let httpClient = HttpClient()
        
        // When
        httpClient.request(path: path) { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssert(true, "\(data.description)")
            case .failure(let error):
            XCTFail("Unespected error appeared \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
