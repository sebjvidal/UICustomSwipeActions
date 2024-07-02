//
//  NSObject+SetValueForBase64Key.swift
//
//
//  Created by Seb Vidal on 02/07/2024.
//

import Foundation

extension NSObject {
    func setValue(_ value: Any?, forBase64Key base64Key: String) {
        setValue(value, forKey: String(base64: base64Key))
    }
}
