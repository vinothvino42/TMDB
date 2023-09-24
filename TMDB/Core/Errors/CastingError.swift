//
//  CastingError.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation

struct CastingError: Error {
    let fromType: Any.Type
    let toType: Any.Type
    
    init<FromType, ToType>(fromType: FromType.Type, toType: ToType.Type) {
        self.fromType = fromType
        self.toType = toType
    }
}

extension CastingError: LocalizedError {
    var localizedDescription: String { return "Can not cast from \(fromType) to \(toType)" }
}

extension CastingError: CustomStringConvertible { var description: String { return localizedDescription } }
