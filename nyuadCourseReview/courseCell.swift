//
//  courseCell.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/10/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class courseCell: UITableViewCell {

    @IBOutlet weak var courseLbl: UILabel!
    @IBOutlet weak var profLbl: UILabel!
    
    @IBOutlet weak var quote1: UILabel!
    @IBOutlet weak var quote0: UILabel!
    @IBOutlet weak var quote2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    
    
    // helper function for setting color
    func setColorOfText(color:String, label:UILabel){
        
        if color == "p" {
            label.textColor = UIColor(colorLiteralRed: 63/255, green: 118/255, blue: 0/255, alpha: 1)
        }
        
        if color == "n" {

                        label.textColor = UIColor(colorLiteralRed: 247/255, green: 167/255, blue: 0/255, alpha: 1)
        }
        
        if color == "b"{
            label.textColor = UIColor.red
        }
        

        
        
    }
    
    
    
    func configureCell(name:String, prof:String, traits:[String]){
    
        courseLbl.text = name
        profLbl.text = "by \(prof)"
        
        var counter = 0
        for _ in traits {
            
            
            //setting colors of quotes
            //by getting first letter in each trait
            
            let colorIndicator = traits[counter].characters
            var char = String(colorIndicator[colorIndicator.startIndex])
            
            
            if counter == 0 {
                setColorOfText(color: char, label: quote0)
                quote0.text = "\(traits[0])"
            }
            
            
            if counter == 1 {
                print("ALI counter 1 char is \(char) and label is \(quote1)")
                setColorOfText(color: char, label: quote1)
                quote1.text = "\(traits[1])"
            }
            

            if counter == 2 {
                setColorOfText(color: char, label: quote2)
                quote2.text = "\(traits[2])"
            }

            counter += 1

        }
        
        
        

    
    }

}

