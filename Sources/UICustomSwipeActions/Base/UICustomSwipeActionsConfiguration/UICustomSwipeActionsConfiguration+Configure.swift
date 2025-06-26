//
//  UICustomSwipeActionsConfiguration+Configure.swift
//  
//
//  Created by Seb Vidal on 18/11/2023.
//

import UIKit

extension UICustomSwipeActionsConfiguration {
    static var isConfigured: Bool {
        return UIView.needsSwizzleUISwipeActionPullViewLayoutSubviews == false
    }
    
    @available(*, deprecated, message: "Calling this method is no longer needed.")
    public static func configure() {
        UIView.swizzleUISwipeActionPullViewLayoutSubviewsIfNeeded()
    }
}
