//
//  FileListInteractorTests.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileListInteractorTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileListInteractor()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        setupFileListInteractor()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Test setup
    func setupFileListInteractor() {

        sut = FileListInteractor()
    }

    // MARK: Test doubles

    class FileListPresentationLogicSpy: FileListPresentationLogic {

        var presentFileListCalled = false

        func presentFileList(response: FileList.Retrieve.Response) {

            presentFileListCalled = true
        }
    }

    // MARK: Tests
    func testRetrieveFileListSpy() {

        // Given
        let spy = FileListPresentationLogicSpy()
        sut.presenter = spy
        let request = FileList.Retrieve.Request()

        // When
        sut.tryRetrieveFileList(request: request)

        // Then
        XCTAssertTrue(spy.presentFileListCalled, "tryRetrieveFileList(request:) should ask the presenter to format the result")
    }
}
