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
    
    
    
    
    @IBAction func searchPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToProfList", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.identifier == "goToProfList"{
            
            let vc = segue.destination as! ViewProfVC
            let indexOfProf = pickerView.selectedRow(inComponent: 0)
            vc.selectedProf = profArray[indexOfProf]
            
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
