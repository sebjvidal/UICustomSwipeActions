//
//  String+InitBase64.swift
//
//
//  Created by Seb Vidal on 02/07/2024.
//

import Foundation

extension String {
    init(base64 string: String) {
        let data = Data(base64Encoded: string)!
        self.init(data: data, encoding: .utf8)!
    }
}
