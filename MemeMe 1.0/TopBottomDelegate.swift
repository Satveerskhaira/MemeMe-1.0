//
//  TopBottomDelegate.swift
//  MemeMe 1.0
//
//  Created by Satveer Singh on 6/11/17.
//  Copyright © 2017 Satveer Singh. All rights reserved.
//

import Foundation
import UIKit

class TopBottomDelegate: NSObject, UITextFieldDelegate, UIStoryboard {
    
    
    
    //let viewDel = ViewController()
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // MARK : This function will hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK : shift View to enter text in bottom field
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.restorationIdentifier == "Bottom" {
            // enable keyboard notification
            subscribeToKeyboardNotifications()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        if textField.restorationIdentifier == "Bottom" {
            // enable keyboard notification
            unsubscribeFromKeyboardNotifications()
        }
    }
    
    // MARK : subsribe to keyboard notification
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    
    func keyboardWillShow(_ notification :Notification) {
        
        //self.view.frame.origin.y -= getKeyboardHeight(notification)
        print(getKeyboardHeight(notification))
        //viewDel.updateViewframe(frameOrigin: getKeyboardHeight(notification))
        
    }
    
    func keyboardWillHide(_ notification : Notification) {
        
        //view.frame.origin.y = 0
        print(getKeyboardHeight(notification))
        //viewDel.updateViewframe(frameOrigin: CGFloat(0))

    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }

}
