//
//  ViewController.swift
//  TAGKeyboard
//
//  Created by AbhishekThorat on 05/27/2016.
//  Copyright (c) 2016 AbhishekThorat. All rights reserved.
//

import UIKit
import TAGKeyboard

class ViewController: TAGKeyboard {

    @IBOutlet var topTextView: UITextView!
    @IBOutlet var middleTextView: UITextView!
    @IBOutlet var bottomTextView: UITextView!
    @IBOutlet var topTextfeild: UITextField!
    @IBOutlet var middleTextFeild: UITextField!
    @IBOutlet var bottomTExtFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextView.delegate = self
        middleTextView.delegate = self
        bottomTextView.delegate = self
        middleTextFeild.delegate = self
        bottomTExtFeild.delegate = self
        topTextfeild.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Text View Delegate
    override func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        let boolean = super.textViewShouldBeginEditing(textView)
        return boolean
    }
    
    override func textViewDidEndEditing(textView: UITextView) {
        super.textViewDidEndEditing(textView)
    }
    
    override func textViewDidBeginEditing(textView: UITextView) {
        super.textViewDidBeginEditing(textView)
    }
    
//Text feild Delegate
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        let boolean = super.textFieldShouldReturn(textField)
        return boolean
    }
    
    override func textFieldDidBeginEditing(textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
    }
    
    override func textFieldDidEndEditing(textField: UITextField) {
        super.textFieldDidEndEditing(textField)
    }
}

