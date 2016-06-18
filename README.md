# TAGKeyboard

[![CI Status](http://img.shields.io/travis/AbhishekThorat/TAGKeyboard.svg?style=flat)](https://travis-ci.org/AbhishekThorat/TAGKeyboard)
[![Version](https://img.shields.io/cocoapods/v/TAGKeyboard.svg?style=flat)](http://cocoapods.org/pods/TAGKeyboard)
[![License](https://img.shields.io/cocoapods/l/TAGKeyboard.svg?style=flat)](http://cocoapods.org/pods/TAGKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/TAGKeyboard.svg?style=flat)](http://cocoapods.org/pods/TAGKeyboard)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

To integrate the TAGKeyboard in your project follow the steps :-
#####
1. "import TAGKeyboard".<br />
2.  extend your view controller with TAGKeyboard.<br />
        class ViewController: TAGKeyboard {}
<br />
3. Add the scroll view on your view and take the outlet to main viewcontroller.
4. Implement the viewDidLoad() and call the super.viewDidLoad() and also set the delegate instance for respective text view and text fields.
5. From your viewDidLoad set the 
              scrollViewHolder = @your_scrollview
#####
@IBOutlet var baseScrollView: UIScrollView!

        override func viewDidLoad() {
          // "Do call the super"
          super.viewDidLoad()
          scrollViewHolder = baseScrollView
          testTextView.delegate = self
          testTextfield.delegate = self
        }
6. Now implement the respective delegates for text view and text field. "Do call the super of that particular method."

######Example for text view delegates:-

    override func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return (super.textViewShouldBeginEditing(textView))
    }
    
    override func textViewDidEndEditing(textView: UITextView) {
        super.textViewDidEndEditing(textView)
    }
    
    override func textViewDidBeginEditing(textView: UITextView) {
        super.textViewDidBeginEditing(textView)
    }
    
######Example for text field delegates:-


    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        return (super.textFieldShouldReturn(textField))
    }
    
    override func textFieldDidBeginEditing(textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
    }
    
    override func textFieldDidEndEditing(textField: UITextField) {
        super.textFieldDidEndEditing(textField)
    }
#####   
7. If you are using following method then need to call the super of particular one. This method are implemented in TAGKeyboard class. <br />
#####
        7.1  If you want this method in your view then implement it in your view controller and call the parent func bu super.<br />
        main function:-
        <br />
#####
        override public func viewDidLayoutSubviews() {
                screenSize = UIScreen.mainScreen().bounds
        }
         <br />
#####
        7.2 To disappear the keyboard on orientation change implemented this method in TAGKeyboard class. 
        (Can by pass this method)<br />
#####
 override public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        dismissKeyboard()
    }
     <br />
#####
        7.3 dismissKeyboard() :- called only view.endEditing(). But need to implemented by user on particular view.     <br />
#####
8. Also user need to implement the tap gesture on their view controller separately.     <br />
#####

## Installation

TAGKeyboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TAGKeyboard', '~>2.0.0'
```

## Author

AbhishekThorat, abhishek.thorat18@gmail.com

## License

TAGKeyboard is available under the MIT license. See the LICENSE file for more info.
