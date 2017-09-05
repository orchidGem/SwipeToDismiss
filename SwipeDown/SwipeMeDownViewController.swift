//
//  SwipeMeDownViewController.swift
//  SwipeDown
//
//  Created by Laura Evans on 9/5/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit

class SwipeMeDownViewController: UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    var scrolledAtTop: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(swipeDown(gestureRecognizer:)))
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)
        
        scrollView.delegate = self
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func swipeDown(gestureRecognizer: UIPanGestureRecognizer) {
        
        if scrolledAtTop == false {
            return
        }
        
        scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: false)
        
        let touchPoint = gestureRecognizer.location(in: self.view?.window)
        print("touchpoint", touchPoint)
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            print("began")
            initialTouchPoint = touchPoint
        } else if gestureRecognizer.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                print("changed")
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if gestureRecognizer.state == UIGestureRecognizerState.ended || gestureRecognizer.state == UIGestureRecognizerState.cancelled {
            print("cancelled or ended")
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("did end decelerating")
        checkIfScrolledToTop()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("did end dragging")
        checkIfScrolledToTop()
    }
    
    func checkIfScrolledToTop() {
        if scrollView.contentOffset.y <= 0 {
            print("true")
            scrolledAtTop = true
        } else {
            print("False")
            scrolledAtTop = false
        }
    }

}
