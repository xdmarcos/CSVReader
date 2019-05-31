//
//  FileDetailPresenterTests.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileDetailPresenterTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileDetailPresenter()

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
        setupFileDetailPresenter()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Test setup
    func setupFileDetailPresenter() {

        sut = FileDetailPresenter()
    }

    // MARK: Test doubles
    class FileDetailDisplayLogicSpy: FileDetailDisplayLogic {

        var displayFileDataCalled = false

        func displayFileData(viewModel: FileDetail.Data.ViewModel) {

            displayFileDataCalled = true
        }
    }

    // MARK: Tests
    func testPresent1FileDataSpy() {
        
        // Given
        let spy = FileDetailDisplayLogicSpy()
        sut.viewController = spy
        let response = FileDetailMocks.detail1FilesResponse()

        // When
        sut.presentFileData(response: response)

        // Then
        XCTAssertTrue(spy.displayFileDataCalled, "presentSomething(response:) should ask the view controller to display the result")
    }

    func testCreateIssueDataComplete() {

        // Given
        let data = FileDetailFixtures().fileComplete()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertFalse(issues.isEmpty, "Issues shouln NOT be empty")
    }

    func testCreateIssueDataEmpty() {

        // Given
        let data = FileDetailFixtures().fileComplete()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertFalse(issues.isEmpty, "Issues shouln NOT be empty")
    }

    func testCreateIssueDataHeadersOnly() {

        // Given
        let data = FileDetailFixtures().fileComplete()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertFalse(issues.isEmpty, "Issues shouln NOT be empty")
    }

    func testCreateIssueDataMoreColumns() {

        // Given
        let data = FileDetailFixtures().fileComplete()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertFalse(issues.isEmpty, "Issues shouln NOT be empty")
    }

    func testCreateIssueLessColumns() {

        // Given
        let data = FileDetailFixtures().fileComplete()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertFalse(issues.isEmpty, "Issues shouln NOT be empty")
    }
}
