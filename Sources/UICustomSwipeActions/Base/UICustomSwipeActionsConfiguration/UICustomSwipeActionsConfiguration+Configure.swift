//
//  UICustomSwipeActionsConfiguration+Configure.swift
//  
//
//  Created by Seb Vidal on 18/11/2023.
//

import UIKit

extension UICustomSwipeActionsConfiguration {
    static var isConfigured: Bool = false
    
    public static func configure() {
        guard isConfigured == false else { return }
        UIView.swizzleUISwipeActionPullViewLayoutSubviews()
        isConfigured = true
    }
}
