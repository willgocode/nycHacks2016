//
//  ViewController.swift
//  Discharge
//
//  Created by Pat Sukhum on 3/12/16.
//  Copyright © 2016 Pat Sukhum. All rights reserved.
//

import UIKit

// The 2d dictionary containing JSON info
var info = [Int:[String:Any]]()

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var touristImg: UIButton!
    @IBOutlet weak var funImg: UIButton!
    @IBOutlet weak var histImg: UIButton!
    @IBOutlet weak var profImg: UIButton!
   

    var timer1 = NSTimer()
    var timer2 = NSTimer()
    var timer3 = NSTimer()
    var counter1 = 1
    var counter2 = 1
    var counter3 = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Timers for animations
        timer1 = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: Selector("animate1"), userInfo: nil, repeats: true)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("animate2"), userInfo: nil, repeats: true)
        timer3 = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("animate3"), userInfo: nil, repeats: true)
        
        

    }
    
    // GET request from the database
    func update(){
        let requestURL = NSURL(string: "www.linkhere.com")! //replace the link here
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {(data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let events = json["results"] as? [[String: AnyObject]] {
                        var i=0
                        for event in events {
                            info[i]!["Event_name"] = event["Event_name"]
                            info[i]!["Price"] = event["Price"]
                            info[i]!["Synopsis"] = event["Synopsis"]
                            info[i]!["Location"] = event["Location"]
                            i++
                        }
                    }

         
                }catch {
                    print("Error with Json: \(error)")
                    
                }
            }
        }
        task.resume()

    }

    // The 3 animation functions for the homescreen
    func animate1(){
        if counter1 == 3{
            counter1 = 1
        } else {
            counter1++
        }
        if let img1 = UIImage(named: "food\(counter1).png"){
            funImg.setImage(img1, forState: .Normal)
        }
    }
    
    func animate2(){
        if counter2 == 3{
            counter2 = 1
        } else {
            counter2++
        }
        if let img2 = UIImage(named: "tour\(counter2).png"){
            touristImg.setImage(img2, forState: .Normal)
        }
    }
    
    func animate3(){
        if counter3 == 3{
            counter3 = 1
        } else {
            counter3++
        }
        if let img3 = UIImage(named: "prof\(counter3).png"){
            funImg.setImage(img3, forState: .Normal)
        }
    }
 
 


    
    
    
}

