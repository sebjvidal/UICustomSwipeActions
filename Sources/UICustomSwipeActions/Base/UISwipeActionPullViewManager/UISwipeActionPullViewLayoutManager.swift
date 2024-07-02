//
//  UISwipeActionPullViewLayoutManager.swift
//  
//
//  Created by Seb Vidal on 19/11/2023.
//

import UIKit

struct UISwipeActionPullViewLayoutManager {
    // MARK: - Private Properties
    private var swipeActionPullView: UIView
    
    private var cellEdge: UISwipeActionPullViewCellEdge {
        return cellEdge(for: swipeActionPullView)
    }
    
    private var style: UICustomSwipeActionsConfigurationStyle {
        return style(for: actions)
    }
    
    private var buttonWidth: CGFloat {
        return buttonWidth(for: actions)
    }
    
    private var buttonSpacing: CGFloat {
        return buttonSpacing(for: actions)
    }
    
    // MARK: - Internal Properties
    var actions: [UICustomContextualAction] {
        return actions(in: swipeActionPullView)
    }
    
    // MARK: - init(prepareSwipeActionPullView:)
    init(swipeActionPullView: UIView) {
        self.swipeActionPullView = swipeActionPullView
    }
    
    // MARK: - Private Methods
    private func actions(in swipeActionPullView: UIView) -> [UICustomContextualAction] {
        let value = swipeActionPullView.value(forBase64Key: "X2FjdGlvbnM=")
        let actions = value as? [UICustomContextualAction] ?? []
        
        return actions
    }
    
    private func cellEdge(for swipeActionPullView: UIView) -> UISwipeActionPullViewCellEdge {
        let rawValue = swipeActionPullView.value(forBase64Key: "X2NlbGxFZGdl") as? Int ?? 2
        let cellEdge = UISwipeActionPullViewCellEdge(rawValue: rawValue) ?? .leading
        
        return cellEdge
    }
    
    private func style(for actions: [UICustomContextualAction]) -> UICustomSwipeActionsConfigurationStyle {
        return actions.first?.configuration?.style ?? .default
    }
    
    private func buttonWidth(for actions: [UICustomContextualAction]) -> CGFloat {
        return actions.first?.configuration?.preferredButtonWidth ?? 74
    }
    
    private func buttonSpacing(for actions: [UICustomContextualAction]) -> CGFloat {
        return actions.first?.configuration?.preferredButtonSpacing ?? 0
    }
    
    // MARK: - Internal Methods
    func customSwipeActionButton(in swipeActionStandardButton: UIView) -> UICustomSwipeActionButton? {
        return swipeActionStandardButton.subviews.first(ofType: UICustomSwipeActionButton.self)
    }
    
    func prepareSwipeActionPullView() {
        guard case .circular = style else { return }
        swipeActionPullView.backgroundColor = .clear
    }
    
    func resetSwipeActionStandardButton(_ swipeActionStandardButton: UIView) {
        swipeActionStandardButton.setValue(buttonWidth + buttonSpacing, forBase64Key: "YnV0dG9uV2lkdGg=")
        
        guard case .circular = style else { return }
        
        let backgroundView = swipeActionStandardButton.subviews.first { String(describing: type(of: $0)) == "UIView"}
        backgroundView?.removeFromSuperview()
        
        let imageView = swipeActionStandardButton.subviews.first { $0 is UIImageView }
        imageView?.removeFromSuperview()
        
        let buttonLabel = swipeActionStandardButton.subviews.first { $0 is UILabel }
        buttonLabel?.removeFromSuperview()
    }
    
    func layoutSwipeActionStandardButton(_ swipeActionStandardButton: UIView) {
        guard case .circular = style else { return }

        if let customSwipeActionButton = customSwipeActionButton(in: swipeActionStandardButton) {
            let index = swipeActionStandardButton.superview?.subviews.firstIndex(of: swipeActionStandardButton)
            customSwipeActionButton.image = actions[index!].image
            customSwipeActionButton.backgroundColor = actions[index!].backgroundColor
            
            let y = (swipeActionStandardButton.frame.height / 2) - (customSwipeActionButton.frame.height / 2)
            customSwipeActionButton.frame.origin.x = cellEdge == .leading ? buttonSpacing : 0
            customSwipeActionButton.frame.origin.y = y
        } else {
            let customSwipeActionButton = UICustomSwipeActionButton()
            customSwipeActionButton.frame.size.width = buttonWidth
            customSwipeActionButton.frame.size.height = buttonWidth
            
            swipeActionStandardButton.addSubview(customSwipeActionButton)
        }
    }
}
