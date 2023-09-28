//
//  Data+Converter.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation

extension Encodable {
    func toJSON(_ encoder: JSONEncoder = JSONEncoder()) throws -> String {
        let data = try encoder.encode(self)
        let result = String(decoding: data, as: UTF8.self)
        return result
    }
}
