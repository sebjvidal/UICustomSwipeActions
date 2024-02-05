//
//  Array+FirstOfType.swift
//  
//
//  Created by Seb Vidal on 19/11/2023.
//

import UIKit

extension Array where Element == UIView {
    func first<T: UIView>(ofType _: T.Type) -> T? {
        return first { $0 is T } as? T
    }
}
