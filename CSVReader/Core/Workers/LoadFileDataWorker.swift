//
//  LoadFileDataWorker.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol LoadFileDataWorkerAlias {

    func dataFromFile(file: String) -> [[String]]
}

class LoadFileDataWorker: LoadFileDataWorkerAlias {

    func dataFromFile(file: String) -> [[String]] {

        let data = readDataFromCSV(fileName: file)
        var result = [[String]]()
        let rows = data.components(separatedBy: "\n").filter { (component) -> Bool in
            return !component.isEmpty
        }

        for row in rows {

            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }

        return result
    }

    private func readDataFromCSV(fileName: String) -> String {

        do {
            var contents = try String(contentsOfFile: fileName, encoding: .utf8)
            contents = cleanRows(file: contents)

            return contents
        } catch {

            DLog("File Read Error for file \(fileName)")
            return ""
        }
    }

    private func cleanRows(file: String) -> String {

        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\"", with: "")

        return cleanFile
    }
}
