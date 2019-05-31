//
//  FileDetailPresenter.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailPresentationLogic {

    func presentFileData(response: FileDetail.Data.Response)
}

class FileDetailPresenter: FileDetailPresentationLogic {

    weak var viewController: FileDetailDisplayLogic?

    // MARK: Do
    func presentFileData(response: FileDetail.Data.Response) {

        let screenTitle = createScreenTitle(title: response.title)
        let headers = createHeaderFields(data: response.data)
        let datasource = createIssueData(data: response.data)

        let viewModel = FileDetail.Data.ViewModel(screenTitle: screenTitle,
                                                  headerValues: headers,
                                                  datasource: datasource)
        viewController?.displayFileData(viewModel: viewModel)
    }
}

// MARK: Output --- Display
extension FileDetailPresenter {

    func createScreenTitle(title: String) -> String {

        guard let fileURL = URL(string: title) else { return "" }
        return fileURL.lastPathComponent
    }

    func createHeaderFields(data: [[String]]) -> [String] {

        guard let firstRow = data.first else { return [] }

        var headers = [String]()
        for (idx, header) in firstRow.enumerated() {

            guard idx < 4 else { break }
            headers.append(header)
        }

        return headers
    }

    func createIssueData(data: [[String]]) -> [Issue] {

        guard data.count > 1 else { return [] }

        var issues = [Issue]()
        for (idx, dataArray) in data.enumerated() where idx != 0 {

            var name = ""
            var surname = ""
            var count = ""
            var dob = ""

            for (vdx, value) in dataArray.enumerated() {

                guard vdx < 4 else { break }

                switch vdx {

                case 0:
                    name = value
                case 1:
                    surname = value
                case 2:
                    count = value
                case 3:
                    dob = value
                default:
                    break
                }
            }

            let issue = Issue(name: name,
                              surname: surname,
                              count: count,
                              dob: dob.toDate())
            issues.append(issue)
        }

        return issues
    }
}
