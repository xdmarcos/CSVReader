//
//  FileDetailWorker.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

class FileDetailWorker {

    var dataWorker: LoadFileDataWorkerAlias = LoadFileDataWorker()

    func doGetDataFromFile(file: String) -> [[String]] {

        return dataWorker.dataFromFile(file: file)
    }
}
