//
//  ExtensionsTests.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class ExtensionsTests: XCTestCase {

    // MARK: Test lifecycle
    override func setUp() {

        super.setUp()
    }

    override func tearDown() {

        super.tearDown()
    }

    // MARK: Tests

    func testDateToString() {

        // Given
        let expectedString = "Oct 8, 1981"
        let date = "1981-10-08T00:00:00".toDate()

        // When
        let dateString = date?.toString()

        // Then
        XCTAssertNotNil(dateString, "The date string should NOT be nil")
        XCTAssertEqual(dateString, expectedString, "The date string should be the expectd")
    }

    func testDateToStringError() {

        // Given
        let date = "00:00".toDate()

        // When
        let dateString = date?.toString()

        // Then
        XCTAssertNil(dateString, "The date string should be nil")
    }

    func testStringToDate() {

        // Given
        let stringDate = "1981-10-08T00:00:00"

        // When
        let date = stringDate.toDate()

        // Then
        XCTAssertNotNil(date, "The date should NOT be nil")
    }

    func testStringToDateError() {

        // Given
        let stringDate = "00:00"

        // When
        let date = stringDate.toDate()

        // Then
        XCTAssertNil(date, "The date should be nil")
    }
}
