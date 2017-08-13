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
    
    @IBOutlet weak var block1: UIView!
    @IBOutlet weak var block2: UIView!
    @IBOutlet weak var block3: UIView!
    @IBOutlet weak var block4: UIView!
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    @IBOutlet weak var num4: UILabel!
    
    

    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                num1.text = "\(numArray[0]) \(valueArray[0]) "
                
                print("case 1")
            case 1:
                block2.isHidden = false
                num2.text = "\(numArray[1]) \(valueArray[1]) "
                print("case 2")
            case 2:
                block3.isHidden = false
                num3.text = "\(numArray[2]) \(valueArray[2]) "
                print("case 3")
            case 3:
                block4.isHidden = false
                num4.text = "\(numArray[3]) \(valueArray[3]) "
                print("case 4")
            default:
                print("default case")
            }
        
        }
    }
        

    }


    



}
