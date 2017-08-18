//
//  testingVC.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/14/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class testingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DataService.instance.loadSpecificCourses(referenceArray: ["ACS-UH 2211"]) { (returnedReviewsArray) in
            print(returnedReviewsArray)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func uploadData(){
        
        var nameA = ["Power and Ethics of Photography","Cowboys and Indians: Mythologies of American Identity","Time","Saving Strangers: Debates about Humanitarian Interventions","Contextualizing Travel Narratives","The Art of Aesthetics of Internation Aid"]
        var codeA = ["WRIT-UH  1110 FYWS","WRIT-UH  1111 FYWS","WRIT-UH  1112 FYWS","WRIT-UH  1113 FYWS","WRIT-UH  1114 FYWS","WRIT-UH  1115 FYWS"]
        var profA = ["Unknown","James Savio","Ralph Katz","Camilla Boisen","Piia Mustamaki","Samuel Anderson"]

        for x in 0..<nameA.count {
            DataService.instance.addCourse(name: nameA[x], prof: profA[x], categorie: "WRIT-UH", code: codeA[x])
        }
    }


}
