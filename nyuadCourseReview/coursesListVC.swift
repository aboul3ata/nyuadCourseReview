//
//  coursesListVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/10/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class coursesListVC: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    @IBAction func aa(_ sender: Any) {
    }
    
    var reviewsArray = [Review]()
    var wtdCourse:Review?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    /*

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllReviews { (returnedReviewsArray) in
            self.reviewsArray = returnedReviewsArray.reversed()
            self.tableView.reloadData()
        }
    }
 */
 

// TEST DATA
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let test = Review(name: "Digital Logic", prof: "Ozgur Sinanlu", stars: [0:1,1:1], traits: ["p1":2,"p2":3,"p4":7,"b3":8], reviewBody: ["tssp","tspp2"])
        let test2 = Review(name: "Circuits", prof: "Mohamed Eid", stars: [0:1,1:1], traits: ["p1":0,"p2":0,"n2":7,"n4":8], reviewBody: ["tssp","tspp2"])
        let test3 = Review(name: "Advanced Controller", prof: "Peter Voltz", stars: [0:1,1:1], traits: ["p1":0,"p2":0,"n1":2,"p4":8], reviewBody: ["tssp","tspp2"])
        self.reviewsArray.append(test)
                self.reviewsArray.append(test2)
                self.reviewsArray.append(test3)
        self.tableView.reloadData()
    }
    

 
    @IBAction func writeReview2Pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToReview", sender: sender)
        

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToReview"{
            print("segue stuff 1 \(sender)")
            let vc = segue.destination as! writeReview
            let btn = sender as! UIButton
            wtdCourse = reviewsArray[btn.tag]
            if let wantedCourse = wtdCourse {
                vc.theCourse = wantedCourse
                print("ur segue is ready bruh")
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
        let reviewsCount = review.reviewBody.count
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

}














