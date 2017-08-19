//
//  addCourseVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/13/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit
import Firebase

class addCourseVC: ViewControllerPannable, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var categoriePckr: UIPickerView!

    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var codeTxt: UITextField!
    
    @IBOutlet weak var profTxt: UITextField!
    
    @IBAction func backBtnpressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindToCoursesList", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriePckr.dataSource = self
        categoriePckr.delegate = self
        nameTxt.delegate = self
        nameTxt.becomeFirstResponder()
        //keyboard automatically opened
        self.hideKeyboard()
        categoriePckr.selectRow(10, inComponent: 0, animated: false)
        //move text up to make room for keyboards
        /*
        NotificationCenter.default.addObserver(self, selector: #selector(addCourseVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addCourseVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    */
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
    
    
    

    
    @IBAction func addCoursePressed(_ sender: Any) {
        // look up PickerviewValue to get code of categorie
        print(categoriePckr.selectedRow(inComponent: 0))
        let code = Array(majors.values).sorted()
        let categorie = code[categoriePckr.selectedRow(inComponent: 0)]
        let categorieCode = majorsReversed[categorie]
        
        if let categorieText = categorieCode {
            if let codeText = codeTxt.text?.uppercased() {
                if let nameText = nameTxt.text {
                    if let profText = profTxt.text {
                        DataService.instance.addCourse(name: nameText, prof: profText, categorie: categorieText, code: codeText)
                    }
                }
            }
            
        self.performSegue(withIdentifier: "unwindToCoursesListVC3", sender: self)
    }
    


        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
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
    */
    
}








