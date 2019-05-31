//
//  FileDetailWorkerTests.swift
//  CSVReaderTests
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

    // MARK: Tests

    func testDoGetDataFromFile() {

        // Given
        let dataWorker = FileDetailMocks.DetailDataWorker()
        let file = "any"
        sut.dataWorker = dataWorker

        // When
        let data = sut.doGetDataFromFile(file: file)
        // Then
        XCTAssertNotNil(data, "File list shouldn't be nil")
        XCTAssert(data.isEmpty == false, "The list must contain files")
    }

    func testDoGetDataFromFileEmpty() {

        // Given
        let dataWorker = FileDetailMocks.DetailDataWorkerEmpty()
        let file = "any"
        sut.dataWorker = dataWorker

        // When
        let data = sut.doGetDataFromFile(file: file)
        // Then
        XCTAssertNotNil(data, "File list shouldn't be nil")
        XCTAssert(data.isEmpty == true, "The list must contain files")
    }
}
