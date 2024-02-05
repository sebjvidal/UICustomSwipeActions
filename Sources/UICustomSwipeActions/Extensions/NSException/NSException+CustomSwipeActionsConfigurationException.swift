//
//  NSException+CustomSwipeActionsConfigurationException.swift
//
//
//  Created by Seb Vidal on 18/11/2023.
//

import Foundation

extension NSException  {
    static var customSwipeActionsConfigurationException: NSException {
        let name = NSExceptionName("UICustomSwipeActionsConfigurationException")
        let reason = "Attempting to initialise an instance of UICustomSwipeActionsConfiguration without calling UICustomSwipeActionsConfiguration.configure() once first."
        
        return NSException(name: name, reason: reason)
    }
}
