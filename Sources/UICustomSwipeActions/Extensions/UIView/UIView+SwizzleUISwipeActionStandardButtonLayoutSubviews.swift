//
//  UIView+SwizzleUISwipeActionStandardButtonLayoutSubviews.swift
//
//
//  Created by Seb Vidal on 18/11/2023.
//

import UIKit

extension UIView {
    static func swizzleUISwipeActionStandardButtonLayoutSubviews() {
        let UISwipeActionStandardButton = NSClassFromString("UISwipeActionStandardButton") as! UIView.Type
        
        let originalSelector = #selector(UISwipeActionStandardButton.layoutSubviews)
        let swizzledSelector = #selector(UIView.swizzledLayoutSubviews)
        
        let originalMethod = class_getInstanceMethod(UISwipeActionStandardButton.self, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(UIView.self, swizzledSelector)!
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    @objc dynamic func swizzledLayoutSubviews() {
        swizzledLayoutSubviews()
        
        guard let pullView = superview else { return }
        
        let layoutManager = UISwipeActionPullViewLayoutManager(swipeActionPullView: pullView)
        layoutManager.prepareSwipeActionPullView()
        layoutManager.resetSwipeActionStandardButton(self)
        layoutManager.layoutSwipeActionStandardButton(self)
    }
}

//extension UIView {
//    static func swizzleUISwipeActionStandardButtonTouchesBegan() {
//        let UISwipeActionStandardButton = NSClassFromString("UISwipeActionStandardButton") as! UIView.Type
//        
//        let originalSelector = #selector(UISwipeActionStandardButton.touchesBegan(_:with:))
//        let swizzledSelector = #selector(UIView.swizzledTouchesBegan(_:with:))
//        
//        let originalMethod = class_getInstanceMethod(UISwipeActionStandardButton.self, originalSelector)!
//        let swizzledMethod = class_getInstanceMethod(UIView.self, swizzledSelector)!
//        
//        method_exchangeImplementations(originalMethod, swizzledMethod)
//    }
//    
//    @objc dynamic func swizzledTouchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        swizzledTouchesBegan(touches, with: event)
//        
//        let circleView = subviews.first { $0 is CJSwipeActionButton }
//        circleView?.alpha = 0.5
//        
//        UIView.animate(withDuration: 0.5) { circleView?.alpha = 1 }
//    }
//}
