//
//  FileListPresenterTests.swift
//  CSVReaderTests
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

    func testCreateFileInfoComplete() {

        // Given
        let filePath = FileListMocks.filePath

        // When
        let file = sut.createFileInfo(file: filePath)

        // Then
        XCTAssertFalse(file.name.isEmpty, "File name should exist")
        XCTAssertFalse(file.type.isEmpty, "File type should exist")
        XCTAssertFalse(file.path.isEmpty, "File path should exist")
    }

    func testCreateFileInfoNoName() {

        // Given
        let filePath = FileListMocks.filePathNoName

        // When
        let file = sut.createFileInfo(file: filePath)

        // Then
        XCTAssertTrue(file.name.isEmpty, "File name should NOT exist")
        XCTAssertTrue(file.type.isEmpty, "File type should NOT exist")
        XCTAssertFalse(file.path.isEmpty, "File path should exist")
    }

    func testCreateFileInfoNoType() {

        // Given
        let filePath = FileListMocks.filePathNoType

        // When
        let file = sut.createFileInfo(file: filePath)

        // Then
        XCTAssertTrue(file.name.isEmpty, "File name should NOT exist")
        XCTAssertTrue(file.type.isEmpty, "File type should NOT exist")
        XCTAssertFalse(file.path.isEmpty, "File path should exist")
    }

    func testCreateFileInfoEmpty() {

        // Given
        let filePath = FileListMocks.filePathEmpty

        // When
        let file = sut.createFileInfo(file: filePath)

        // Then
        XCTAssertTrue(file.name.isEmpty, "File name should NOT exist")
        XCTAssertTrue(file.type.isEmpty, "File type should NOT exist")
        XCTAssertTrue(file.path.isEmpty, "File path should NOT exist")
    }

    func testArrayOfFiles() {

        // Given
        let filePathArray = FileListMocks.filePathArray

        // When
        let fileArray = sut.arrayOfFiles(files: filePathArray)

        // Then
        XCTAssertEqual(fileArray.count, filePathArray.count, "The number of items must be the same." )
    }

    func testArrayOfFilesEmpty() {

        // Given
        let filePathArray = FileListMocks.filePathArrayEmpty

        // When
        let fileArray = sut.arrayOfFiles(files: filePathArray)

        // Then
        XCTAssertEqual(fileArray.count, filePathArray.count, "The number of items must be the same.")
        XCTAssertEqual(fileArray.count, 0, "The number of items must be 0")
    }
}
