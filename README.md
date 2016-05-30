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
3. Implement the viewDidLoad() and call the super.viewDidLoad() and also set the delegate instance for respective text view and text fields.
#####

        override func viewDidLoad() {
          // "Do call the super"
          super.viewDidLoad()
          testTextView.delegate = self
          testTextfield.delegate = self
        }
4. Now implement the respective delegates for text view and text field. "Do call the super of that perticular method."

######Examlple for text view delegates:-

    override func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return (super.textViewShouldBeginEditing(textView))
    }
    
    override func textViewDidEndEditing(textView: UITextView) {
        super.textViewDidEndEditing(textView)
    }
    
    override func textViewDidBeginEditing(textView: UITextView) {
        super.textViewDidBeginEditing(textView)
    }
    
######Examlple for text field delegates:-


    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        return (super.textFieldShouldReturn(textField))
    }
    
    override func textFieldDidBeginEditing(textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
    }
    
    override func textFieldDidEndEditing(textField: UITextField) {
        super.textFieldDidEndEditing(textField)
    }
## Installation

TAGKeyboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TAGKeyboard', '~>0.1.4'
```

## Author

AbhishekThorat, abhishek.thorat18@gmail.com

## License

TAGKeyboard is available under the MIT license. See the LICENSE file for more info.
