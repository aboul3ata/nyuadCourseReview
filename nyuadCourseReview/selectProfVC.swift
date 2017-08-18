//
//  selectProfVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/18/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class selectProfVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    var profArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllProf { (returnedReviewsArray) in
            self.profArray = returnedReviewsArray
            self.pickerView.reloadAllComponents()
            print(returnedReviewsArray)
        }
    }
    
    
    
    
    
    
    //MARK:- Setting up pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.profArray.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attributedString = NSAttributedString(string: self.profArray[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
}
