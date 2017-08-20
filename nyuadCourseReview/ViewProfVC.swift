//
//  ViewProfVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/18/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class ViewProfVC: ViewControllerPannableHoriz {

    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var thumbsBadPic: UIImageView!
    @IBOutlet weak var thumbsNeutralPic: UIImageView!
    @IBOutlet weak var thumbsupPic: UIImageView!
    @IBOutlet weak var profTitle: UIButton!
    var selectedProf:String!
    @IBOutlet weak var tableView: UITableView!
    var reviewsArray = [Review]()
    var wtdCourse:Review?
    
    @IBAction func unwindToCoursesListVC2(segue: UIStoryboardSegue) {}
    @IBAction func unwindToViewProf(segue: UIStoryboardSegue) {}
    
    @IBOutlet weak var overallLbl: UILabel!
    @IBOutlet weak var workloadLbl: UILabel!
    @IBOutlet weak var gradingLbl: UILabel!
    
    @IBOutlet weak var gradingDescLbl: UILabel!
    @IBOutlet weak var workloadDescLbl: UILabel!
    @IBOutlet weak var overallDescLbl: UILabel!
    
    @IBOutlet weak var percentagesStack: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedProf)
        tableView.delegate = self
        tableView.dataSource = self
        
            profTitle.setTitle(selectedProf, for: .normal)
        self.activityIndicator.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Loading data from Firebase
        DataService.instance.loadSpecificCourses(prof:selectedProf) { (returnedReviewsArray) in
             self.reviewsArray = returnedReviewsArray.reversed()
            print(self.reviewsArray)
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            
            
            // setting up the percentages titles!
            // Int method to remove decimal point!
            let percentages = percentageAlgorithm(reviews: self.reviewsArray)
            print("ALI PERCENTAGES ARE \(percentages) \(self.reviewsArray[0].traits)")
            
            
            //SET UP FIRST PERCENTAGE:GRADING
            if let gradingTraitDouble = percentages["grading"] {
            let gradingTraitInt = gradingTraitDouble.rounded(toPlaces: 1)
            
            
                // 13 is special number given out by the algorithms
                // in case value not available
                if gradingTraitDouble == 13.0 {
                self.gradingLbl.text = " "
                } else {
            self.gradingLbl.text = "\(gradingTraitInt)/10"
                }
            
                
                switch gradingTraitInt {
                
                case 0.0...4.0:
                    self.thumbsupPic.image = UIImage(named: "thumbsdown")
                    self.gradingDescLbl.text = "'Harsh'"
                case 4.0...8.0:
                    self.thumbsupPic.image = UIImage(named: "thumbsneutral")
                    self.gradingDescLbl.text = "'Fair'"
                    
                case 8.0...10.0:
                    self.thumbsupPic.image = UIImage(named: "thumbsup")
                    self.gradingDescLbl.text = "'Easy A'"
                default:
                    self.thumbsupPic.image = UIImage(named: "thumbsna")
                    self.gradingDescLbl.text = "N/A"
                }

                
            } // END OF GRADING SETUP
            
            
            
            //SET UP SECOND PERCENTAGE:Workload
            if let workloadTraitDouble = percentages["workload"] {
                let workloadTraitInt = workloadTraitDouble.rounded(toPlaces: 1)
                
                
                // 13 is special number given out by the algorithms
                // in case value not available
                if workloadTraitDouble == 13.0 {
                    self.workloadLbl.text = " "
                } else {
                    self.workloadLbl.text = "\(workloadTraitInt)/10"
                }
                
                
                switch workloadTraitInt {
                    
                case 0.0...4.0:
                    self.thumbsNeutralPic.image = UIImage(named: "thumbsdown")
                    self.workloadDescLbl.text = "'Heavy!'"
                case 4.0...8.0:
                    self.thumbsNeutralPic.image = UIImage(named: "thumbsneutral")
                    self.workloadDescLbl.text = "'Medium'"
                    
                case 8.0...10.0:
                    self.thumbsNeutralPic.image = UIImage(named: "thumbsup")
                    self.workloadDescLbl.text = "'Light'"
                default:
                    self.thumbsNeutralPic.image = UIImage(named: "thumbsna")
                    self.workloadDescLbl.text = "N/A"
                }
                
                
            } // END OF Workload SETUP
            
            
            
            //SET UP THIRD PERCENTAGE:OVERALL
            if let overallTraitDouble = percentages["overall"] {
                let overallTraitInt = overallTraitDouble.rounded(toPlaces: 1)
                
                
                // 13 is special number given out by the algorithms
                // in case value not available
                if overallTraitDouble == 13.0 {
                    self.overallLbl.text = " "
                } else {
                    self.overallLbl.text = "\(overallTraitInt)/10"
                }
                
                
                switch overallTraitInt {
                    
                case 0.0...4.0:
                    self.thumbsBadPic.image = UIImage(named: "thumbsdown")
                    self.overallDescLbl.text = "'Horrible'"
                case 4.0...8.0:
                    self.thumbsBadPic.image = UIImage(named: "thumbsneutral")
                    self.overallDescLbl.text = "'O.K'"
                    
                case 8.0...10.0:
                    self.thumbsBadPic.image = UIImage(named: "thumbsup")
                    self.overallDescLbl.text = "'Amazing'"
                default:
                    self.thumbsBadPic.image = UIImage(named: "thumbsna")
                    self.overallDescLbl.text = "N/A"
                }
                
                
            } // END OF Overall SETUP
            
            
            self.percentagesStack.isHidden = false
            
            
            
            
            
            
            

        }//end of closure for Firebase
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToSelectProfVC", sender: self)
    }

    

    
    @IBAction func reviewbtnpressed(_ sender: UIButton) {
                self.performSegue(withIdentifier: "gotoWriteReview", sender: sender)
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
                vc2.selectedCategorie = wantedCourse.ref.components(separatedBy: " ").first!
            }
            
        }
        
        
        if segue.identifier == "gotoWriteReview" {
            
            let vc = segue.destination as! writeReview
            let btn = sender as! UIButton
            wtdCourse = reviewsArray[btn.tag]
            if let wantedCourse2 = wtdCourse {
                vc.theCourse = wantedCourse2
                vc.theCategorie = wantedCourse2.ref.components(separatedBy: " ").first!
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

