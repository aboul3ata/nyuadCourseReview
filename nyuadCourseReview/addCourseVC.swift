//
//  addCourseVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/13/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class addCourseVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var categoriePckr: UIPickerView!
    @IBOutlet weak var inputTextView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriePckr.dataSource = self
        categoriePckr.delegate = self
        //keyboard automatically opened
        self.hideKeyboard()
        //move text up to make room for keyboards
        NotificationCenter.default.addObserver(self, selector: #selector(addCourseVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addCourseVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }


    
    //Setting up pickerView for the Categories
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return majors.values.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var keys = Array(majors.values)
        keys = keys.sorted()
        
        let attributedString = NSAttributedString(string: keys[row], attributes: [NSForegroundColorAttributeName : purpleColor])
        return attributedString

    }
    
    
    @IBOutlet weak var categorieLbl: UILabel!
    @IBAction func beginEditing(_ sender: Any) {
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- Keyboard appearing forces text-field to move up
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
       
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }

    }
    
    
}








