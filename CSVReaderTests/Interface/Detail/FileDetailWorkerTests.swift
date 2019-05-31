//
//  FileDetailWorkerTests.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileDetailWorkerTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileDetailWorker()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        setupFileDetailWorker()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Test setup
    func setupFileDetailWorker() {

        sut = FileDetailWorker()
    }

    // MARK: Test doubles

    // MARK: Tests

    func testSomething() {
        // Given
        
        // When
        
        // Then
    }
}
