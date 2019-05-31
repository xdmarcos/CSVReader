//
//  FileListWorkerTests.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileListWorkerTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileListWorker()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        setupFileListWorker()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Test setup
    func setupFileListWorker() {

        sut = FileListWorker()
    }

    // MARK: Tests

    func testDoGetFileList() {

        // Given
        let loadWorker = FileListMocks.LoadFileListWorker()
        let bundle = "any"
        sut.loadFileListWorker = loadWorker

        // When
        let list = sut.doGetFileList(fromBundle: bundle)
        
        // Then
        XCTAssertNotNil(list, "File list shouldn't be nil")
        XCTAssert(list.isEmpty == false, "The list must contain files")
    }

    func testDoGetFileListEmpty() {

        // Given
        let loadWorker = FileListMocks.LoadFileListWorkerEmpty()
        let bundle = "any"
        sut.loadFileListWorker = loadWorker

        // When
        let list = sut.doGetFileList(fromBundle: bundle)

        // Then
        XCTAssertNotNil(list, "File list shouldn't be nil")
        XCTAssert(list.isEmpty == true, "The list must contain files")
    }
}
