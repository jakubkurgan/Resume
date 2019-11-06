//
//  DatesTests.swift
//  ResumeTests
//
//  Created by Jakub Kurgan on 06/11/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import XCTest
@testable import Resume

class DatesTests: XCTestCase {

    func testDateToString() {
        // Given
        let expectation = XCTestExpectation(description: "toString")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                
                let educationStartDate = data.educations.first?.startDate
                
                XCTAssertEqual(educationStartDate?.toString(), "Oct 1995")
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testDateFormattedTimeRange() {
        // Given
        let expectation = XCTestExpectation(description: "timeRange")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                
                let educationStartDate = data.educations.first?.startDate
                let educationEndDate = data.educations.first?.endDate
                
                XCTAssertEqual(educationStartDate?.getFormattedTimeRange(to: educationEndDate), "Oct 1995 - Jun 2000")
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testDateFormattedTimePeriod() {
        // Given
        let expectation = XCTestExpectation(description: "timePeriod")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                
                let educationStartDate = data.educations.first?.startDate
                let educationEndDate = data.educations.first?.endDate
                
                XCTAssertEqual(educationStartDate?.getFormattedTimePeriod(to: educationEndDate), "4 Years 8 Months")
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testDateFormattedTimePeriodAndRange() {
        // Given
        let expectation = XCTestExpectation(description: "timePeriodAndRange")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                
                let educationStartDate = data.educations.first?.startDate
                let educationEndDate = data.educations.first?.endDate
                
                XCTAssertEqual(educationStartDate?.getFormattedTimePeriodAndRange(to: educationEndDate), "Oct 1995 - Jun 2000 · 4 Years 8 Months")
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
