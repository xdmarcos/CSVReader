//
//  FileDetailMocks.swift
//  CSVReaderUITests
//
//  Created by Marcos Gonzalez on 2019.
//

@testable import SimpleReader

struct FileDetailMocks {

    static func detail0ItemViewModel() -> FileDetail.Data.ViewModel {

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [Issue]()
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail1ItemViewModel() -> FileDetail.Data.ViewModel {

        let item1 = Issue(name: "name11", surname: "surname11", count: "11", dob: Date())

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [item1]
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail2ItemViewModel() -> FileDetail.Data.ViewModel {

        let item1 = Issue(name: "name21", surname: "surname21", count: "21", dob: Date())
        let item2 = Issue(name: "name22", surname: "surname22", count: "22", dob: Date())

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [item1, item2]
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    static func detail3ItemsViewModel() -> FileDetail.Data.ViewModel {

        let item1 = Issue(name: "name31", surname: "surname31", count: "31", dob: Date())
        let item2 = Issue(name: "name32", surname: "surname32", count: "32", dob: Date())
        let item3 = Issue(name: "name33", surname: "surname33", count: "33", dob: Date())

        let headers = ["name", "surname", "count", "dob"]
        let datasource = [item1, item2, item3]
        return FileDetail.Data.ViewModel(screenTitle: "Detail Title",
                                         headerValues: headers,
                                         datasource: datasource)
    }

    class InteractorMock: FileDetailBusinessLogic {

        func tryGetFileData(request: FileDetail.Data.Request) {
            //do nothing
        }
    }
}
