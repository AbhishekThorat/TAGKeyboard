//
//  ViewController.swift
//  TAGKeyboard
//
//  Created by AbhishekThorat on 05/27/2016.
//  Copyright (c) 2016 AbhishekThorat. All rights reserved.
//

import UIKit

public class TAGKeyboard : UIViewController {
    
    var viewWasMoved:Bool = false
    var keyBoardHeight :CGFloat = 0
    var activeView = UIView()
    var moveKeyboardDistance = CGFloat()
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    var window: UIWindow?
    public var scrollViewHolder: UIScrollView?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
        let screenHeight = screenSize.height
        let textFeildOrigin = activeView.superview?.convertPoint(activeView.frame.origin, toView: nil)
        if let test = (textFeildOrigin?.y) {
            let textFeildOriginWithHeight =  test + activeView.bounds.height
            print(textFeildOrigin)
            let textFeildPosition = screenHeight - (keyboardSize?.height)!
            if textFeildOriginWithHeight > textFeildPosition {
                viewWasMoved = true
                self.moveKeyboardDistance = textFeildOriginWithHeight > screenSize.height ? (test - textFeildPosition) + (screenSize.height - test) : (test - textFeildPosition) + activeView.bounds.height
                print("moveKeyboardDistance\(moveKeyboardDistance)")
                if let scrollViewHolder = scrollViewHolder {
                    scrollViewHolder.setContentOffset(CGPointMake(0, scrollViewHolder.contentOffset.y + abs(moveKeyboardDistance)), animated: false)
                }
                keyBoardHeight = (keyboardSize?.height)!
            } else {
                viewWasMoved = false
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
    }
    
    public func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override public func viewDidLayoutSubviews() {
        screenSize = UIScreen.mainScreen().bounds
    }
    
    override public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        dismissKeyboard()
    }
}

extension TAGKeyboard: UITextFieldDelegate {
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidBeginEditing(textField: UITextField) {
        activeView = textField
    }
    
    public func textFieldDidEndEditing(textField: UITextField) {
        if (viewWasMoved == true) {
            if let scrollViewHolder = scrollViewHolder {
                scrollViewHolder.setContentOffset(CGPointMake(0, 0), animated: false)
            }
        }
        viewWasMoved = false
    }
}

extension TAGKeyboard: UITextViewDelegate {
    
    public func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        activeView = textView
        return true
    }
    
    public func textViewDidEndEditing(textView: UITextView) {
        if (viewWasMoved == true) {
            if let scrollViewHolder = scrollViewHolder {
                scrollViewHolder.setContentOffset(CGPointMake(0, 0), animated: false)
            }
        }
        viewWasMoved = false
    }
    
    public func textViewDidBeginEditing(textView: UITextView) {
    }
    
}