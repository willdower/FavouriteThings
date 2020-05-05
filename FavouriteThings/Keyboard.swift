//
//  Keyboard.swift
//  FavouriteThings
//
//  Created by William Dower on 6/5/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import SwiftUI

/// Represents the keyboard by subscribing to keyboardWillShow and keyboardDidHide to give up-to-date dimensions of the keyboard for dynamic views
class Keyboard: ObservableObject {
    /// The frame of the keyboard with size parameters
    @Published var frame = CGRect()
    /// The x co-ordinate of the frame's origin
    var x: Int { Int(frame.origin.x) }
    /// The y co-ordinate of the frame's origin
    var y: Int { Int(frame.origin.y) }
    /// The width of the frame
    var w: Int { Int(frame.size.width) }
    /// The height of the frame
    var h: Int { Int(frame.size.height) }
    
    init() {
        // Add observers of keyboard show and hide on init
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    deinit {
        // Remove observers on deinit
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Function that is run when keyboard will show, sets frame equal to the keyboard's dimensions
    @objc func keyboardWillShow(notification: Notification) {
        guard let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {
            return
        }
        frame = rect
    }
    
    /// Function that is run when keyboard has hidden, sets frame equal to zero on all dimensions
    @objc func keyboardDidHide(notification: Notification) {
        frame = .zero
    }
}
