//
//  numExt.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/20/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
