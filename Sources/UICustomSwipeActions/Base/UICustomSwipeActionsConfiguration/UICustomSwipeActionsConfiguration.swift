import UIKit

public class UICustomSwipeActionsConfiguration: UISwipeActionsConfiguration {
    // MARK: - Private Properties
    private var _actions: [UICustomContextualAction] = []
    
    // MARK: - Public Properties
    public override var actions: [UIContextualAction] {
        return _actions
    }
    
    public var style: UICustomSwipeActionsConfigurationStyle = .default
    
    public var preferredButtonWidth: CGFloat = 74
    
    // MARK: - init(actions:)
    public convenience init(actions: [UIContextualAction]) {
        self.init()
        
        if UICustomSwipeActionsConfiguration.isConfigured {
            _actions = actions.map { action in
                UICustomContextualAction(contextualAction: action, configuration: self)
            }
        } else {
            NSException.customSwipeActionsConfigurationException.raise()
        }
    }
}
