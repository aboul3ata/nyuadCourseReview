//
//  addProfVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/19/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class addProfVC: ViewControllerPannableHoriz,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewofProfs: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var theCourse:Review!
    var theCategorie:String!
    
    

    
    @IBOutlet weak var courseLbl: UILabel!
    
    var profArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewofProfs.isHidden = true
        self.activityIndicator.startAnimating()
        pickerView.dataSource = self
        pickerView.delegate = self
        courseLbl.text = theCourse.name
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllProf { (returnedReviewsArray) in
            self.profArray = returnedReviewsArray
            self.pickerView.reloadAllComponents()
            print(returnedReviewsArray)
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.viewofProfs.isHidden = false
            
        }
    }
    
    
    
        /*
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
    
    @IBAction func backpressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToLanding2", sender: nil)
    }
    
    */
    
    
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
    
    
    //MARK:- @IBActions
    
    @IBAction func addProfPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToCoursesListVC4", sender: self)

        //getting name of prof
        let indexOfProf = pickerView.selectedRow(inComponent: 0)
        let selectedProf = profArray[indexOfProf]
        
        self.submitProfNameFirebase(profName: selectedProf)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToCoursesListVC4" {
            let vc = segue.destination as! coursesListVC
            vc.viewDidAppear(false)
        
        }
    }
    
    
    
    //MARK- Submitting to Firebase

    func submitProfNameFirebase(profName:String) {
        let WANTED_REF_PROFESSOR = DataService.instance.REF_COURSES.child(theCategorie).child(theCourse.ref).child("Prof")

        WANTED_REF_PROFESSOR.setValue(profName)

    
    }
    
}


