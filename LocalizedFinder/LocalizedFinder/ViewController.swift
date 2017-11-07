//
//  ViewController.swift
//  LocalizedFinder
//
//  Created by qianjn on 2017/11/6.
//  Copyright © 2017年 SF. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var dragView: DragView!
    @IBOutlet weak var projectPath: NSTextField!
    @IBOutlet weak var parsingIndicator: NSProgressIndicator!
    @IBOutlet weak var findBtn: NSButton!
    @IBOutlet weak var findingStatelabel: NSTextField!
    @IBOutlet weak var resultPath: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    // 开始查找
    @IBAction func searchMethodAction(_ sender: Any) {
        parsingIndicator.startAnimation(nil)
    }
    
    
}

