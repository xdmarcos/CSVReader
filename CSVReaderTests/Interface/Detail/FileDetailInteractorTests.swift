//
//  FileDetailInteractorTests.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileDetailInteractorTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileDetailInteractor()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        setupFileDetailInteractor()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Test setup
    func setupFileDetailInteractor() {

        sut = FileDetailInteractor()
    }

    // MARK: Test doubles

    class FileDetailPresentationLogicSpy: FileDetailPresentationLogic {

        var presentFileDataCalled = false

        func presentFileData(response: FileDetail.Data.Response) {

            presentFileDataCalled = true
        }
    }

    // MARK: Tests
    func testTryGetFileDataSpy() {

        // Given
        let spy = FileDetailPresentationLogicSpy()
        sut.presenter = spy
        let request = FileDetail.Data.Request()

        // When
        sut.tryGetFileData(request: request)

        // Then
        XCTAssertTrue(spy.presentFileDataCalled, "tryGetFileData(request:) should ask the presenter to format the result")
    }
}
