//
//  viewCourseVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/13/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class viewCourseVC: UIViewController {
    
    var traitsDict = [String:Int]()
    var numArray = [String]()
    var valueArray = [String]()
    var thecourse:Review!
    var selectedCategorie:String!
    
    @IBOutlet weak var block1: UIView!
    @IBOutlet weak var block2: UIView!
    @IBOutlet weak var block3: UIView!
    @IBOutlet weak var block4: UIView!
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    @IBOutlet weak var num4: UILabel!
    
    @IBOutlet weak var text1: UILabel!
    
    @IBOutlet weak var text2: UILabel!

    @IBOutlet weak var text3: UILabel!
    
    @IBOutlet weak var text4: UILabel!
    @IBOutlet weak var noReviewsPic: UIImageView!
    
    @IBOutlet weak var profTitle: UILabel!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setting up the course title
        courseTitle.text = thecourse.name
        profTitle.text = "by \(thecourse.prof)"
        
        
        
        if thecourse.reviewBody[0] == "No comments yet available" {
            noReviewsPic.isHidden = false

        }
        // changing height dynamically
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Sorting Dictionary of Traits and retrieving top 3 only!
        
        var counter = 0
        for (k,v) in (Array(thecourse.traits).sorted {$0.1 > $1.1}) {
            if counter < 4 {
                if v > 0 {
                    valueArray.append(k)
                    numArray.append("\(v)")
                }
            }
            counter += 1
        }
        
        // Changing layout according to traits
        
        if valueArray.count != 0 {
        
        for x in 0..<valueArray.count {
            
            switch x {
            case 0:
                block1.isHidden = false
                num1.text = "\(numArray[0])"
                let char = String(valueArray[0][valueArray[0].startIndex])
                let bgColor = getColor(indicator: char)
                block1.backgroundColor = bgColor
                text1.text = traitBtnLbls[valueArray[0]]
                print("case 1")
            case 1:
                block2.isHidden = false
                let char = String(valueArray[1][valueArray[1].startIndex])
                let bgColor = getColor(indicator: char)
                block2.backgroundColor = bgColor
                num2.text = "\(numArray[1])"
                text2.text = traitBtnLbls[valueArray[1]]
                print("case 2")
            case 2:
                block3.isHidden = false
                let char = String(valueArray[2][valueArray[2].startIndex])
                let bgColor = getColor(indicator: char)
                block3.backgroundColor = bgColor
                num3.text = "\(numArray[2])"
                text3.text = traitBtnLbls[valueArray[2]]
            case 3:
                block4.isHidden = false
                let char = String(valueArray[3][valueArray[3].startIndex])
                let bgColor = getColor(indicator: char)
                block4.backgroundColor = bgColor
                num4.text = "\(numArray[3])"
                text4.text = traitBtnLbls[valueArray[3]]
            default:
                print("default case")
            }
        
        }
    }
        

    }
    
    //Back btn pressed

    @IBAction func backBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToCoursesListVC2", sender: self)
    }
    
    func getColor (indicator:String) -> UIColor {
        switch indicator {
        case "p":
            return greenColor
        case "n":
            return orangeColor
        case "b":
            return redColor
        default:
            return UIColor(white: 0, alpha: 0.6)
        }

    }
    
    
    @IBAction func reviewPressed(_ sender: Any) {
        
            self.performSegue(withIdentifier: "gotoWriteReview", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoWriteReview"{
            
            let vc = segue.destination as! writeReview
            vc.theCourse = thecourse
            //getting the categorie of the course
            vc.theCategorie = selectedCategorie
            
    }

}
}
extension viewCourseVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thecourse.reviewBody.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewBodyCell") as? reviewBodyCell else {
            return UITableViewCell()
        }
        cell.configureCell(review: thecourse.reviewBody[indexPath.row])
        return cell

    
    }

}


