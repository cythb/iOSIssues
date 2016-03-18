//
//  ViewController.swift
//  AjustSizeDemo
//
//  Created by tanghaibo on 16/3/18.
//  Copyright © 2016年 tanghaibo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var superWidthConstraints: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBtnClicked(sender: AnyObject) {
        if superWidthConstraints.constant > 100 {
            superWidthConstraints.constant = 100
        }else {
            superWidthConstraints.constant = 200
        }
    }

}

