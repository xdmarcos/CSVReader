//
//  FileDetailViewControllerTests.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

@testable import SimpleReader

class FileDetailViewControllerTests: XCTestCase {

    // MARK: Subject under test
    var sut = FileDetailViewController()
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
    class FileDetailBusinessLogicSpy: FileDetailBusinessLogic {

        var tryGetFileDataCalled = false

        func tryGetFileData(request: FileDetail.Data.Request) {

            tryGetFileDataCalled = true
        }
    }

    class FileDetailRoutingLogicSpy: FileDetailRoutingLogic & FileDetailDataPassing {

        var dataStore: FileDetailDataStore?
        var navigateBackCalled = false

        func navigateBack() {
            navigateBackCalled = true
        }
    }

    // MARK: Tests
    func testShouldDoSomethingWhenViewIsLoaded() {

        // Given
        let spy = FileDetailBusinessLogicSpy()
        sut.interactor = spy

        // When
        loadView()

        // Then
        XCTAssertTrue(spy.tryGetFileDataCalled, "viewDidLoad() should ask the interactor to do something")
    }

    func testDisplay0FileData() {

        // Given
        let viewModel = FileDetailMocks.detail0FilesViewModel()
        let expectedSections = 0

        // When
        loadView()
        sut.displayFileData(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfSections, expectedSections, "displayFileData(viewModel:) should update the number of sections")
    }

    func testDisplay1FileData() {

        // Given
        let viewModel = FileDetailMocks.detail1FilesViewModel()
        let expectedSections = 1

        // When
        loadView()
        sut.displayFileData(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfSections, expectedSections, "displayFileData(viewModel:) should update the number of sections")
    }

    func testDisplay2FileData() {

        // Given
        let viewModel = FileDetailMocks.detail2FilesViewModel()
        let expectedSections = 2

        // When
        loadView()
        sut.displayFileData(viewModel: viewModel)

        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfSections, expectedSections, "displayFileData(viewModel:) should update the number of sections")
    }

    func testDisplay3FileData() {

        // Given
        let viewModel = FileDetailMocks.detail3FilesViewModel()
        let expectedSections = 3

        // When
        loadView()
        sut.displayFileData(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(sut.sceneView.tableView.numberOfSections, expectedSections, "displayFileData(viewModel:) should update the number of sections")
    }

    func testNavigateBackSpy() {

        // Given
        let spy = FileDetailRoutingLogicSpy()
        sut.router = spy

        // When
        loadView()
        sut.goBack()

        // Then
        XCTAssertTrue(spy.navigateBackCalled, "prepareForGoBack() should ask the router to navigate to next scene.")
    }
}
