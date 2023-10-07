//
//  DataLoader.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 07/10/23.
//

import Foundation
@testable import TMDB

class DataLoader {
    func loadFile<T: Decodable>(withFileName filename: String, fileType: String = "json") throws -> T {
        guard let path = Bundle(for: UserTests.self).path(forResource: filename, ofType: fileType) else { fatalError("Can't find the \(filename).\(fileType) file") }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let decodedData: T = try DataParser().parse(data: data)
        return decodedData
    }
}
