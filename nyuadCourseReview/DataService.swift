//
//  DataService.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/8/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE2 = Database.database().reference()
let DB_BASE = DB_BASE2.child("Start").child("Courses").child("ARABL-UH")  // extra node in backend hence this weird format

class DataService{
    static let instance = DataService()
    
    
    private var _REF_BASE = DB_BASE
    private var _REF_PROFESSORS = DB_BASE.child("professors")
    //private var _REF_COURSES = DB_BASE.child("Courses")
    private var _REF_COURSES = DB_BASE
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_PROFESSORS: DatabaseReference {
        return _REF_PROFESSORS
    }
    
    var REF_COURSES: DatabaseReference {
        return _REF_COURSES
    }
    
    
    
    // Retrieving all the reviews from Firebase
    
    func getAllReviews(handler: @escaping (_ messages: [Review]) -> ()) {
        var reviewsArray = [Review]()
        REF_COURSES.observeSingleEvent(of: .value, with: { (reviewSnapshot) in
            guard let reviewSnapshot = reviewSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for x in reviewSnapshot {
                let prof = x.childSnapshot(forPath: "Prof").value as! String
                let name = x.childSnapshot(forPath: "Name").value as! String
                let traits = x.childSnapshot(forPath: "Traits").value as? Dictionary<String, Int>
                let stars = x.childSnapshot(forPath: "Stars").value as? Dictionary<String, Int>
                print("starss are \(stars) \(x.childSnapshot(forPath: "Traits").value)")
                let review = Review(name: name, prof: prof, stars:stars!, traits: traits!, reviewBody: ["love him","Hate him"])
                reviewsArray.append(review)
            }
            
            handler(reviewsArray)
        })
    }
    
    
    
    
    
    
    

    
}
