//
//  ViewController.swift
//  SwipeDown
//
//  Created by Laura Evans on 9/5/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let swipeView = storyboard?.instantiateViewController(withIdentifier: "SwipeMeDownViewController") as! SwipeMeDownViewController
        self.present(swipeView, animated: true, completion: nil)
    }
}

