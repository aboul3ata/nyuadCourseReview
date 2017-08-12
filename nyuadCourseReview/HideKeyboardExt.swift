//
//  HideKeyboardExt.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/12/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
