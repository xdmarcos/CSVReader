//
//  FileListMocks.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

@testable import SimpleReader

struct FileListMocks {

    static let filePath = "Library/Developer/CoreSimulator/Devices/data/Containers/Bundle/Application/SimpleReader.app/issues.csv"
    static let filePathNoName = "Library/Developer/CoreSimulator/Devices/data/Containers/Bundle/Application"
    static let filePathNoType = "Library/Developer/CoreSimulator/Devices/data/Containers/Bundle/Application/SimpleReader.app/issues"
    static let filePathEmpty = ""

    static let filePathArray = [filePath, filePath, filePath]
    static let filePathArrayEmpty: [String] = []

    static func list0FilesViewModel() -> FileList.Retrieve.ViewModel {

        return FileList.Retrieve.ViewModel(screenTitle: "0 File List",
                                           datasource: [])
    }

    static func list1FilesViewModel() -> FileList.Retrieve.ViewModel {

        let file1 = File(name: "File1", type: "CSV", path: "anyPath1")
        let datasource = [file1]
        return FileList.Retrieve.ViewModel(screenTitle: "1 File List",
                                           datasource: datasource)
    }

    static func list2FilesViewModel() -> FileList.Retrieve.ViewModel {

        let file1 = File(name: "File1", type: "CSV", path: "anyPath1")
        let file2 = File(name: "File2", type: "CSV", path: "anyPath2")
        let datasource = [file1, file2]
        return FileList.Retrieve.ViewModel(screenTitle: "2 File List",
                                           datasource: datasource)
    }

    static func list3FilesViewModel() -> FileList.Retrieve.ViewModel {

        let file1 = File(name: "File1", type: "CSV", path: "anyPath1")
        let file2 = File(name: "File2", type: "CSV", path: "anyPath2")
        let file3 = File(name: "File3", type: "CSV", path: "anyPath3")
        let datasource = [file1, file2, file3]
        return FileList.Retrieve.ViewModel(screenTitle: "3 File List",
                                           datasource: datasource)
    }

    static func list0FilesResponse() -> FileList.Retrieve.Response {

        let files = [String]()
        return FileList.Retrieve.Response(files: files)
    }

    static func list1FilesResponse() -> FileList.Retrieve.Response {

        let filePath1 = "anyPath1"
        let files = [filePath1]
        return FileList.Retrieve.Response(files: files)
    }

    static func list2FilesResponse() -> FileList.Retrieve.Response {

        let filePath1 = "anyPath1"
        let filePath2 = "anyPath2"
        let files = [filePath1, filePath2]
        return FileList.Retrieve.Response(files: files)
    }

    static func list3FilesResponse() -> FileList.Retrieve.Response {

        let filePath1 = "anyPath1"
        let filePath2 = "anyPath2"
        let filePath3 = "anyPath3"
        let files = [filePath1, filePath2, filePath3]
        return FileList.Retrieve.Response(files: files)
    }

    // MARK: Worker
    class FileListWorkerMock: FileListWorker {

        override func doGetFileList(fromBundle bundle: String) -> [String] {

            let filePath1 = "anyPath1"
            let filePath2 = "anyPath2"
            let filePath3 = "anyPath3"
            let files = [filePath1, filePath2, filePath3]
            return files
        }
    }

    class FileListWorkerEmptyMock: FileListWorker {

        override func doGetFileList(fromBundle bundle: String) -> [String] {

            return []
        }
    }

    // MARK: LoadFileListWorker
    class LoadFileListWorker: LoadFileListWorkerAlias {

        func fileList(fromBundle bundle: String) -> [String] {

            let filePath1 = "anyPath1"
            let filePath2 = "anyPath2"
            let filePath3 = "anyPath3"
            let files = [filePath1, filePath2, filePath3]
            return files
        }
    }

    class LoadFileListWorkerEmpty: LoadFileListWorkerAlias {

        func fileList(fromBundle bundle: String) -> [String] {

            return []
        }
    }
}
