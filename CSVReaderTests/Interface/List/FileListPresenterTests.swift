//
//  FileListPresenterTests.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileListPresenterTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileListPresenter()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        setupFileListPresenter()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Test setup
    func setupFileListPresenter() {

        sut = FileListPresenter()
    }

    // MARK: Test doubles
    class FileListDisplayLogicSpy: FileListDisplayLogic {

        var displayFileListCalled = false

        func displayFileList(viewModel: FileList.Retrieve.ViewModel) {

            displayFileListCalled = true
        }
    }

    // MARK: Tests
    func testPresent1FileSpy() {
        
        // Given
        let spy = FileListDisplayLogicSpy()
        sut.viewController = spy
        let response = FileListMocks.list1FilesResponse()

        // When
        sut.presentFileList(response: response)

        // Then
        XCTAssertTrue(spy.displayFileListCalled, "presentFileList(response:) should ask the view controller to display the result")
    }
}
