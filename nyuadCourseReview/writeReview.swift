//
//  writeReview.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/12/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class writeReview: UIViewController {

    @IBOutlet weak var starsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    //Setting image stars
    @IBAction func starsPressed (_ sender: UIButton){
        starsImage.image = UIImage(named: "Stars\(sender.tag)")
        print("BTN PRESSED")

    }

}
