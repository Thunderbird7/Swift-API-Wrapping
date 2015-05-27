//
//  ViewController.swift
//  APIWrapping
//
//  Created by Yuttana Kungwon on 5/26/2558 BE.
//  Copyright (c) 2558 E-Commerce Solution Co., Ltd. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBAction func refreshButton(sender: AnyObject) {
        fetchData()
    }
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchData() {
        APIWrapping.sharedManager.get("get", params: nil,
            success: { (responseObject) -> Void in
            
                println(responseObject)
                
                // Wrap JSON result with SwiftyJSON
                var json = JSON(responseObject!)
                var agent = json["headers"]["User-Agent"].string!
                self.textView.text = agent
                
        }) { (error) -> Void in
            println(error)
        }
    }

}

