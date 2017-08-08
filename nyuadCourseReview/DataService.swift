//
//  DataService.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/8/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService{
    static let instance = DataService()
    
    
    private var _REF_BASE = DB_BASE
    private var _REF_PROFESSORS = DB_BASE.child("professors")
    private var _REF_COURSES = DB_BASE.child("courses")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_PROFESSORS: DatabaseReference {
        return _REF_PROFESSORS
    }
    
    var REF_COURSES: DatabaseReference {
        return _REF_COURSES
    }
    
    
}
