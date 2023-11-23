//
//  File.swift
//  
//
//  Created by Seb Vidal on 18/11/2023.
//

import UIKit

class UICustomContextualAction: UIContextualAction {
    // MARK: - Private Properties
    private var contextualAction: UIContextualAction
    
    // MARK: - Internal Properties
    weak var configuration: UICustomSwipeActionsConfiguration?
    
    // MARK: - Public Properties
    public override var style: UIContextualAction.Style {
        return contextualAction.style
    }
    
    public override var handler: UIContextualAction.Handler {
        return contextualAction.handler
    }
    
    public override var title: String? {
        get {
            return contextualAction.title
        } set {
            contextualAction.title = newValue
        }
    }
    
    public override var backgroundColor: UIColor! {
        get {
            return contextualAction.backgroundColor
        } set {
            contextualAction.backgroundColor = newValue
        }
    }
    
    public override var image: UIImage? {
        get {
            return contextualAction.image
        } set {
            contextualAction.image = newValue
        }
    }
    
    // MARK: - init(contextualAction:)
    init(contextualAction: UIContextualAction, configuration: UICustomSwipeActionsConfiguration) {
        self.contextualAction = contextualAction
        self.configuration = configuration
    }
}
