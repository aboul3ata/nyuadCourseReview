//
//  ViewControllerPannableHoriz.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/19/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class ViewControllerPannableHoriz: UIViewController {
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer!)
    }
    
    func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: view)
        
        if panGesture.state == .began {
            originalPosition = view.center
            currentPositionTouched = panGesture.location(in: view)
        } else if panGesture.state == .changed {
            view.frame.origin = CGPoint(
                x: translation.x,
                y: self.view.frame.origin.y
            )
        } else if panGesture.state == .ended {
            let velocity = panGesture.velocity(in: view)
            
            if velocity.x >= 300 {
                UIView.animate(withDuration: 0.7
                    , animations: {
                        self.view.frame.origin = CGPoint(
                            x: self.view.frame.size.width,
                            y: self.view.frame.origin.y
                        )
                }, completion: { (isCompleted) in
                    if isCompleted {
                        self.dismiss(animated: false, completion: nil)
                    }
                })
            } else {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.center = self.originalPosition!
                })
            }
        }
    }
}
