//
//  AppConfig.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

public struct AppConfig {
    
    #if CONF_STAGE
    static let bundleName = "Stage"
    #else
    static let bundleName = "Production"
    #endif
}
