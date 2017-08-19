//
//  coursesListVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/10/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class coursesListVC: ViewControllerPannableHoriz {


    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var catTitle: UIButton!

    @IBOutlet weak var titleLabel: UILabel!
    //seguess for cancelling the other views and returning to this one
    @IBAction func unwindToCoursesListVC(segue: UIStoryboardSegue) {}
    @IBAction func unwindToCoursesListVC2(segue: UIStoryboardSegue) {}
    @IBAction func unwindToCoursesListVC3(segue: UIStoryboardSegue) {}
    
        @IBAction func unwindToCoursesList(segue: UIStoryboardSegue) {}
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var selectedCategorie:String!
    var reviewsArray = [Review]()
    var wtdCourse:Review?

    @IBAction func backBtn(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindToMajorVC", sender: self)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.activityIndicator.startAnimating()
        //catTitle.setTitle(selectedCategorie, for: .normal)
        titleLabel.text = selectedCategorie
    }



 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let codeCat = majorsReversed[selectedCategorie]
        if let codeCategorie = codeCat {
        DataService.instance.getAllReviews(categorie: codeCategorie ){ (returnedReviewsArray) in
            self.reviewsArray = returnedReviewsArray.reversed()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
       }
    }

    /*
// TEST DATA
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let test = Review(name: "Digital Logic", prof: "Ozgur Sinanlu", stars: ["0":1,"1":1], traits: ["p1":2,"p2":3,"p4":7], reviewBody: ["This is one of the best classes I have ever taken, learned so much !! Ozgur is a genius!"], ref: "OZGUR IS THE BEST!!!")
        let test2 = Review(name: "Circuits", prof: "Mohamed Eid", stars: ["0":1,"1":1], traits: ["p1":0,"p2":5,"n2":0,"n4":0], reviewBody: ["tssp","tspp2"], ref: "abc")
        let test3 = Review(name: "Signals and systems", prof: "Peter Voltz", stars: ["0":1,"1":1], traits: ["p1":0,"p2":0,"p3":0,"n1":2,"p4":8], reviewBody: ["tssp","tspp2"], ref: "abc")
        self.reviewsArray.append(test)
                self.reviewsArray.append(test2)
                self.reviewsArray.append(test3)
        self.tableView.reloadData()
    }
     */

 
    @IBAction func writeReview2Pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToReview", sender: sender)
        

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        if segue.identifier == "goToReview"{

            let vc = segue.destination as! writeReview
            let btn = sender as! UIButton
            wtdCourse = reviewsArray[btn.tag]
            if let wantedCourse = wtdCourse {
                vc.theCourse = wantedCourse
                vc.theCategorie = majorsReversed[selectedCategorie] // getting the categorie code and passing it on
            }

        }
        
        if segue.identifier == "gotoViewCourse" {
        
            let vc2 = segue.destination as! viewCourseVC
            
            let indexPath = sender as! IndexPath
            let index = indexPath.row
            wtdCourse = reviewsArray[index]
            if let wantedCourse = wtdCourse {
                vc2.thecourse = wantedCourse
                vc2.selectedCategorie = majorsReversed[selectedCategorie]
            }
        
        }
 
    }
 


} // end of class


//MARK:- Setting up tableview and configuring cells with Firebase data after download
extension coursesListVC:UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as? courseCell else {
            return UITableViewCell()
        }
        
        
        cell.reviewBtn.tag = indexPath.row
        let review = reviewsArray[indexPath.row]
        let name = review.name
        let prof = review.prof
        let traits2 = review.traits
        var traits = [String]()
        var reviewsCount = review.reviewBody.count
        
        if review.reviewBody[0] == "No comments yet available"{
            reviewsCount = 0
        }
  //      writeReviewBTN.tag = indexPath.row
        
        // Sorting Dictionary of Traits and retrieving top 3 only!
        
        var counter = 0
        for (k,v) in (Array(traits2).sorted {$0.1 > $1.1}) {
            if counter < 3 {
                if v > 0 {
                    traits.append(k)
                }
            }
            counter += 1
        }
        
        
        cell.configureCell(name: name, prof: prof, traits: traits, reviewNum: reviewsCount)
        return cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "gotoViewCourse", sender: indexPath)
    }

}














