//
//  FileListViewControllerUITests.swift
//  CSVReaderUITests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest
@testable import SimpleReader

class FileListViewControllerUITests: XCTestCase {

    private var robot: FileListRobot?
    private var tester: KIFUITestActor?

    override func setUp() {

        super.setUp()
        robot = FileListRobot(test: self)
        tester = robot?.tester
    }

    override func tearDown() {

        robot = nil
        super.tearDown()
    }

    func testShowFileListFromRuntime() {

        // Given
        let numberOfFiles = 3
        let section = 0

        // When
        robot?.presentFileListRoot()

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView) as? UITableView else {

            XCTFail("A tableView should be on screen.")
            return
        }

        XCTAssertTrue(tableView.numberOfRows(inSection: section) == numberOfFiles, "The tableView should have 3 row)")
    }

    func testShow1FileListMock() {

        // Given
        let numberOfFiles = 1
        let section = 0
        let viewModel = FileListMocks.list1FilesViewModel()

        // When
        robot?.presentFileListRoot(viewModel: viewModel)

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView) as? UITableView else {

            XCTFail("A tableView should be on screen.")
            return
        }

        XCTAssertTrue(tableView.numberOfRows(inSection: section) == numberOfFiles, "The tableView should have 1 row)")
    }

    func testShowEmptyFileListMock() {

        // Given
        let numberOfFiles = 0
        let section = 0
        let viewModel = FileListMocks.list0FilesViewModel()

        // When
        robot?.presentFileListRoot(viewModel: viewModel)

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView) as? UITableView else {

            XCTFail("A tableView should be on screen.")
            return
        }

        XCTAssertTrue(tableView.numberOfRows(inSection: section) == numberOfFiles, "The tableView should have 0 row)")
    }

    func testTableViewBackgroundColor() {

        // Given
        let viewModel = FileListMocks.list1FilesViewModel()
        let expectedColor = UIColor.appBlack

        // When
        robot?.presentFileListRoot(viewModel: viewModel)

        // Then
        guard let tableView = tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView) as? UITableView else {

            XCTFail("A tableView should be on screen.")
            return
        }

        XCTAssertEqual(tableView.backgroundColor, expectedColor, "The background color must be Black")
    }

    func testShow1CellLabelsMock() {

        // Given
        let viewModel = FileListMocks.list1FilesViewModel()

        // When
        robot?.presentFileListRoot(viewModel: viewModel)

        // Then
        guard let titleLabel = tester?.waitForView(withAccessibilityIdentifier: FileListTableViewCell.Accessibility.Identifier.titleLabel) as? UILabel,
        let typeLabel = tester?.waitForView(withAccessibilityIdentifier: FileListTableViewCell.Accessibility.Identifier.symbolLabel) as? UILabel,
        let pathLabel = tester?.waitForView(withAccessibilityIdentifier: FileListTableViewCell.Accessibility.Identifier.pathLabel) as? UILabel else {

            XCTFail("3 labels should be on screen.")
            return
        }

        XCTAssertEqual(titleLabel.text, viewModel.datasource.first?.name, "Label text should be the same as view model")
        XCTAssertEqual(typeLabel.text, viewModel.datasource.first?.type, "Label text should be the same as view model")
        XCTAssertEqual(pathLabel.text, viewModel.datasource.first?.path, "Label text should be the same as view model")
    }

    func testShowDetailForElementOneRuntime() {

        // Given
        let selectedElement = IndexPath(row: 0, section: 0)

        // When
        robot?.presentFileListRoot()

        // Then
        //Wait for tableView on screen
        tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
        //tap selected cell
        tester?.tapRow(at: selectedElement, inTableViewWithAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
        //wait for detail view on screen
        tester?.waitForView(withAccessibilityIdentifier: FileDetailView.Accessibility.Identifier.rootView)
    }

    func testShowDetailForElementOneMocked() {

        // Given
        let selectedElement = IndexPath(row: 0, section: 0)
        let viewModel = FileListMocks.list1FilesViewModel()

        // When
        robot?.presentFileListRoot(viewModel: viewModel)

        // Then
        //Wait for tableView on screen
        tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
        //tap selected cell
        tester?.tapRow(at: selectedElement, inTableViewWithAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
        //wait for detail view on screen
        tester?.waitForView(withAccessibilityIdentifier: FileDetailView.Accessibility.Identifier.rootView)
    }

    func testShowDetailAndComeBackRuntime() {

        // Given
        let selectedElement = IndexPath(row: 0, section: 0)

        // When
        robot?.presentFileListRoot()

        // Then
        //Wait for tableView on screen
        tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
        //tap selected cell
        tester?.tapRow(at: selectedElement, inTableViewWithAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
        //wait for detail view on screen
        tester?.waitForView(withAccessibilityIdentifier: FileDetailView.Accessibility.Identifier.rootView)
        //tap back button
        tester?.tapView(withAccessibilityIdentifier: FileDetailViewController.Accessibility.Identifier.backButton)
        //Wait for tableView on screen
        tester?.waitForView(withAccessibilityIdentifier: FileListView.Accessibility.Identifier.tableView)
    }
}

private class FileListRobot: Robot {

    @discardableResult func presentFileListRoot(viewModel: FileList.Retrieve.ViewModel) -> FileListRobot {

        let fileListVC = FileListViewController()
        fileListVC.interactor = FileListMocks.InteractorMock()
        fileListVC.displayFileList(viewModel: viewModel)

        pushRoot(viewController: fileListVC)

        return self
    }

    @discardableResult func presentFileListRoot() -> FileListRobot {

        let fileListVC = FileListViewController()
        pushRoot(viewController: fileListVC)

        return self
    }
}
