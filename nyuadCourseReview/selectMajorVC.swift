//
//  selectMajorVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/8/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class selectMajorVC: ViewControllerPannableHoriz, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    
    
    @IBAction func unwindToMajorVC(segue: UIStoryboardSegue) {}
    @IBAction func searchPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToCourses", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let code = Array(majors.values).sorted()
        let categorie = code[pickerView.selectedRow(inComponent: 0)]
        if segue.identifier == "goToCourses"{
            
            let vc = segue.destination as! coursesListVC
            vc.selectedCategorie = categorie
            
        }
    }
    @IBAction func backPressed(_ sender: Any) {
        self.performSegue(withIdentifier:"unwindToLanding" , sender: self)
    }
    
// Setting up the picker view for all majors
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return majors.values.count
    }
    
    

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var keys = Array(majors.values)
        keys = keys.sorted()

        let attributedString = NSAttributedString(string: keys[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
    
    
    
    
    
    
    
    
    
}
