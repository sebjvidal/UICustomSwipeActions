//
//  Foundation+NSClassFromBase64String.swift
//
//
//  Created by Seb Vidal on 02/07/2024.
//

import Foundation

func NSClassFromBase64String(_ base64String: String) -> AnyClass? {
    guard let data = Data(base64Encoded: base64String) else { return nil }
    guard let string = String(data: data, encoding: .utf8) else { return nil }
    
    return NSClassFromString(string)
}
