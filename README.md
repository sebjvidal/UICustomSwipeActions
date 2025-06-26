# About

A Swift package that enables customisation of UIKit's table or collection view swipe actions. This package swizzles the `layoutSubviews` method of  UIKit's internal `UISwipeActionPullView` to apply a custom layout and, where necessary, insert custom subviews into the view hierarchy.

https://github.com/user-attachments/assets/ac800585-5794-4aaf-b9b7-d2fca4961f72

Because this package relies on UIKit's existing swipe actions implementation, you get all the benefits of Apple's natural gestures and accessibility.

While this package has shipped in production apps, you should use it at your own risk as this could be considere private API usage.

# Usage

Replace your existing `UISwipeActionsConfiguration` with a `UICustomSwipeActionsConfiguration`.
  
You can customise such properties as the `preferredButtonWidth`, `preferredButtonSpacing` and `preferredButtonStyle`, along with the standard `UISwipeActionsConfiguration` properties.
   
```swift
class ViewController: UIViewController, UITableViewDelegate {

  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { ... }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemRed

        let configuration = UICustomSwipeActionsConfiguration(actions: actions)
        configuration.preferredButtonWidth = 58
        configuration.preferredButtonSpacing = 16
        configuration.preferredButtonStyle = .circular
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
  }
}
```

That's it! You're good to go. All you have to do is build and run!
