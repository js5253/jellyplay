//
//  Util.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

func randomColor() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }

enum Throwable<T: Decodable>: Decodable {
    case success(T)
    case failure(Error)

    init(from decoder: Decoder) throws {
        do {
            let decoded = try T(from: decoder)
            self = .success(decoded)
        } catch let error {
            self = .failure(error)
        }
    }
}

extension Throwable {
    var value: T? {
        switch self {
        case .failure(_):
            return nil
        case .success(let value):
            return value
        }
    }
}
