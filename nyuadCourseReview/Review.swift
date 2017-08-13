//
//  review.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/10/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation

class Review {


    private var _name:String
    private var _ref:String
    private var _prof:String
    private var _stars:[String:Int]
    private var _traits:[String:Int]
    private var _reviewBody:[String]
    
    
    var name: String {
        return _name
    }
    
    var ref: String {
        return _ref
    }

    var prof: String {
        return _prof
    }
    
    var stars: [String:Int] {
        return _stars
    }
    
    var traits: [String:Int] {
        return _traits
    }
    
    var reviewBody: [String] {
        return _reviewBody
    }
    
    
    
    
    init(name:String, prof:String, stars:[String:Int], traits:[String:Int], reviewBody:[String],ref:String) {
        self._name = name
        self._prof = prof
        self._traits = traits
        self._stars = stars
        self._reviewBody = reviewBody
        self._ref = ref
    }


}
