//
//  FileListMocks.swift
//  CSVReaderUITests
//
//  Created by Marcos Gonzalez on 2019.
//

@testable import SimpleReader

struct FileListMocks {

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

    class InteractorMock: FileListBusinessLogic {

        func tryRetrieveFileList(request: FileList.Retrieve.Request) {
            //do nothing
        }
    }
}
