//
//  UIView+SwizzleUISwipeActionStandardButtonLayoutSubviews.swift
//
//
//  Created by Seb Vidal on 18/11/2023.
//

import UIKit

extension UIView {
    static func swizzleUISwipeActionPullViewLayoutSubviews() {
        guard let UISwipeActionPullView = NSClassFromBase64String("VUlTd2lwZUFjdGlvblB1bGxWaWV3") as? UIView.Type else { return }
        
        let originalSelector = #selector(UISwipeActionPullView.layoutSubviews)
        let swizzledSelector = #selector(UISwipeActionPullView.swizzledUISwipeActionPullViewLayoutSubviews)
        
        guard let originalMethod = class_getInstanceMethod(UISwipeActionPullView.self, originalSelector) else { return }
        guard let swizzledMethod = class_getInstanceMethod(UISwipeActionPullView.self, swizzledSelector) else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    @objc dynamic private func swizzledUISwipeActionPullViewLayoutSubviews() {
        swizzledUISwipeActionPullViewLayoutSubviews()
        
        let cellEdge = UIRectEdge(rawValue: value(forBase64Key: "X2NlbGxFZGdl") as? UInt ?? 2)
        let actions = value(forBase64Key: "X2FjdGlvbnM=") as? [UICustomContextualAction]
        
        guard let actions, actions.first?.preferredButtonStyle == .circular else { return }
        
        backgroundColor = .clear
        
        for case let (index, button as UIButton) in subviews.enumerated() {
            guard actions.indices.contains(index) else { continue }
            
            let action = actions[index]
            
            for subview in button.subviews where !(subview is UICustomSwipeActionButton) {
                subview.removeFromSuperview()
            }
            
            let buttonWidth = action.preferredButtonWidth + action.preferredButtonSpacing
            button.setValue(buttonWidth, forBase64Key: "YnV0dG9uV2lkdGg=")
            
            let frameForButton: (UIButton) -> CGRect = { [unowned self] button in
                let width = action.preferredButtonWidth
                let height = action.preferredButtonWidth
                
                let offset = frame.width == superview?.frame.width ? action.preferredButtonSpacing : 0
                let x = (cellEdge == .left ? action.preferredButtonSpacing : 0) + (cellEdge == .left ? -offset : offset)
                let y = (frame.height / 2) - (buttonWidth / 2) + (action.preferredButtonSpacing / 2)
                
                return CGRect(x: x, y: y, width: width, height: height)
            }
            
            if let customSwipeActionButton = button.subviews.first as? UICustomSwipeActionButton {
                UIView.animate(withDuration: 0.5) {
                    customSwipeActionButton.frame = frameForButton(button)
                }
            } else {
                let customSwipeActionButton = UICustomSwipeActionButton()
                customSwipeActionButton.image = action.image
                customSwipeActionButton.backgroundColor = action.backgroundColor
                customSwipeActionButton.frame = frameForButton(button)
                
                button.addSubview(customSwipeActionButton)
            }
        }
    }
}
