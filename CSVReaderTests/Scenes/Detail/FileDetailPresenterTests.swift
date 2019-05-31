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
        XCTAssertFalse(issues.isEmpty, "Issues should NOT be empty")
    }

    func testCreateIssueDataEmpty() {

        // Given
        let data = FileDetailFixtures().fileEmpty()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertTrue(issues.isEmpty, "Issues should be empty")
    }

    func testCreateIssueDataHeadersOnly() {

        // Given
        let data = FileDetailFixtures().fileHeaderOnly()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        XCTAssertTrue(issues.isEmpty, "Issues should be empty")
    }

    func testCreateIssueDataMoreColumns() {

        // Given
        let data = FileDetailFixtures().fileMoreColumns()

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        guard let issue = issues.first else {
            XCTFail("There must exist at least one issue")
            return
        }

        XCTAssertFalse(issues.isEmpty, "Issues should NOT be empty")
        XCTAssertFalse(issue.name.isEmpty, "Name should NOT be empty")
        XCTAssertFalse(issue.surname.isEmpty, "Surname should NOT be empty")
        XCTAssertFalse(issue.count.isEmpty, "Count should NOT be empty")
        XCTAssertNotNil(issue.dob, "Date of birth should NOT be nil")
    }

    func testCreateIssueLessColumns1() {

        // Given
        let numberColumns = 1
        let data = FileDetailFixtures().fileLessColumns(number: numberColumns)

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        guard let issue = issues.first else {
            XCTFail("There must exist at least one issue")
            return
        }

        XCTAssertFalse(issues.isEmpty, "Issues should NOT be empty")
        XCTAssertFalse(issue.name.isEmpty, "Name should NOT be empty")
        XCTAssertTrue(issue.surname.isEmpty, "Surname should be empty")
        XCTAssertTrue(issue.count.isEmpty, "Count should be empty")
        XCTAssertNil(issue.dob, "Date of birth should be nil")
    }

    func testCreateIssueLessColumns2() {

        // Given
        let numberColumns = 2
        let data = FileDetailFixtures().fileLessColumns(number: numberColumns)

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        guard let issue = issues.first else {
            XCTFail("There must exist at least one issue")
            return
        }

        XCTAssertFalse(issues.isEmpty, "Issues should NOT be empty")
        XCTAssertFalse(issue.name.isEmpty, "Name should NOT be empty")
        XCTAssertFalse(issue.surname.isEmpty, "Surname should NOT be empty")
        XCTAssertTrue(issue.count.isEmpty, "Count should be empty")
        XCTAssertNil(issue.dob, "Date of birth should be nil")
    }

    func testCreateIssueLessColumns3() {

        // Given
        let numberColumns = 3
        let data = FileDetailFixtures().fileLessColumns(number: numberColumns)

        // When
        let issues = sut.createIssueData(data: data)

        // Then
        guard let issue = issues.first else {
            XCTFail("There must exist at least one issue")
            return
        }

        XCTAssertFalse(issues.isEmpty, "Issues should NOT be empty")
        XCTAssertFalse(issue.name.isEmpty, "Name should NOT be empty")
        XCTAssertFalse(issue.surname.isEmpty, "Surname should NOT be empty")
        XCTAssertFalse(issue.count.isEmpty, "Count should NOT be empty")
        XCTAssertNil(issue.dob, "Date of birth should be nil")
    }

    func testCreateScreenTitle() {

        // Given
        let pathURL = FileDetailMocks.filePath

        // When
        let title = sut.createScreenTitle(title: pathURL)

        // Then
        XCTAssertFalse(title.isEmpty, "Title should NOT be empty")
    }

    func testCreateScreenTitleEmpty() {

        // Given
        let pathURL = FileDetailMocks.filePathEmpty

        // When
        let title = sut.createScreenTitle(title: pathURL)

        // Then
        XCTAssertTrue(title.isEmpty, "Title should be empty")
    }

    func testCreateHeaderFields() {

        // Given
        let data = FileDetailFixtures().fileComplete()
        let expectedHeaders = 4

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertFalse(headers.isEmpty, "Headers should NOT be empty")
        XCTAssertEqual(headers.count, expectedHeaders, "Headers must be 4")
    }

    func testCreateHeaderFieldsEmpty() {

        // Given
        let data = FileDetailFixtures().fileEmpty()

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertTrue(headers.isEmpty, "Headers should be empty")
    }

    func testCreateHeaderFieldsHeaderOnly() {

        // Given
        let data = FileDetailFixtures().fileHeaderOnly()
        let expectedHeaders = 4

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertFalse(headers.isEmpty, "Headers should NOT be empty")
        XCTAssertEqual(headers.count, expectedHeaders, "Headers must be 4")
    }

    func testCreateHeaderFieldsMore() {

        // Given
        let data = FileDetailFixtures().fileMoreColumns()
        let expectedHeaders = 4

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertFalse(headers.isEmpty, "Headers should NOT be empty")
        XCTAssertEqual(headers.count, expectedHeaders, "Headers must be 4")
    }

    func testCreateHeaderFieldsLess1() {

        // Given
        let expectedHeaders = 1
        let data = FileDetailFixtures().fileLessColumns(number: expectedHeaders)

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertFalse(headers.isEmpty, "Headers should NOT be empty")
        XCTAssertEqual(headers.count, expectedHeaders, "Headers must be 1")
    }

    func testCreateHeaderFieldsLess2() {

        // Given
        let expectedHeaders = 2
        let data = FileDetailFixtures().fileLessColumns(number: expectedHeaders)

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertFalse(headers.isEmpty, "Headers should NOT be empty")
        XCTAssertEqual(headers.count, expectedHeaders, "Headers must be 2")
    }

    func testCreateHeaderFieldsLess3() {

        // Given
        let expectedHeaders = 3
        let data = FileDetailFixtures().fileLessColumns(number: expectedHeaders)

        // When
        let headers = sut.createHeaderFields(data: data)

        // Then
        XCTAssertFalse(headers.isEmpty, "Headers should NOT be empty")
        XCTAssertEqual(headers.count, expectedHeaders, "Headers must be 3")
    }
}
