//
//  NSObject+ValueForBase64Key.swift
//
//
//  Created by Seb Vidal on 02/07/2024.
//

import Foundation

extension NSObject {
    func value(forBase64Key base64Key: String) -> Any? {
        value(forKey: String(base64: base64Key))
    }
    
    static func value(forBase64Key base64Key: String) -> Any? {
        value(forKey: String(base64: base64Key))
    }
}
