//
//  SampleViewController.swift
//  XIBonStoryboard
//
//  Created by K Y on 9/19/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    // MARK: - Storyboard Outlets
    
    @IBOutlet var firstKeyView: KeyValueView! {
        didSet { firstKeyView.key = "First" }
    }
    
    @IBOutlet var secondKeyView: KeyValueView! {
        didSet { secondKeyView.key = "Second" }
    }
    
    @IBOutlet var thirdKeyView: KeyValueView! {
        didSet { thirdKeyView.key = "Third" }
    }
    
    @IBOutlet var keyEntryTextField: UITextField!
    @IBOutlet var valueEntryTextField: UITextField!
    
    // MARK: - Custom Action Methods
    
    @IBAction func renameButtonAction(_ sender: Any) {
        guard let key = keyEntryTextField.text, key.isEmpty == false,
              let val = valueEntryTextField.text, val.isEmpty == false else {
                return
        }
        firstKeyView.key = key
        secondKeyView.key = key
        thirdKeyView.key = key
        
        firstKeyView.val = val
        secondKeyView.val = val
        thirdKeyView.val = val
    }
    
}

