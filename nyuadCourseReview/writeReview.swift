//
//  writeReview.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/12/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class writeReview: ViewControllerPannable {

    @IBOutlet weak var prof: UILabel!
    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var starsImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var theCourse:Review!
    var theCategorie:String!
    
    private var numTraitsSelected = 0
    private var traitsArray = [Int]()
    private var FirebaseStars:String?
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindToCoursesListVC2", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        textView.delegate = self
        print(theCategorie)
        if let theCourse = theCourse {
            prof.text = " by \(theCourse.prof)"
            theTitle.text = theCourse.name
            
        
        }

        
        NotificationCenter.default.addObserver(self, selector: #selector(writeReview.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(writeReview.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }


    //Setting image stars for reviews
    @IBAction func starsPressed (_ sender: UIButton){
        starsImage.image = UIImage(named: "Stars\(sender.tag)")
        print("BTN PRESSED")
        FirebaseStars = ("s\(sender.tag)")

    }
    
    // highlighting traits as they are selected/deselected
    // preparing traits for Firebase
    @IBAction func traitSelected(_ sender:UIButton){

        if sender.backgroundColor == purpleColor {
        
            switch sender.tag {
            case 1,2,3,4:
                sender.backgroundColor = greenColor
            case 5,6,7,8:
                sender.backgroundColor = orangeColor
            case 9,10,11,12:
                sender.backgroundColor = redColor
            default:
                sender.backgroundColor = UIColor.darkGray
            }
            
        numTraitsSelected -= 1
            
            self.traitsArray = self.traitsArray.filter(try {
                $0 != sender.tag
                })

            
            
        } else {

            if numTraitsSelected < 4{
                sender.backgroundColor = purpleColor
                numTraitsSelected += 1
                self.traitsArray.append(sender.tag)
                

            
            //Warning if more than 3 traits selected
            } else {
            
                let alert = UIAlertController(title: "Maximum four traits", message: "Please deselect some other traits if you wish to add this one", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "I understand", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    
    
    
    
    //MARK:- Submitting review to Firebase
    @IBAction func submitBtnPressed(_ sender: Any) {
        print("ALI ur traits array is \(self.traitsArray)")
        
        
        
        var FirebaseTraitsArrray = [String]()



        
        
        
        //getting traits
        //getting old values of traits from theCourse traits dictionary
        //sending new values of traits
        let WANTED_REF_REVIEWS = DataService.instance.REF_COURSES.child(theCategorie).child(theCourse.ref).child("Reviews")
        let WANTED_REF_TRAITS = DataService.instance.REF_COURSES.child(theCategorie).child(theCourse.ref).child("Traits")
        let WANTED_REF_STARS = DataService.instance.REF_COURSES.child(theCategorie).child(theCourse.ref).child("Stars")
        
        if traitsArray.count != 0 {
            var traitsDict = [String:Int]()
        
            //changing traits from btn num to proper Firebase format
            //eg btn 2 pressed adds  p2 to FirebaseTraitsArray
            for x in self.traitsArray {
        
                if let trait = traitsByBtnNum["\(x)"]{
                FirebaseTraitsArrray.append(trait)
                }
            }
        
            //Getting current values of traits
            // add one to desired ones
            for x in FirebaseTraitsArrray {
            
                if let traitValue = theCourse?.traits[x] {
                traitsDict[x] = traitValue + 1
                }
        }
            
            // uploading new values to firebase
            
            for (traitRef,traitVal) in traitsDict {
            
                WANTED_REF_TRAITS.updateChildValues([traitRef:traitVal])
    
            }

        } // end of traits stuff
        
        
        
        //Adding review to Firebase
        
        if textView.text != nil && textView.text != "Write your review" {
            
            let postRefKey = WANTED_REF_REVIEWS.childByAutoId()
            
            postRefKey.setValue(textView.text)
            
        }
        
        // adding stars to firebase
        if let FIRstars = FirebaseStars {
            
            
            let starCount = theCourse.stars[FIRstars]! + 1
            WANTED_REF_STARS.updateChildValues([FIRstars:starCount])


        
        }
        self.performSegue(withIdentifier: "unwindToCoursesListVC2", sender: nil)
        
    } // end of submit button

    
    
    
    
    
    
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





// Removing placeholder text
extension writeReview: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your review" {
        textView.text = ""
        }
    }
}
