//
//  ViewController.swift
//  Touch
//
//  Created by Douglas Alexander on 4/25/18.
//  Copyright © 2018 Douglas Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var methodsStatus: UILabel!
    @IBOutlet weak var touchStatus: UILabel!
    @IBOutlet weak var tapStatus: UILabel!
    @IBOutlet weak var pointX: UILabel!
    @IBOutlet weak var pointY: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        if let touch = touches.first {
            let tapCount = touch.tapCount
            
            let point = touch.location(in: self.view)
            
            methodsStatus.text = "touches Began"
            touchStatus.text = "\(touchCount) touches"
            tapStatus.text = "\(tapCount) taps"
            
            pointX.text = "\(point.x)"
            pointY.text = "\(point.y)"
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        if let touch = touches.first {
            let tapCount = touch.tapCount
            
            methodsStatus.text = "touches moved"
            touchStatus.text = "\(touchCount) touches"
            tapStatus.text = "\(tapCount) taps"
            
            if let eventObj = event, let predictedTouches = eventObj.predictedTouches(for: touch) {
                for predictedTouch in predictedTouches {
                    let point = predictedTouch.location(in: self.view)
                    print("Predicated locations x = \(point.x)., Y = \(point.y)")
                }
                print("=============")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchCount = touches.count
        if let touch = touches.first {
            let tapCount = touch.tapCount
            
            methodsStatus.text = "touches ended"
            touchStatus.text = "\(touchCount) touches"
            tapStatus.text = "\(tapCount) taps"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

