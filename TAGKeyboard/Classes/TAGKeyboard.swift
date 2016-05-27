import UIKit


public class TAGKeyboard : UIViewController {
    
    var viewWasMoved:Bool = false
    var keyBoardHeight :CGFloat = 0
    var activeView = UIView()
    var moveKeyboardDistance = CGFloat()
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    var window: UIWindow?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard"))
        view.addGestureRecognizer(tap)
    }
    
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue()
        let screenHeight = screenSize.height
        
        var aRect: CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        
        let textFeildOrigin = activeView.superview?.convertPoint(activeView.frame.origin, toView: nil)
        if let test = (textFeildOrigin?.y) {
            let textFeildOriginWithHeight =  test + activeView.bounds.height
            print(textFeildOrigin)
            let textFeildPosition = screenHeight - (keyboardSize?.height)!
            if textFeildOriginWithHeight > textFeildPosition {
                viewWasMoved = true
                self.moveKeyboardDistance = textFeildOriginWithHeight > screenSize.height ? (test - textFeildPosition) + (screenSize.height - test) : (test - textFeildPosition) + activeView.bounds.height
                self.view.frame.origin.y -= moveKeyboardDistance
                keyBoardHeight = (keyboardSize?.height)!
            } else {
                viewWasMoved = false
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        dismissKeyboard()
    }
    
    override public func viewDidLayoutSubviews() {
        screenSize = UIScreen.mainScreen().bounds
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
            self.view.frame.origin.y += moveKeyboardDistance
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
            self.view.frame.origin.y += moveKeyboardDistance
        }
        viewWasMoved = false
    }
    
    public func textViewDidBeginEditing(textView: UITextView) {
    }
    
}