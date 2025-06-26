import UIKit

public class UICustomSwipeActionsConfiguration: UISwipeActionsConfiguration {
    // MARK: - Private Properties
    private var _actions: [UICustomContextualAction] = []
    
    // MARK: - Public Properties
    public override var actions: [UIContextualAction] {
        return _actions.map { action in
            UICustomContextualAction(contextualAction: action, configuration: self)
        }
    }
    
    public var preferredButtonStyle: UICustomSwipeActionsConfigurationButtonStyle = .default {
        didSet { didSetPreferredButtonStyle(preferredButtonStyle) }
    }
    
    public var preferredButtonWidth: CGFloat = 74 {
        didSet { didSetPreferredButtonWidth(preferredButtonWidth) }
    }
    
    public var preferredButtonSpacing: CGFloat = 0 {
        didSet { didSetPreferredButtonSpacing(preferredButtonSpacing) }
    }
    
    // MARK: - init(actions:)
    public convenience init(actions: [UIContextualAction]) {
        self.init()
        
        UIView.swizzleUISwipeActionPullViewLayoutSubviewsIfNeeded()
        
        if UICustomSwipeActionsConfiguration.isConfigured {
            _actions = actions.map { action in
                UICustomContextualAction(contextualAction: action, configuration: self)
            }
        } else {
            NSException.customSwipeActionsConfigurationException.raise()
        }
    }
    
    // MARK: - init()
    public override init() {
        fatalError("init() is not supported")
    }
    
    // MARK: - Private Methods
    private func didSetPreferredButtonStyle(_ newValue: UICustomSwipeActionsConfigurationButtonStyle) {
        _actions.forEach { action in
            action.preferredButtonStyle = newValue
        }
    }
    
    private func didSetPreferredButtonWidth(_ newValue: CGFloat) {
        _actions.forEach { action in
            action.preferredButtonWidth = newValue
        }
    }
    
    private func didSetPreferredButtonSpacing(_ newValue: CGFloat) {
        _actions.forEach { action in
            action.preferredButtonSpacing = newValue
        }
    }
}
