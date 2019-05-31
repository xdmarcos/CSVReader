//
//  FileListWorkerTests.swift
//  CSVReader
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

    // MARK: Test doubles

    // MARK: Tests

    func testSomething() {
        // Given
        
        // When
        
        // Then
    }
}
