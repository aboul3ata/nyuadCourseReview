//
//  roundBtn.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/8/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//



import UIKit


private var btnKey = false

extension UIView {
    
    @IBInspectable var btnDesign: Bool {
        
        get {
            
            return btnKey
        }
        
        set {
            
            btnKey = newValue
            
            if btnKey {
                
                self.layer.masksToBounds = false

                self.layer.cornerRadius = 25
                self.layer.shadowOpacity = 0.2
                self.layer.shadowRadius = 5.0
                self.layer.shadowOffset = CGSize(width: 1.0, height: 0)
                self.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 120/255).cgColor
                
            } else {
                
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
            
        }
    }
    
    
    @IBInspectable var btnDesignSmall: Bool {
        
        get {
            
            return btnKey
        }
        
        set {
            
            btnKey = newValue
            
            if btnKey {
                
                self.layer.masksToBounds = false
                
                self.layer.cornerRadius = 17.5
                self.layer.shadowOpacity = 0.2
                self.layer.shadowRadius = 5.0
                self.layer.shadowOffset = CGSize(width: 1.0, height: 0)
                self.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 120/255).cgColor
                
            } else {
                
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
            
        }
    }

    
        
        @IBInspectable var purpleBorder: Bool {
        
        get {
        
        return btnKey
        }
        
        set {
        
        btnKey = newValue
        
        if btnKey {
        

        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(colorLiteralRed: 106/255, green: 31/255, blue: 158/255, alpha: 1).cgColor

        
        } else {
        self.layer.borderWidth = 0
        }
        
        }
        
    }
    
}

    
    
