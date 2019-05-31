//
//  FileDetailMocks.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

@testable import SimpleReader
import XCTest

struct FileDetailMocks {

    static func detail0FilesViewModel() -> FileDetail.Data.ViewModel {

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [Issue]()
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail1FilesViewModel() -> FileDetail.Data.ViewModel {

        let file1 = Issue(name: "name11", surname: "surname11", count: "11", dob: Date())

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [file1]
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail2FilesViewModel() -> FileDetail.Data.ViewModel {

        let file1 = Issue(name: "name21", surname: "surname21", count: "21", dob: Date())
        let file2 = Issue(name: "name22", surname: "surname22", count: "22", dob: Date())

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [file1, file2]
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail3FilesViewModel() -> FileDetail.Data.ViewModel {

        let file1 = Issue(name: "name31", surname: "surname31", count: "31", dob: Date())
        let file2 = Issue(name: "name32", surname: "surname32", count: "32", dob: Date())
        let file3 = Issue(name: "name33", surname: "surname33", count: "33", dob: Date())

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [file1, file2, file3]
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail0FilesResponse() -> FileDetail.Data.Response {

        let data = [[String]]()
        return FileDetail.Data.Response(title: "Detail Title",
                                        data: data)
    }

    static func detail1FilesResponse() -> FileDetail.Data.Response {

        let fileContent1 = ["name11", "surname11", "11", "1/1/11"]
        let data = [fileContent1]

        return FileDetail.Data.Response(title: "Detail Title 1",
                                        data: data)
    }

    static func detail2FilesResponse() -> FileDetail.Data.Response {

        let fileContent1 = ["name21", "surname21", "21", "2/1/21"]
        let fileContent2 = ["name22", "surname22", "22", "2/2/22"]
        let data = [fileContent1, fileContent2]

        return FileDetail.Data.Response(title: "Detail Title 2",
                                        data: data)
    }

    static func detail3FilesResponse() -> FileDetail.Data.Response {

        let fileContent1 = ["name31", "surname31", "31", "3/1/31"]
        let fileContent2 = ["name32", "surname32", "32", "3/2/32"]
        let fileContent3 = ["name33", "surname33", "33", "3/3/33"]
        let data = [fileContent1, fileContent2, fileContent3]

        return FileDetail.Data.Response(title: "Detail Title 3",
                                        data: data)
    }

    // MARK: Worker
    class FileDetailWorkerMock: FileDetailWorker {

        override func doGetDataFromFile(file: String) -> [[String]] {

            let fileContent1 = ["name31", "surname31", "31", "3/1/31"]
            let fileContent2 = ["name32", "surname32", "32", "3/2/32"]
            let fileContent3 = ["name33", "surname33", "33", "3/3/33"]
            let data = [fileContent1, fileContent2, fileContent3]
            return data
        }
    }

    class FileDetailWorkerEmptyMock: FileDetailWorker {

        override func doGetDataFromFile(file: String) -> [[String]] {

            return []
        }
    }

    // MARK: LoadFileDataWorker
    class DetailDataWorker: LoadFileDataWorkerAlias {

        func dataFromLile(file: String) -> [[String]] {

            let fileContent1 = ["name31", "surname31", "31", "3/1/31"]
            let fileContent2 = ["name32", "surname32", "32", "3/2/32"]
            let fileContent3 = ["name33", "surname33", "33", "3/3/33"]
            let data = [fileContent1, fileContent2, fileContent3]
            return data
        }
    }

    class DetailDataWorkerEmpty: LoadFileDataWorkerAlias {

        func dataFromLile(file: String) -> [[String]] {

            return []
        }
    }
}

class FileDetailFixtures: XCTestCase {

    func fileComplete() -> [[String]] {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues.csv"
        }

        guard let file = path.first else { return [] }

        return loadFixtureFileData(fromFile: file)
    }

    func fileMoreColumns() -> [[String]] {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues_more_columns.csv"
        }

        guard let file = path.first else { return [] }

        return loadFixtureFileData(fromFile: file)
    }

    func fileLessColumns() -> [[String]] {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues_less_columns.csv"
        }

        guard let file = path.first else { return [] }

        return loadFixtureFileData(fromFile: file)
    }

    func fileHeaderOnly() -> [[String]] {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues_header_only.csv"
        }

        guard let file = path.first else { return [] }

        return loadFixtureFileData(fromFile: file)
    }

    func fileEmpty() -> [[String]] {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues_empty.csv"
        }

        guard let file = path.first else { return [] }

        return loadFixtureFileData(fromFile: file)
    }
}
