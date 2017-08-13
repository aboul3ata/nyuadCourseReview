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
        let test = Review(name: "Digital Logic", prof: "Ozgur Sinanlu", stars: ["0":1,"1":1], traits: ["p1":2,"p2":3,"p4":7,"b3":8], reviewBody: ["tsspshihfa;oishoihusdhyysgisud sdys dtuyst duts duts d78 ds78t sd7tsodt sd ts87td8 s7td o87std8s7tdo87sdt8os7tdos87d ts8dt s7fto8f7sdto78fd fdhoy8fywefbyew8yfwe8 eowbfeow7b6few78bfe7w86fow87ft58weftaeei6a7f6it 7dgsi afe faf7 oe ea7t8sd fsdliflawefwe tfweig cewigtc twe l ewtfouft ostfw8t we8f woe fwe ftotfei7 sadf t7afd t7iwe t97weo 9efei tweft7 weft weft7wet 7wetweftfeit7dsftci7ysdft78 adftidvsftvdsfvtsdovitfdsoaovoaovfdsovsfovoa","tspp2","tsspshihfa;oishoihusdhyysgisud sdys dtuyst duts duts d78 ds78t sd7tsodt sd ts87td8 s7td o87std8s7tdo87sdt8os7tdos87d ts8dt s7fto8f7sdto78fd fdhoy8fywefbyew8yfwe8 eowbfeow7b6few78bfe7w86fow87ft58weftaeei6a7f6it 7dgsi afe faf7 oe ea7t8sd fsdliflawefwe tfweig cewigtc twe l ewtfouft ostfw8t we8f woe fwe ftotfei7 sadf t7afd t7iwe t97weo 9efei tweft7 weft weft7wet 7wetweftfeit7dsftci7ysdft78f adftidvsftvdsfvtsdovitfdsoaovoaovfdsovsfovoa"], ref: "abc")
        let test2 = Review(name: "Circuits", prof: "Mohamed Eid", stars: ["0":1,"1":1], traits: ["p1":0,"p2":0,"n2":7,"n4":8], reviewBody: ["tssp","tspp2"], ref: "abc")
        let test3 = Review(name: "Advanced Controller", prof: "Peter Voltz", stars: ["0":1,"1":1], traits: ["p1":0,"p2":0,"n1":2,"p4":8], reviewBody: ["tssp","tspp2"], ref: "abc")
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

            let vc = segue.destination as! writeReview
            let btn = sender as! UIButton
            wtdCourse = reviewsArray[btn.tag]
            if let wantedCourse = wtdCourse {
                vc.theCourse = wantedCourse
            }

        }
        
        if segue.identifier == "gotoViewCourse" {
        
            let vc2 = segue.destination as! viewCourseVC
            
            let indexPath = sender as! IndexPath
            let index = indexPath.row
            wtdCourse = reviewsArray[index]
            if let wantedCourse = wtdCourse {
                vc2.thecourse = wantedCourse
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














