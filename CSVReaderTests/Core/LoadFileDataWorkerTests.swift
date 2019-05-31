//
//  LoadFileDataWorkerTests.swift
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class LoadFileDataWorkerTests: XCTestCase {

    // MARK: Subject under test
    var sut = LoadFileDataWorker()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        sut = LoadFileDataWorker()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Tests

    func testDataFromFileComplete() {

        // Given
        let file = LoadWorkerMocks().fileComplete()
        let expectedNumberFiles = 6

        // When
        let data = sut.dataFromFile(file: file)

        // Then
        XCTAssertFalse(data.isEmpty, "File data should NOT be empty")
        XCTAssertEqual(data.count, expectedNumberFiles, "The number of files must be 6")
    }

    func testDataFromFileEmpty() {

        // Given
        let file = LoadWorkerMocks().fileEmpty()

        // When
        let data = sut.dataFromFile(file: file)

        // Then
        XCTAssertTrue(data.isEmpty, "File data should be empty")
    }
}
