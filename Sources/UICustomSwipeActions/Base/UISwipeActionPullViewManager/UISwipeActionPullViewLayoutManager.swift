//
//  File.swift
//  
//
//  Created by Seb Vidal on 19/11/2023.
//

import UIKit

struct UISwipeActionPullViewLayoutManager {
    // MARK: - Private Properties
    private var swipeActionPullView: UIView
    
    private var cellEdge: CellEdge {
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
        let actions = swipeActionPullView.value(forKey: "_actions")
        return actions as? [UICustomContextualAction] ?? []
    }
    
    private func cellEdge(for swipeActionPullView: UIView) -> CellEdge {
        let rawValue = swipeActionPullView.value(forKey: "_cellEdge") as? Int ?? 2
        return CellEdge(rawValue: rawValue) ?? .leading
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
        swipeActionStandardButton.setValue(buttonWidth + buttonSpacing, forKey: "buttonWidth")
        
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
