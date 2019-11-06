//
//  ProfileServiceTests.swift
//  ResumeTests
//
//  Created by Jakub Kurgan on 06/11/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import XCTest
@testable import Resume

class ProfileServiceTests: XCTestCase {
    
    func testProfileServiceSucceedRequest() {
        // Given
        let expectation = XCTestExpectation(description: "succeed")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssert(true, "\(data)")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testFirstName() {
        // Given
        let expectation = XCTestExpectation(description: "firstName")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssertEqual(data.general.firstName, "John")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testEducations() {
        // Given
        let expectation = XCTestExpectation(description: "educations")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssert(!data.educations.isEmpty, "Educations shouldn't be empty")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testExperiences() {
        // Given
        let expectation = XCTestExpectation(description: "experiences")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssert(!data.experiences.isEmpty, "Experiences shouldn't be empty")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testSkills() {
        // Given
        let skill = Skill(name: "Swift")
        let expectation = XCTestExpectation(description: "skills")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssert(data.skills.contains(skill), "Skills should contains \(skill.name)")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testEducationsEndDate() {
        // Given
        let expectation = XCTestExpectation(description: "educations")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssertNotNil(data.educations.first?.endDate)
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testExperiencesEndDate() {
        // Given
        let expectation = XCTestExpectation(description: "experiences")
        
        // When
        ProfileService.getProfile { (result) in
            //Then
            switch result {
            case .success(let data):
                XCTAssertNil(data.experiences.first?.endDate)
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
