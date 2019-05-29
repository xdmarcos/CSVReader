//
//  DebugLog.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

public func DLog(_ message: String, function: String = #function) {

    #if DEBUG
    print("\(function): \(message)")
    #endif
}
