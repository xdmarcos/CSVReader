//
//  FileDetailViewControllerUITests.swift
//  CSVReaderUITests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest
@testable import SimpleReader

class FileDetailViewControllerUITests: XCTestCase {

    private var robot: FileDetailRobot?
    private var tester: KIFUITestActor?

    override func setUp() {

        super.setUp()
        robot = FileDetailRobot(test: self)
        tester = robot?.tester
    }

    override func tearDown() {

        robot = nil
        super.tearDown()
    }

    func testShowDetailMock() {

        // Given
        let numberOfItems = 1
        let viewModel = FileDetailMocks.detail1ItemViewModel()

        // When
        robot?.presentFileDetailRoot(viewModel: viewModel)

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileDetailView
            .Accessibility.Identifier.tableView) as? UITableView else {

            XCTFail("A tableView should be on screen.")
            return
        }

        XCTAssertTrue(tableView.numberOfSections == numberOfItems, "The tableView should have 1 sections)")
    }

    func testShowDetail3ItemsMock() {

        // Given
        let numberOfItems = 3
        let viewModel = FileDetailMocks.detail3ItemsViewModel()

        // When
        robot?.presentFileDetailRoot(viewModel: viewModel)

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileDetailView
            .Accessibility.Identifier.tableView) as? UITableView else {

                XCTFail("A tableView should be on screen.")
                return
        }

        XCTAssertTrue(tableView.numberOfSections == numberOfItems, "The tableView should have 3 sections)")
    }

    func testShowDetailEmptyMock() {

        // Given
        let numberOfItems = 0
        let viewModel = FileDetailMocks.detail0ItemViewModel()

        // When
        robot?.presentFileDetailRoot(viewModel: viewModel)

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileDetailView
            .Accessibility.Identifier.tableView) as? UITableView else {

                XCTFail("A tableView should be on screen.")
                return
        }

        XCTAssertTrue(tableView.numberOfSections == numberOfItems, "The tableView should have 0 section)")
    }

    func testNameLabelTextColor() {

        // Given
        let viewModel = FileDetailMocks.detail1ItemViewModel()
        let expectedColor = UIColor.appWhite
        
        // When
        robot?.presentFileDetailRoot(viewModel: viewModel)

        // Then
        guard let nameLabel = tester?.waitForView(withAccessibilityIdentifier: FileDetailTableViewCell
            .Accessibility.Identifier.nameLabel) as? UILabel else {

                XCTFail("A label should be on screen.")
                return
        }

        XCTAssertEqual(nameLabel.textColor, expectedColor, "The label text color must be white")
    }
}

private class FileDetailRobot: Robot {

    @discardableResult func presentFileDetailRoot(viewModel: FileDetail.Data.ViewModel) -> FileDetailRobot {

        let fileListVC = FileDetailViewController()
        fileListVC.interactor = FileDetailMocks.InteractorMock()
        fileListVC.displayFileData(viewModel: viewModel)

        pushRoot(viewController: fileListVC)

        return self
    }

    @discardableResult func presentFileDetailRoot() -> FileDetailRobot {

        let fileListVC = FileDetailViewController()
        pushRoot(viewController: fileListVC)

        return self
    }
}
