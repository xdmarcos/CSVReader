//
//  LoadFileListWorkerTests.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class LoadFileListWorkerTests: XCTestCase {

    // MARK: Subject under test
    var sut = LoadFileListWorker()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        sut = LoadFileListWorker()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Tests

    func testDoGetFileListStageBunle() {

        // Given
        let bundle = "Stage"
        let expectedNumberFiles = 3

        // When
        let fileList = sut.fileList(fromBundle: bundle)

        // Then
        XCTAssertFalse(fileList.isEmpty, "File list shouldn't be empty")
        XCTAssertEqual(fileList.count, expectedNumberFiles, "The number of files must be 3")
    }

    func testDoGetFileListProductionBundle() {

        // Given
        let bundle = "Production"
        let expectedNumberFiles = 3

        // When
        let fileList = sut.fileList(fromBundle: bundle)

        // Then
        XCTAssertFalse(fileList.isEmpty, "File list shouldn't be empty")
        XCTAssertEqual(fileList.count, expectedNumberFiles, "The number of files must be 3")
    }

    func testDoGetFileListEmptyBundle() {

        // Given
        let bundle = ""

        // When
        let fileList = sut.fileList(fromBundle: bundle)

        // Then
        XCTAssertTrue(fileList.isEmpty, "File list must be empty")
    }

    func testDoGetFileListWrongBundle() {

        // Given
        let bundle = "@"

        // When
        let fileList = sut.fileList(fromBundle: bundle)

        // Then
        XCTAssertTrue(fileList.isEmpty, "File list must be empty")
    }
}
