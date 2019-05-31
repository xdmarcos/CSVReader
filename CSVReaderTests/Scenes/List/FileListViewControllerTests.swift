//
//  FileListViewControllerTests.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileListViewControllerTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileListViewController()
    var window: UIWindow?

    // MARK: Test setup
    override func setUp() {

        super.setUp()
        window = UIWindow()
    }

    override func tearDown() {

        window = nil
        super.tearDown()
    }

    // MARK: Test lifecycle
    func loadView() {

        guard let view = sut.view else {
            return
        }

        window?.addSubview(view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Test doubles
    class FileListBusinessLogicSpy: FileListBusinessLogic {

        var tryRetrieveFileListCalled = false

        func tryRetrieveFileList(request: FileList.Retrieve.Request) {

            tryRetrieveFileListCalled = true
        }
    }

    class FileListRoutingLogicSpy: FileListRoutingLogic & FileListDataPassing {

        var dataStore: FileListDataStore?

        var navigateToDetailViewCalled = false

        func navigateToDetailView(index: Int) {

            navigateToDetailViewCalled = true
        }
    }

    // MARK: Tests
    func testShouldRetrieveListWhenViewIsLoaded() {

        // Given
        let spy = FileListBusinessLogicSpy()
        sut.interactor = spy

        // When
        loadView()

        // Then
        XCTAssertTrue(spy.tryRetrieveFileListCalled, "viewDidLoad() should ask the interactor to RetrieveFileList")
    }

    func testDisplay0FileList() {

        // Given
        let viewModel = FileListMocks.list0FilesViewModel()
        let expectedRows = 0

        // When
        loadView()
        sut.displayFileList(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfRows(inSection: 0), expectedRows, "displayFileList(viewModel:) should update the tableView number of rows")
    }

    func testDisplay1FileList() {

        // Given
        let viewModel = FileListMocks.list1FilesViewModel()
        let expectedRows = 1

        // When
        loadView()
        sut.displayFileList(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfRows(inSection: 0), expectedRows, "displayFileList(viewModel:) should update the tableView number of rows")
    }

    func testDisplay2FileList() {

        // Given
        let viewModel = FileListMocks.list2FilesViewModel()
        let expectedRows = 2

        // When
        loadView()
        sut.displayFileList(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfRows(inSection: 0), expectedRows, "displayFileList(viewModel:) should update the tableView number of rows")
    }

    func testDisplay3FileList() {

        // Given
        let viewModel = FileListMocks.list3FilesViewModel()
        let expectedRows = 3

        // When
        loadView()
        sut.displayFileList(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfRows(inSection: 0), expectedRows, "displayFileList(viewModel:) should update the tableView number of rows")
    }

    func testNavigateToDetailScreenSpy() {

        // Given
        let spy = FileListRoutingLogicSpy()
        sut.router = spy
        let selectedIndex = 0
        
        // When
        loadView()
        sut.prepareForDetailScreen(selectedIndex: selectedIndex)

        // Then
        XCTAssertTrue(spy.navigateToDetailViewCalled, "prepareForDetailScreen() should ask the router to navigate to next scene.")
    }
}
