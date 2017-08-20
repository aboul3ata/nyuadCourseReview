//
//  percentageAlgorithm.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/20/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation



func percentageAlgorithm(reviews:[Review]) -> [String:Double]{
    var overall = 0.0
    var grading = 0.0
    var workload = 0.0
    
    
    //STEP ONE GET PERCENTAGE FOR OVERALL
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
    
    
    
    if total == 0.0 {
        overall = 13.0 // 13.0 is a special number indicating N/A
    } else {
        overall = ((positive + (0.5 * neutral))/total) * 10.0 //simple math giving neutral half weight of postive and negatice gets nth
    }
    
    //STEP TWO GET % of Grading
    
    var positive2 = 0.0
    var neutral2 = 0.0
    var negative2 = 0.0
    
    
    for review in reviews {
        for (onetrait,num) in review.traits{
            
            if onetrait == "p3" {
                positive2 += Double(num)
                
            }
            
            if onetrait == "n3" {
                
                neutral2 += Double(num)
                
            }
            
            if onetrait == "b1" {
                
                negative2 += Double(num)
            }
        }
    }
    
    let total2 = negative2 + positive2 + neutral2
    
    if total2 == 0.0 {
        grading = 13.0 // 13.0 is a special number indicating N/A
    } else {
        grading = ((positive2 + (0.5 * neutral2))/total2) * 10.0 // neutral half weight of postive and negative gets nth
    }
    
    
    var positive3 = 0.0
    var neutral3 = 0.0
    var negative3 = 0.0
    
    
    for review in reviews {
        for (onetrait,num) in review.traits{
            
            if onetrait == "p3" {
                positive3 += Double(num)
                
            }
            
            if onetrait == "n2" {
                
                neutral3 += Double(num)
                
            }
            
            if onetrait == "b4" {
                
                negative3 += Double(num)
            }
        }
    }
    
    let total3 = negative3 + positive3 + neutral3
    
    if total3 == 0.0 {
        workload = 13.0 // 13.0 is a special number indicating N/A
    } else {
        workload = ((positive3 + (0.13 * neutral3))/total3) * 10 // neutral half weight of postive and negative gets nth
    }
    
    
    let percentagesDict = ["overall":overall,"grading":grading,"workload":workload]
    return percentagesDict
    
    // This if is needed cuz if total is zero
    //0 divided by zero gives an error
    /*
    if total == 0 {
        let percentagesDict = ["positive":0.0,"neutral":0.0,"negative":0.0]
        return percentagesDict
    } else{
        let percentagesDict = ["positive":round(((positive*100.0)/total)),"neutral":round(((neutral*100.0)/total)),"negative":round(((negative*100.0)/total))]
        return percentagesDict
    }
    */
    
    
    
    
    
    
    
    
    
    
    
}
