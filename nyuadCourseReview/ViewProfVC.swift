//
//  ViewProfVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/18/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class ViewProfVC: ViewControllerPannableHoriz {

    @IBOutlet weak var thumbsBadPic: UIImageView!
    @IBOutlet weak var thumbsNeutralPic: UIImageView!
    @IBOutlet weak var thumbsupPic: UIImageView!
    @IBOutlet weak var profTitle: UIButton!
    var selectedProf:String!
    @IBOutlet weak var tableView: UITableView!
    var reviewsArray = [Review]()
    var wtdCourse:Review?
    
    @IBAction func unwindToCoursesListVC2(segue: UIStoryboardSegue) {}
    @IBOutlet weak var thumbsDown: UILabel!
    @IBOutlet weak var thumbsNeutral: UILabel!
    @IBOutlet weak var thumbsup: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedProf)
        tableView.delegate = self
        tableView.dataSource = self
        
            profTitle.setTitle(selectedProf, for: .normal)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Loading data from Firebase
        //DataService.instance.loadSpecificCourses(referenceArray: ["ACS-UH 2211","ACS-UH 1010X"])
        DataService.instance.loadSpecificCourses(prof:selectedProf) { (returnedReviewsArray) in
             self.reviewsArray = returnedReviewsArray.reversed()
            print(self.reviewsArray)
            self.tableView.reloadData()
            
            
            // setting up the percentages titles!
            // Int method to remove decimal point!
            let percentages = self.recommendedPercentages(reviews: self.reviewsArray)
            print("ALI PERCENTAGES ARE \(percentages) \(self.reviewsArray[0].traits)")
            self.thumbsup.text = "\(Int(percentages["positive"]!))%"
            self.thumbsNeutral.text = "\(Int(percentages["neutral"]!))%"
            self.thumbsDown.text = "\(Int(percentages["negative"]!))%"
            self.thumbsupPic.isHidden = false
            self.thumbsNeutralPic.isHidden = false
            self.thumbsBadPic.isHidden = false
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToSelectProfVC", sender: self)
    }

    //Calculating the different percentages for each trait
    // for thumbs up image
    func recommendedPercentages(reviews:[Review]) -> [String:Double]{
        var positive = 0.0
        var neutral = 0.0
        var negative = 0.0

        for review in reviews {
            for (onetrait,num) in review.traits{
                let clrIndicator = String(onetrait[onetrait.startIndex])
                if clrIndicator == "p" {
                    positive += Double(num)
                
                }
            
                if clrIndicator == "n" {
                
                    neutral += Double(num)
                
                }
                
                if clrIndicator == "b" {
                    
                    negative += Double(num)
                }
            }
        }
        let total = negative + positive + neutral
        
        // This if is needed cuz if total is zero
        //0 divided by zero gives an error
        if total == 0 {
                let percentagesDict = ["positive":0.0,"neutral":0.0,"negative":0.0]
                return percentagesDict
        } else{
        let percentagesDict = ["positive":round(((positive*100.0)/total)),"neutral":round(((neutral*100.0)/total)),"negative":round(((negative*100.0)/total))]
        return percentagesDict
        }
    }
    
    //Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoViewCourse" {
            
            let vc2 = segue.destination as! viewCourseVC
            
            let indexPath = sender as! IndexPath
            let index = indexPath.row
            wtdCourse = reviewsArray[index]
            if let wantedCourse = wtdCourse {
                vc2.thecourse = wantedCourse
                // getting th category from reference of course as its seperated by space
                vc2.selectedCategorie = majorsReversed[wantedCourse.ref.components(separatedBy: " ").first!]
            }
            
        }
    }

}





    //MARK:- Setting up tableview and configuring cells with Firebase data after download
    extension ViewProfVC:UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return reviewsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell2") as? courseCell2 else {
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

