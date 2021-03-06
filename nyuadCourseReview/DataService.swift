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
let DB_BASE = DB_BASE2.child("Start").child("Courses")  // extra node in backend hence this weird format

class DataService{
    static let instance = DataService()
    
    private var _REF_BASIC = Database.database().reference().child("Start").child("Courses")
    private var _REF_BASE = DB_BASE
    private var _REF_PROFESSORS = Database.database().reference().child("Start").child("Professors")
    //private var _REF_COURSES = DB_BASE.child("Courses")
    private var _REF_COURSES = DB_BASE
    
    var REF_BASIC: DatabaseReference {
        return _REF_BASIC
    }
    
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
    
    func getAllReviews(categorie:String, handler: @escaping (_ messages: [Review]) -> ()) {
        var reviewsArray = [Review]()
        REF_COURSES.child(categorie).observeSingleEvent(of: .value, with: { (reviewSnapshot) in
            guard let reviewSnapshot = reviewSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for x in reviewSnapshot {
                let prof = x.childSnapshot(forPath: "Prof").value as! String
                let name = x.childSnapshot(forPath: "Name").value as! String
                let traits = x.childSnapshot(forPath: "Traits").value as? Dictionary<String, Int>
                let stars = x.childSnapshot(forPath: "Stars").value as? Dictionary<String, Int>
                let ref = x.childSnapshot(forPath: "Ref").value as! String
                let commentsAll = x.childSnapshot(forPath: "Reviews").value as? Dictionary<String, String>
                var commentsArray = [String]()

                
                
                if let commentsAll = commentsAll {
                
                    for (_,eachComment) in commentsAll {
                        commentsArray.append(eachComment)
                    }
                
                } else {
                    commentsArray = ["No comments yet available"]
                
                }
                
            
                
                let review = Review(name: name, prof: prof, stars:stars!, traits: traits!, reviewBody: commentsArray,ref:ref)
                reviewsArray.append(review)
            }
            
            handler(reviewsArray)
        })
    }
    
    //DO NOT USE THIS FUNCTION
    //ONLY INTENDED FOR INITAL SETUP OF PROFS
    //ONLY USE IF DB NEEDS TO BE UPDATED!
    func createProfDataBase() {
            REF_COURSES.observeSingleEvent(of: .value, with: { (reviewSnapshot) in
            guard let reviewSnapshot = reviewSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for x in reviewSnapshot {
                guard let y = x.children.allObjects as? [DataSnapshot] else { return }
                for yz in y {
                    let prof = yz.childSnapshot(forPath: "Prof").value as! String
                    let course = yz.childSnapshot(forPath: "Ref").value as! String
                    let REF_PROF = Database.database().reference().child("Start").child("Professors")
                    let courseN = REF_PROF.child(prof).childByAutoId()
                    courseN.setValue(course)
                }
            }
        })
    }
    
    
    func getAllProf(handler: @escaping (_ messages: [String]) -> ()) {
        var profArray = [String]()
        REF_PROFESSORS.observeSingleEvent(of: .value, with: { (reviewSnapshot) in
            guard let reviewSnapshot = reviewSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for x in reviewSnapshot {
                profArray.append(x.key)
            }
            handler(profArray)
        })
    }

    
    func addCourse(name:String,prof:String,categorie:String,code:String){
        REF_BASIC.child(categorie).child(code).updateChildValues(["Prof":prof,"Name":name,"Stars":[
            "s1":0,
            "s2":0,
            "s3":0,
            "s4":0,
            "s5":0,],"Traits":[
            "p1":0,
            "p2":0,
            "p3":0,
            "p4":0,
            "n1":0,
            "n2":0,
            "n3":0,
            "n4":0,
            "b1":0,
            "b2":0,
            "b3":0,
            "b4":0,],"Ref":code
            ])
    }
    
    //USED when searching to professor!
    func loadSpecificCourses(prof:String,handler: @escaping (_ messages: [Review]) -> ()){
        
        var referenceArray = [String]()
        REF_PROFESSORS.child(prof).observeSingleEvent(of: .value, with: { (reviewSnapshot) in
            guard let reviewSnapshot = reviewSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for x in reviewSnapshot {
                referenceArray.append(x.value as! String)
            }

        
        var reviewsArray = [Review]()
        for singleReference in referenceArray {
            
            let categoryReference = singleReference.components(separatedBy: " ").first
            let Ref = self.REF_COURSES.child(categoryReference!)
        
            Ref.queryOrdered(byChild: "Ref").queryEqual(toValue: singleReference).observe(.childAdded ,with: { (snapshot) in
            
                if  let post = snapshot.value as? [String : AnyObject] {
                    
                    let prof =  post["Prof"] as! String
                    let name = post["Name"] as! String
                    let traits = post["Traits"] as? Dictionary<String, Int>
                    let stars = post["Stars"] as? Dictionary<String, Int>
                    let ref = post["Ref"] as! String
                    let commentsAll = post["Reviews"] as? Dictionary<String, String>
                    var commentsArray = [String]()
                    
                    print()
                    if let commentsAll = commentsAll {
                        
                        for (_,eachComment) in commentsAll {
                            commentsArray.append(eachComment)
                        }
                        
                    } else {
                        commentsArray = ["No comments yet available"]
                        
                    }
                    
                    
                    
                    let review = Review(name: name, prof: prof, stars:stars!, traits: traits!, reviewBody: commentsArray,ref:ref)
                    reviewsArray.append(review)
                    
                
                }
            handler(reviewsArray)
            })
        
        }
        
        })
        
    }


    
}
