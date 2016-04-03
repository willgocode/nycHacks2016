//
//  exView.swift
//  Discharge
//
//  Created by Pat Sukhum on 3/12/16.
//  Copyright © 2016 Pat Sukhum. All rights reserved.
//

import UIKit

class tourist: UIViewController {
    
    var timer1 = NSTimer()
    var timer2 = NSTimer()
    var timer3 = NSTimer()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var exgif: UIImageView!
    @IBAction func ex1(sender: UIButton) {
        timer1 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("animate1"), userInfo: nil, repeats: true)
        timer2.invalidate()
        timer3.invalidate()
    }
    @IBAction func ex2(sender: UIButton) {
          timer2 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("animate2"), userInfo: nil, repeats: true)
        timer1.invalidate()
        timer3.invalidate()
    }
    
    @IBAction func ex3(sender: UIButton) {
          timer3 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("animate3"), userInfo: nil, repeats: true)
              timer1.invalidate()
              timer2.invalidate()
    }
    
    
    var counter1 = 1
    var counter2 = 1
    var counter3 = 1


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 1500
 
    }
    func animate1(){
        if counter1 == 4{
            counter1 = 1
        } else {
            counter1++
        }
        if let img1 = UIImage(named: "ex1.\(counter1).JPG"){
            exgif.image = img1
        }
    }
    
    func animate2(){
        if counter2 == 4{
            counter2 = 1
        } else {
            counter2++
        }
        if let img1 = UIImage(named: "ex3.\(counter2).JPG"){
            exgif.image = img1
        }
    }
    
    func animate3(){
        if counter3 == 4{
            counter3 = 1
        } else {
            counter3++
        }
        if let img1 = UIImage(named: "ex5.\(counter3).JPG"){
            exgif.image = img1
        }
    }
    
  
    
    
}




