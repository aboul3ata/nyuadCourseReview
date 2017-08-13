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
    @IBOutlet weak var reviewsLbl: UILabel!
    
    @IBOutlet weak var reviewBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    
    
    // helper function for setting color
    // used in congfigure cell
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
        
        if color == "x"{
            label.textColor = UIColor(white: 0, alpha: 0.6)
        }
        
        
    }
    
    

    // Setting up the tableview CELLS
    func configureCell(name:String, prof:String, traits:[String], reviewNum:Int ){
    
        courseLbl.text = name
        profLbl.text = "by \(prof)"
        reviewsLbl.text = "\(reviewNum) reviews"
        
        var counter = 0
        
        quote0.text = "No reviews found"
        quote1.text = " "
        quote2.text = " "
        setColorOfText(color: "x", label: quote0)
        setColorOfText(color: "x", label: quote1)
        setColorOfText(color: "x", label: quote2)
        
        //MARK: - setting up the Quotes aka Traits
        for _ in traits {
            
            //setting colors of quotes
            //by getting first letter in each trait
            
            let colorIndicator = traits[counter].characters
            let intermediateVariable = traits[counter]
            let char = String(colorIndicator[colorIndicator.startIndex])
            
            // getting the trait from stored dictionary of all traits found in constant
            let randomQuoteNumber:Int = Int(arc4random_uniform(3)) ;
            let quoteWanted = allTraits[intermediateVariable]
            let quoteWanted2 = quoteWanted?[randomQuoteNumber]
            
            if counter == 0 {
                setColorOfText(color: char, label: quote0)

                if let quote = quoteWanted2 {
                    quote0.text = "'\(quote)'"
                }

            }
            
            
            if counter == 1 {

                setColorOfText(color: char, label: quote1)
                
                if let quote = quoteWanted2 {
                    quote1.text = "'\(quote)'"
                }

            }
            

            if counter == 2 {
                setColorOfText(color: char, label: quote2)
                
                if let quote = quoteWanted2 {
                    quote2.text = "'\(quote)'"
                }

            }

            counter += 1

        }
        

    } // end of configure cell
    
    

    
    

}

